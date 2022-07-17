// ignore_for_file: avoid_void_async, always_specify_types, unawaited_futures

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:get/state_manager.dart';
import 'package:mezcalmos/Shared/controllers/Agora/logSink.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:permission_handler/permission_handler.dart';

class AgoraConfig {
  static const channelId = "mezcalmos";
  static const appId = "6def50fdd2804ffaaa70d807ee445d28";
  static const token =
      "0066def50fdd2804ffaaa70d807ee445d28IAAGKU4Xl43s7AxqvHhZ8PDSokbXlmX/mnt2o4vLOSpoMsg3kqsAAAAAEAAh21UYfKfVYgEAAQB8p9Vi";
  static RxnInt uid = RxnInt();
}

class Sagora extends GetxController {
  late final RtcEngine _engine;
  String channelId = AgoraConfig.channelId;
  RxBool isJoined = false.obs;
  RxBool openMicrophone = true.obs;
  RxBool enableSpeakerphone = true.obs;
  RxBool playEffect = false.obs;
  RxBool enableInEarMonitoring = false.obs;
  RxDouble recordingVolume = 100.0.obs;
  RxDouble playbackVolume = 100.0.obs;
  RxDouble inEarMonitoringVolume = 100.0.obs;
  final LogSink logSink = LogSink();
  RtcEngine get engine => _engine;
  // late TextEditingController _controller;

  @override
  void onInit() {
    // we await the initializationg of the agora engine first.
    // _initEngine();
    initAgora();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool> checkAgoraPermissions() async {
    Map<Permission, PermissionStatus> r =
        (await [Permission.microphone].request());

    if (r.values.contains(PermissionStatus.denied) ||
        r.values.contains(PermissionStatus.limited) ||
        r.values.contains(PermissionStatus.permanentlyDenied) ||
        r.values.contains(PermissionStatus.restricted)) {
      return Future.value(false);
    }

    return Future.value(true);
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = await RtcEngine.create(AgoraConfig.appId);
    await _engine.enableVideo();
    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print("local user $uid joined");
          isJoined.value = true;
        },
        userJoined: (int uid, int elapsed) {
          print("remote user $uid joined");

          AgoraConfig.uid.value = uid;
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("remote user $uid left channel");
          AgoraConfig.uid.value = null;
        },
      ),
    );

    await _engine.joinChannel(
      AgoraConfig.token,
      AgoraConfig.channelId,
      null,
      0,
    );
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

  void _addListeners() {
    _engine.setEventHandler(RtcEngineEventHandler(
      warning: (warningCode) {
        logSink.log('warning $warningCode');
      },
      error: (errorCode) {
        logSink.log('error $errorCode');
      },
      joinChannelSuccess: (channel, uid, elapsed) {
        logSink.log('[ ----.----- ] joinChannelSuccess $channel $uid $elapsed');
        isJoined.value = true;
      },
      leaveChannel: (stats) async {
        logSink.log('leaveChannel ${stats.toJson()}');
        isJoined.value = false;
      },
    ));
  }

  Future<void> joinChannel() async {
    if (getPlatformType() == MezPlatform.ANDROID) {
      await Permission.microphone.request();
    }

    await _engine
        .joinChannel(AgoraConfig.token, AgoraConfig.channelId, null,
            AgoraConfig.uid.value!)
        .catchError((onError) {
      logSink.log('error ${onError.toString()}');
    });
  }

  Future<void> leaveChannel() async {
    await _engine.leaveChannel();
    isJoined.value = false;
    openMicrophone.value = true;
    enableSpeakerphone.value = true;
    playEffect.value = false;
    enableInEarMonitoring.value = false;
    recordingVolume.value = 100;
    playbackVolume.value = 100;
    inEarMonitoringVolume.value = 100;
  }

  Future<void> switchMicrophone() async {
    // await _engine.muteLocalAudioStream(!openMicrophone);
    await _engine.enableLocalAudio(!openMicrophone.value).then((value) {
      openMicrophone.value = !openMicrophone.value;
    }).catchError((err) {
      logSink.log('enableLocalAudio $err');
    });
  }

  void switchSpeakerphone() {
    _engine.setEnableSpeakerphone(!enableSpeakerphone.value).then((value) {
      enableSpeakerphone.value = !enableSpeakerphone.value;
    }).catchError((err) {
      logSink.log('setEnableSpeakerphone $err');
    });
  }

  Future<void> switchEffect() async {
    if (playEffect.value) {
      _engine.stopEffect(1).then((value) {
        playEffect.value = false;
      }).catchError((err) {
        logSink.log('stopEffect $err');
      });
    } else {
      final path = (await _engine
          .getAssetAbsolutePath("assets/sounds/notif-alert.mp3"))!;
      _engine
          .playEffect(1, path, 0, 1, 1, 100, openMicrophone.value)
          .then((value) {
        playEffect.value = true;
      }).catchError((err) {
        logSink.log('playEffect $err');
      });
    }
  }

  Future<void> onChangeInEarMonitoringVolume(double value) async {
    inEarMonitoringVolume.value = value;
    await _engine.setInEarMonitoringVolume(inEarMonitoringVolume.toInt());
    refresh();
  }

  Future<void> toggleInEarMonitoring(value) async {
    enableInEarMonitoring = value;
    await _engine.enableInEarMonitoring(enableInEarMonitoring.value);
    refresh();
  }
}
