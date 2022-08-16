// ignore_for_file: avoid_void_async, always_specify_types, unawaited_futures

import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/chatNodes.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:permission_handler/permission_handler.dart';

enum CallStatus { none, calling, inCall, timedOut }

class Sagora extends GetxController {
  late final RtcEngine _engine;

  RtcEngine get engine => _engine;
  // late TextEditingController _controller;
  StreamController<String> _infoStrings = StreamController.broadcast();
  Stream<String> get agoraLogs => _infoStrings.stream;
  // Call Action
  final Rx<CallStatus> callAction = CallStatus.none.obs;
  @override
  void onInit() {
    checkAgoraPermissions();
    _initAgora().then((value) => _startListeningOnCallEvents());
    super.onInit();
  }

  @override
  void onClose() {
    removeSession();
    _engine.destroy();
    super.onClose();
  }

  Future<bool> checkAgoraPermissions() async {
    bool isPermissionGranted = false;
    if (getPlatformType() == MezPlatform.ANDROID) {
      isPermissionGranted = await Permission.microphone.request().isGranted;
      mezDbgPrint(isPermissionGranted);
      if (isPermissionGranted) {
        return true;
      } else
        return false;
    } else
      return true;
  }

  Future<void> _initAgora() async {
    //create the engine
    _engine = await RtcEngine.createWithContext(RtcEngineContext(agoraAppId));
    _engine.setEventHandler(RtcEngineEventHandler(
      error: (code) {
        final info = '👻👻👻👻👻 onError: $code';
        _infoStrings.add(info);
      },
      joinChannelSuccess: (channel, uid, elapsed) {
        final info = '👻👻👻👻👻 onJoinChannel: $channel, uid: $uid';
        _infoStrings.add(info);
      },
      leaveChannel: (stats) {
        _infoStrings.add(' 👻👻👻👻👻 onLeaveChannel');
        removeSession();

        // if (Get.currentRoute == kAgoraCallScreen) {
        //   Get.back<void>();
        // }
      },
      userJoined: (uid, elapsed) {
        final info = '👻👻👻👻👻 userJoined: $uid';
        _infoStrings.add(info);
        callAction.value = CallStatus.inCall;
      },
      userOffline: (uid, reason) {
        final info = '👻👻👻👻👻 userOffline: $uid , reason: $reason';
        _infoStrings.add(info);
      },
    ));

    await _engine.enableAudio();
    await _engine.disableVideo();
    await _engine.setChannelProfile(ChannelProfile.Communication);
  }

  Future<void> joinChannel({
    required String token,
    required String channelId,
    required int uid,
  }) async {
    // mezDbgPrint(" 👻👻👻 JOIN CHANNEL CALLED !!!! 👻👻👻  ");
    mezDbgPrint("👻👻👻 Joining using : $token | $channelId | $uid");
    await _engine.joinChannel(token, channelId, null, uid);
  }

  Future<void> removeSession({String? chatId}) async {
    await _engine.leaveChannel();
    if (chatId != null) {
      await FlutterCallkitIncoming.endCall({"chatId": chatId});
    } else
      await FlutterCallkitIncoming.endAllCalls();
  }

  Future<DatabaseEvent> getAgoraToken(
      String chatId, String userId, ParticipantType type) async {
    mezDbgPrint("Listening once on ${agoraChatNode(chatId, userId, type)}");
    final DatabaseEvent ev = await (FirebaseDatabase.instance
        .ref()
        .child(agoraChatNode(chatId, userId, type))
        .once(DatabaseEventType.value));

    if ((ev.snapshot.value as dynamic)?['expirationTime'] != null &&
        (ev.snapshot.value as dynamic)?['token'] != null &&
        (ev.snapshot.value as dynamic)?['uid'] != null) {
      mezDbgPrint(
        "[+] Agora Node Data ✅ filled : ${ev.snapshot.value}",
      );
      return Future.value(ev);
    } else {
      mezDbgPrint(
        "[+] Agora Node Data not filled yet , only got : ${ev.snapshot.value}",
      );
      return getAgoraToken(chatId, userId, type);
    }
  }

  void _startListeningOnCallEvents() {
    FlutterCallkitIncoming.onEvent.listen((CallEvent? event) async {
      mezDbgPrint("CallEvent ===>  $event");

      switch (event?.name) {
        case CallEvent.ACTION_CALL_DECLINE:
          mezDbgPrint("CallEvent.DECLINED !");
          final MessageController _msgCtrl = Get.find<MessageController>();
          _msgCtrl.endCall(
            chatId: event!.body['extra']['chatId'],
            callee: Participant(
              image: event.body['avatar'],
              name: event.body['nameCaller'],
              participantType: event.body['extra']['callerType']
                  .toString()
                  .toParticipantType(),
              id: event.body['extra']['callerId'],
            ),
          );
          callAction.value = CallStatus.none;
          await FlutterCallkitIncoming.endAllCalls();
          // change to decline to update view parts.
          // if (Get.currentRoute == kAgoraCallScreen) Get.back<void>();
          break;
        case CallEvent.ACTION_CALL_ENDED:
          mezDbgPrint("CallEvent.ACTION_CALL_ENDED!");
          if (event!.body?['extra']?['chatId'] != null) {
            await Get.find<MessageController>().endCall(
              chatId: event.body?['extra']['chatId'],
              callee: Participant(
                image: event.body['avatar'],
                name: event.body['nameCaller'],
                participantType: event.body['extra']['callerType']
                    .toString()
                    .toParticipantType(),
                id: event.body['extra']['callerId'],
              ),
            );
          }
          // change to ended to update view parts.
          callAction.value = CallStatus.none;

          // if (Get.currentRoute == kAgoraCallScreen) {
          //   Get.back<void>(closeOverlays: true);
          // }
          break;
        case CallEvent.ACTION_CALL_ACCEPT:
          if ((await checkAgoraPermissions())) {
            // it's better to send token and chatId withing the variableParams on call notif
            // that way we wont need to fetch the token and uid from db, using the bellow line :
            // final dynamic agoraAuth = await _sagora.getAgoraToken();
            mezDbgPrint(
                "🎃🎃🎃 ACTION_CALL_ACCEPT::   Calling [_sagora.joinChannel] with extra::uid ${event?.body}");
            joinChannel(
              token: event!.body?['extra']['agoraToken'],
              channelId: event.body?['extra']['chatId'],
              uid: //5774112,
                  int.parse(
                event.body!['extra']['calleeuid'],
              ),
            );
            // change to Accept to update view parts.
            callAction.value = CallStatus.inCall;
            // Pushing to call screen + awaiting in case we wanna return with value.
            // ignore: unawaited_futures
            Get.toNamed<void>(kAgoraCallScreen, arguments: <String, dynamic>{
              "chatId": event.body?['extra']?['chatId'],
              "talkingTo": Participant(
                image: event.body?['avatar'],
                name: event.body?['nameCaller'],
                participantType: event.body['extra']['callerType']
                    .toString()
                    .toParticipantType(),
                // wrong actual user id, it's more like an agora generated id
                id: event.body['extra']['callerId'],
              ),
            });
          }
          break;
        default:
      }
    });
  }

  final RxBool openMicrophone = true.obs;
  Future<void> switchMicrophone() async {
    mezDbgPrint('OLD switchSpeakerphone -> ${openMicrophone.value}!!!');
    await _engine.enableLocalAudio(!openMicrophone.value).then((value) {
      openMicrophone.value = !openMicrophone.value;
      mezDbgPrint('NEW switchSpeakerphone -> ${openMicrophone.value}!!!');
    }).catchError((err) {
      mezDbgPrint('enableLocalAudio : $err');
    });
  }

  final RxBool enableSpeakerphone = false.obs;
  void switchSpeakerphone() async {
    mezDbgPrint('switchSpeakerphone -> ${enableSpeakerphone.value}!!!');

    await _engine
        .setEnableSpeakerphone(!enableSpeakerphone.value)
        .then((value) {
      mezDbgPrint('setEnableSpeakerphone Enabled!!!');

      enableSpeakerphone.value = !enableSpeakerphone.value;
    }).catchError((err) {
      mezDbgPrint('setEnableSpeakerphone $err');
    });
  }
}
