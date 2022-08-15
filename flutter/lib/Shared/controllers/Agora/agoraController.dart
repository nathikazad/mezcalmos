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

enum CallAction { calling, accepted, ended, declined, none }

class Sagora extends GetxController {
  late final RtcEngine _engine;

  RtcEngine get engine => _engine;
  // late TextEditingController _controller;
  StreamController<String> _infoStrings = StreamController.broadcast();
  Stream<String> get agoraLogs => _infoStrings.stream;
  // Call Action
  Rx<CallAction> _callAction = CallAction.none.obs;
  CallAction get callAction => _callAction.value;
  void set callAction(CallAction action) => _callAction.value = action;

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

  void joinChannel({
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
    return FirebaseDatabase.instance
        .ref()
        .child(agoraChatNode(chatId, userId, type))
        .onValue
        .first;
  }

  void _startListeningOnCallEvents() {
    FlutterCallkitIncoming.onEvent.listen((CallEvent? event) async {
      mezDbgPrint("CallEvent ===>  $event");

      FlutterCallkitIncoming.showMissCallNotification(event!.body)
          .then((value) => mezDbgPrint("==== value ===> $value \n========"));

      switch (event?.name) {
        case CallEvent.ACTION_CALL_TIMEOUT:
          mezDbgPrint("CallEvent.TIMEOUT  ${event?.body}!");
          FlutterCallkitIncoming.showCallkitIncoming(event!.body);
          break;
        // final MessageController _msgCtrl = Get.find<MessageController>();
        // _msgCtrl.endCall(
        //   chatId: event?.body['extra']['chatId'],
        //   callee: Participant(
        //     image: event!.body['avatar'],
        //     name: event.body['nameCaller'],
        //     participantType: event.body['extra']['callerType']
        //         .toString()
        //         .toParticipantType(),
        //     id: event.body['extra']['callerId'],
        //   ),
        // );
        // await Get.find<Sagora>().removeSession();
        // // change to decline to update view parts.
        // _callAction.value = CallAction.none;
        // break;

        case CallEvent.ACTION_CALL_DECLINE:
          mezDbgPrint("CallEvent.DECLINED !");
          final MessageController _msgCtrl = Get.find<MessageController>();
          _msgCtrl.endCall(
            chatId: event?.body['extra']['chatId'],
            callee: Participant(
              image: event!.body['avatar'],
              name: event.body['nameCaller'],
              participantType: event.body['extra']['callerType']
                  .toString()
                  .toParticipantType(),
              id: event.body['extra']['callerId'],
            ),
          );
          await FlutterCallkitIncoming.endAllCalls();
          // change to decline to update view parts.
          _callAction.value = CallAction.declined;
          // if (Get.currentRoute == kAgoraCallScreen) Get.back<void>();
          break;
        case CallEvent.ACTION_CALL_ENDED:
          mezDbgPrint("CallEvent.ACTION_CALL_ENDED!");
          if (event?.body?['extra']?['chatId'] != null) {
            await Get.find<MessageController>().endCall(
              chatId: event?.body?['extra']['chatId'],
              callee: Participant(
                image: event!.body['avatar'],
                name: event.body['nameCaller'],
                participantType: event.body['extra']['callerType']
                    .toString()
                    .toParticipantType(),
                id: event.body['extra']['callerId'],
              ),
            );
          }
          // change to ended to update view parts.
          _callAction.value = CallAction.ended;

          // if (Get.currentRoute == kAgoraCallScreen) {
          //   Get.back<void>(closeOverlays: true);
          // }
          break;
        case CallEvent.ACTION_CALL_ACCEPT:
          final Sagora _sagora = Get.find<Sagora>();
          if ((await _sagora.checkAgoraPermissions())) {
            // it's better to send token and chatId withing the variableParams on call notif
            // that way we wont need to fetch the token and uid from db, using the bellow line :
            // final dynamic agoraAuth = await _sagora.getAgoraToken();
            mezDbgPrint(
                "🎃🎃🎃 ACTION_CALL_ACCEPT::   Calling [_sagora.joinChannel] with extra::uid ${event?.body}");
            joinChannel(
              token: event?.body?['extra']['agoraToken'],
              channelId: event?.body?['extra']['chatId'],
              uid: //5774112,
                  int.parse(
                event!.body!['extra']['calleeuid'],
              ),
            );
            // change to Accept to update view parts.
            _callAction.value = CallAction.accepted;
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
