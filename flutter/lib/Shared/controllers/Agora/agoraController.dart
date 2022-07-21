// ignore_for_file: avoid_void_async, always_specify_types, unawaited_futures

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:get/state_manager.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/firebaseNodes/chatNodes.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:permission_handler/permission_handler.dart';

class Sagora extends GetxController {
  late final RtcEngine _engine;

  RtcEngine get engine => _engine;
  // late TextEditingController _controller;

  @override
  void onInit() {
    checkAgoraPermissions();
    _initAgora();
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
    await _engine.enableAudio();
    await _engine.setChannelProfile(ChannelProfile.Communication);
  }

  void joinChannel({
    required String token,
    required String channelId,
    required int uid,
  }) async {
    _engine.setEventHandler(
      RtcEngineEventHandler(
        error: (err) {
          mezDbgPrint("Runtime Error happend $err");
        },
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          mezDbgPrint("local user $uid joined");
        },
        userJoined: (int uid, int elapsed) {
          mezDbgPrint("remote user $uid joined");
        },
        leaveChannel: (state) {
          mezDbgPrint("onLeaveChannel : duration : ${state.duration}");
        },
        userOffline: (int uid, UserOfflineReason reason) {
          mezDbgPrint("remot1e user $uid left channel");
        },
      ),
    );

    await _engine.joinChannel(token, channelId, null, uid);
  }

  Future<void> removeSession() async {
    await FlutterCallkitIncoming.endAllCalls();
    _engine.leaveChannel();
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

  // Future<void> switchMicrophone() async {
  //   // await _engine.muteLocalAudioStream(!openMicrophone);
  //   await _engine.enableLocalAudio(!openMicrophone.value).then((value) {
  //     openMicrophone.value = !openMicrophone.value;
  //   }).catchError((err) {
  //     logSink.log('enableLocalAudio $err');
  //   });
  // }

  // void switchSpeakerphone() {
  //   _engine.setEnableSpeakerphone(!enableSpeakerphone.value).then((value) {
  //     enableSpeakerphone.value = !enableSpeakerphone.value;
  //   }).catchError((err) {
  //     logSink.log('setEnableSpeakerphone $err');
  //   });
  // }

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
