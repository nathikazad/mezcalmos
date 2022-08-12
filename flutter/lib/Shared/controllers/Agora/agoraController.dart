// ignore_for_file: avoid_void_async, always_specify_types, unawaited_futures

import 'dart:async';
import 'dart:io';

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

class Sagora extends GetxController {
  late final RtcEngine _engine;

  RtcEngine get engine => _engine;
  // late TextEditingController _controller;
  StreamController<String> _infoStrings = StreamController.broadcast();
  Stream<String> get agoraLogs => _infoStrings.stream;
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
        if (Get.currentRoute == kAgoraCallScreen) {
          Get.back<void>();
        }
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

    // int playbackSignalVolume;
    // int recordingSignalVolume;

    // int inEarVolume;
    // if (Platform.isAndroid) {
    //   playbackSignalVolume = 400;
    //   recordingSignalVolume = 100;
    //   inEarVolume = 100;
    // } else {
    //   playbackSignalVolume = 100;
    //   recordingSignalVolume = 400;
    //   inEarVolume = 400;
    // }

    await _engine.enableAudio();
    await _engine.disableVideo();
    // _engine.setAudioProfile(
    //     AudioProfile.SpeechStandard, AudioScenario.Default),
    // // // PLAYBACK DEVICE
    // // // play the audio received on this device at this volume (0 - 400)
    // _engine.adjustPlaybackSignalVolume(playbackSignalVolume),
    // // // AUDIO ENGINE
    // // // do not allow any mixed audio signals when playing audio published from this device
    // _engine.adjustAudioMixingPublishVolume(0),
    // // // do not allow any mixed audio signals to be played from this device
    // _engine.adjustAudioMixingPlayoutVolume(0),
    // // // RECORDING DEVICE
    // // // set the recording signal volume of this device
    // _engine.adjustRecordingSignalVolume(recordingSignalVolume),
    // // // set the playback volume for listeners with headphones (0 - 100)
    // _engine.setInEarMonitoringVolume(inEarVolume),
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

      switch (event?.name) {
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
          // Get.find<Sagora>().removeSession(
          //     // chatId: event.body['extra']['chatId'],
          //     );
          if (Get.currentRoute == kAgoraCallScreen) Get.back<void>();
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

          if (Get.currentRoute == kAgoraCallScreen) {
            Get.back<void>(closeOverlays: true);
          }
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

  // Methods and Callbacks
  // Future<void> _initEngine() async {
  //   _engine =
  //       await RtcEngine.createWithContext(RtcEngineContext(AgoraConfig.appId));
  //   mezDbgPrint("Agora : createWithContext done${_engine}");
  //   _addListeners();
  //   await _engine.enableAudio();
  //   mezDbgPrint("Agora : enableAudio done${_engine}");
  //   await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
  //   mezDbgPrint("Agora : setChannelProfile done${_engine}");
  //   await _engine.setClientRole(ClientRole.Broadcaster);
  //   mezDbgPrint("Agora : setClientRole done${_engine}");
  //   await _engine.joinChannel(
  //       AgoraConfig.token, AgoraConfig.channelId, null, 0);
  // }

  // void _addListeners() {
  //   _engine.setEventHandler(RtcEngineEventHandler(
  //     warning: (warningCode) {
  //       logSink.log('warning $warningCode');
  //     },
  //     error: (errorCode) {
  //       logSink.log('error $errorCode');
  //     },
  //     joinChannelSuccess: (channel, uid, elapsed) {
  //       logSink.log('[ ----.----- ] joinChannelSuccess $channel $uid $elapsed');
  //       isJoined.value = true;
  //     },
  //     leaveChannel: (stats) async {
  //       logSink.log('leaveChannel ${stats.toJson()}');
  //       isJoined.value = false;
  //     },
  //   ));
  // }

  // Future<void> joinChannel() async {
  //   if (getPlatformType() == MezPlatform.ANDROID) {
  //     await Permission.microphone.request();
  //   }

  //   await _engine
  //       .joinChannel(AgoraConfig.token, AgoraConfig.channelId, null,
  //           AgoraConfig.uid.value!)
  //       .catchError((onError) {
  //     logSink.log('error ${onError.toString()}');
  //   });
  // }

  // Future<void> leaveChannel() async {
  //   await _engine.leaveChannel();
  //   isJoined.value = false;
  //   openMicrophone.value = true;
  //   enableSpeakerphone.value = true;
  //   playEffect.value = false;
  //   enableInEarMonitoring.value = false;
  //   recordingVolume.value = 100;
  //   playbackVolume.value = 100;
  //   inEarMonitoringVolume.value = 100;
  // }

  final RxBool openMicrophone = true.obs;
  Future<void> switchMicrophone() async {
    // await _engine.muteLocalAudioStream(!openMicrophone);
    await _engine.enableLocalAudio(!openMicrophone.value).then((value) {
      openMicrophone.value = !openMicrophone.value;
    }).catchError((err) {
      mezDbgPrint('enableLocalAudio : $err');
    });
  }

  final RxBool enableSpeakerphone = false.obs;
  void switchSpeakerphone() async {
    await _engine
        .setEnableSpeakerphone(!enableSpeakerphone.value)
        .then((value) {
      mezDbgPrint('setEnableSpeakerphone Enabled!!!');

      enableSpeakerphone.value = !enableSpeakerphone.value;
    }).catchError((err) {
      mezDbgPrint('setEnableSpeakerphone $err');
    });
  }

  // Future<void> switchEffect() async {
  //   if (playEffect.value) {
  //     _engine.stopEffect(1).then((value) {
  //       playEffect.value = false;
  //     }).catchError((err) {
  //       logSink.log('stopEffect $err');
  //     });
  //   } else {
  //     final path = (await _engine
  //         .getAssetAbsolutePath("assets/sounds/notif-alert.mp3"))!;
  //     _engine
  //         .playEffect(1, path, 0, 1, 1, 100, openMicrophone.value)
  //         .then((value) {
  //       playEffect.value = true;
  //     }).catchError((err) {
  //       logSink.log('playEffect $err');
  //     });
  //   }
  // }

  // Future<void> onChangeInEarMonitoringVolume(double value) async {
  //   inEarMonitoringVolume.value = value;
  //   await _engine.setInEarMonitoringVolume(inEarMonitoringVolume.toInt());
  //   refresh();
  // }

  // Future<void> toggleInEarMonitoring(value) async {
  //   enableInEarMonitoring = value;
  //   await _engine.enableInEarMonitoring(enableInEarMonitoring.value);
  //   refresh();
  // }

}
