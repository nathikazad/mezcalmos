// ignore_for_file: avoid_void_async, always_specify_types, unawaited_futures

import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/chatNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/rootNodes.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart' as Gen;
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/env_example.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

enum CallStatus { none, calling, inCall, timedOut }

class Sagora extends GetxController {
  late final RtcEngine _engine;

  RtcEngine get engine => _engine;
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();
  StreamController<String> _infoStrings = StreamController.broadcast();
  SettingsController _settingsController = Get.find<SettingsController>();
  Stream<String> get agoraLogs => _infoStrings.stream;
  final Rx<CallStatus> callStatus = CallStatus.none.obs;
  @override
  void onInit() {
    // checkAgoraPermissions();
    _initAgora()
        .then((value) => _startListeningOnCallEvents())
        .catchError((_, s) {
      mezDbgPrint("GOT ERRRRROOOOR ---<  $_ >-----\n $s");
    });
    super.onInit();
  }

  @override
  void onClose() {
    removeSession();
    //  _engine.destroy();
    super.onClose();
  }

  Future<bool> isInActiveCall() async {
    try {
      final String? currentCallId = await _engine.getCallId();
      if (currentCallId != null) {
        mezDbgPrint("-------------- CALL ID --------- $currentCallId");
        return Future.value(true);
      }
      return Future.value(false);
    } catch (e) {
      return Future.value(false);
    }
  }

  Future<void> handleIfInChannelAlready() async {
    try {
      //   final String? currentCallId = await _engine.getCallId();
      final bool _isInCall = await isInActiveCall();
      if (_isInCall) {
        await _engine.leaveChannel();
      }
    } catch (e) {}
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
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
      appId: agoraAppId,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    ));

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          final info =
              '👻👻👻👻👻 onJoinChannel: ${connection.channelId}, uid: ${connection.localUid}';
          _infoStrings.add(info);
          mezDbgPrint(info);
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          final info = '👻👻👻👻👻 userJoined: $remoteUid';
          _infoStrings.add(info);
          mezDbgPrint(info);
          callStatus.value = CallStatus.inCall;
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          final info = '👻👻👻👻👻 userOffline: $remoteUid , reason: $reason';
          mezDbgPrint(info);
          removeSession();

          _infoStrings.add(info);
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          _infoStrings.add(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
        onLeaveChannel: (connection, stats) {
          _infoStrings.add(' 👻👻👻👻👻 onLeaveChannel');
          mezDbgPrint(' 👻👻👻👻👻 onLeaveChannel');
          removeSession();
        },
        onError: (err, msg) {
          final info = '👻👻👻👻👻 onError: $err $msg';
          _infoStrings.add(info);
        },
      ),
    );
    await _engine.enableAudio();
    await _engine.disableVideo();
  }

  Future<void> joinChannel({
    required String token,
    required int channelId,
    required int uid,
  }) async {
    // mezDbgPrint(" 👻👻👻 JOIN CHANNEL CALLED !!!! 👻👻👻  ");
    mezDbgPrint("👻👻👻 Joining using : $token | $channelId | $uid");
    await _engine.joinChannel(
        token: token,
        channelId: channelId.toString(),
        uid: uid,
        options: ChannelMediaOptions());
  }

  Future<void> removeSession({String? chatId}) async {
    await _engine.leaveChannel();
    callStatus.value = CallStatus.none;
    if (chatId != null) {
      await FlutterCallkitIncoming.endCall(chatId);
    } else
      await FlutterCallkitIncoming.endAllCalls();
  }

  Future<DatabaseEvent> getAgoraToken(
      int chatId, String userId, ParticipantType type) async {
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
    mezDbgPrint("🤑🤑🤑🤑🤑🤑 Flutter listening");
    FlutterCallkitIncoming.onEvent.listen((CallEvent? event) async {
      mezDbgPrint("CallEvent ===>  $event");

      switch (event?.event) {
        case Event.ACTION_CALL_DECLINE:
          mezDbgPrint("CallEvent.DECLINED !");
          endCall(
            chatId: int.parse(event!.body['extra']['chatId']),
            callee: Participant(
              image: event.body['avatar'],
              name: event.body['nameCaller'],
              participantType: event.body['extra']['callerType']
                  .toString()
                  .toParticipantType(),
              id: event.body['extra']['callerId'],
            ),
          );
          callStatus.value = CallStatus.none;
          await FlutterCallkitIncoming.endAllCalls();
          // change to decline to update view parts.
          // if (Get.currentRoute == kAgoraCallScreen) MezRouter.back();
          break;
        case Event.ACTION_CALL_ENDED:
          mezDbgPrint("CallEvent.ACTION_CALL_ENDED!");
          if (event!.body?['extra']?['chatId'] != null) {
            await endCall(
              chatId: int.parse(event.body?['extra']['chatId']),
              callee: Participant(
                image: event.body['avatar'],
                name: event.body['nameCaller'],
                participantType: event.body['extra']['callerType']
                    .toString()
                    .toParticipantType(),
                id: int.parse(event.body['extra']['callerId']),
              ),
            );
          }
          // change to ended to update view parts.
          callStatus.value = CallStatus.none;

          // if (Get.currentRoute == kAgoraCallScreen) {
          //   MezRouter.back<void>(closeOverlays: true);
          // }
          break;
        case Event.ACTION_CALL_ACCEPT:
          if ((await checkAgoraPermissions())) {
            // it's better to send token and chatId withing the variableParams on call notif
            // that way we wont need to fetch the token and uid from db, using the bellow line :
            // final dynamic agoraAuth = await _sagora.getAgoraToken();
            mezDbgPrint(
                "🎃🎃🎃 ACTION_CALL_ACCEPT::   Calling [_sagora.joinChannel] with extra::uid ${event?.body}");
            joinChannel(
              token: event!.body?['extra']['agoraToken'],
              channelId: int.parse(event.body?['extra']['chatId']),
              uid: //5774112,
                  int.parse(event.body!['extra']['recipientuid']),
            );
            // change to Accept to update view parts.
            callStatus.value = CallStatus.inCall;
            Map<String, dynamic> args = <String, dynamic>{
              "chatId": int.parse(event.body?['extra']?['chatId']),
              "talkingTo": Participant(
                image: event.body?['avatar'],
                name: event.body?['nameCaller'],
                participantType: event.body['extra']['callerType']
                    .toString()
                    .toParticipantType(),
                // wrong actual user id, it's more like an agora generated id
                id: int.parse(event.body['extra']['callerId']),
              ),
            };
            if (Get.currentRoute == NativeOnlyRoutes.kAgoraCallScreenRoute) {
              Future<void>.microtask(() => MezRouter.back().then(
                    (_) => MezRouter.toNamed(
                        NativeOnlyRoutes.kAgoraCallScreenRoute,
                        arguments: <String, dynamic>{
                          "chatId": int.parse(event.body?['extra']?['chatId']),
                          "talkingTo": Participant(
                            image: event.body?['avatar'],
                            name: event.body?['nameCaller'],
                            participantType: event.body['extra']['callerType']
                                .toString()
                                .toParticipantType(),
                            // wrong actual user id, it's more like an agora generated id
                            id: event.body['extra']['callerId'],
                          ),
                        }),
                  ));
            } else {
              // Pushing to call screen + awaiting in case we wanna return with value.
              // ignore: unawaited_futures
              Future.microtask(() => MezRouter.toNamed(
                  NativeOnlyRoutes.kAgoraCallScreenRoute,
                  arguments: args));
            }
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

  Future<void> callUser(
      {required int chatId, required Participant callee}) async {
    return sendUserCallNotification(
        chatId: chatId,
        callee: callee,
        callNotificationType: CallNotificationtType.Incoming);
  }

  Future<void> endCall(
      {required int chatId, required Participant callee, int? orderId}) async {
    return sendUserCallNotification(
        chatId: chatId,
        callee: callee,
        callNotificationType: CallNotificationtType.EndCall);
  }

  Future<void> sendUserCallNotification(
      {required int chatId,
      required Participant callee,
      required CallNotificationtType callNotificationType}) async {
    final DatabaseReference notificationNode = _databaseHelper.firebaseDatabase
        .ref()
        .child(notificationQueueNode())
        .push();

    // ignore: unawaited_futures
    _databaseHelper.firebaseDatabase
        .ref()
        .child(notificationQueueNode(notificationNode.key))
        .set(CallNotificationForQueue(
                chatId: chatId,
                callerId: _authController.hasuraUserId!,
                callerParticipantType:
                    MezEnv.appType.toParticipantTypefromAppType(),
                calleeId: callee.id,
                calleeParticipantType: callee.participantType,
                callNotificationType: callNotificationType)
            .toFirebaseFormatJson());
  }

  static Future<void> handleCallNotificationEvent(RemoteMessage event) async {
    switch (event.data['callNotificationType']
        .toString()
        .toCallNotificationtType()) {
      case CallNotificationtType.Incoming:
        mezDbgPrint("# 👁 # [ BG NOTIF ] # [ I N C O M I N G ] ${event.data}");
        // await handleIfInChannelAlready();
        await triggerIncomingCallAlert(
            callerName: event.data["callerName"],
            callerImage: event.data["callerImage"],
            callerType: event.data["callerType"],
            callerId: event.data["callerId"],
            languageType: event.data["language"].toString().toLanguageType(),
            chatId: event.data['chatId'],
            agoraToken: event.data['agoraToken'],
            recipientuid: event.data['recipientuid']);

        break;
      // not here
      case CallNotificationtType.EndCall:
        mezDbgPrint("# 👀 # [ BG NOTIF ] # [ E N D - C A L L] ${event.data}");
        await FlutterCallkitIncoming.endAllCalls();
        // await engine.leaveChannel();
        // callStatus.value = CallStatus.none;
        // await FlutterCallkitIncoming.endCall(
        //   event.data['chatId'],
        // );
        break;
      default:
        mezDbgPrint("# 🗣 # [ BG NOTIF ] # [ U N K N O W N] ${event.data}");
    }
  }

  static Future<void> triggerIncomingCallAlert({
    required String callerName,
    required String callerImage,
    required String callerType,
    required String callerId,
    required Gen.LanguageType languageType,
    required String chatId,
    required String agoraToken,
    required String recipientuid,
  }) async {
    final String _uuid = Uuid().v1();
    final Map<String, dynamic> params = <String, dynamic>{
      'id': _uuid,
      'nameCaller': callerName,
      'appName': 'Mezcalmos',
      'avatar': callerImage,
      'handle': callerName,
      'type': 0,
      'duration': 30000,
      'textAccept': 'Accept',
      'textDecline': 'Decline',
      'textMissedCall': 'Missed call',
      'textCallback': 'Call back',
      'extra': <String, dynamic>{
        'chatId': chatId,
        'agoraToken': agoraToken,
        'recipientuid': recipientuid,
        'callerId': callerId,
        'callerType': callerType
      },
      'android': <String, dynamic>{
        'isCustomNotification': true,
        'isShowLogo': false,
        'isShowCallback': false,
        'ringtonePath': 'system_ringtone_default',
        'backgroundColor': '#0955fa',
        'background': callerImage,
        'actionColor': '#4CAF50'
      },
      'ios': <String, dynamic>{
        'iconName': 'AppIcon',
        'handleType': '',
        'supportsVideo': true,
        'maximumCallGroups': 2,
        'maximumCallsPerCallGroup': 1,
        'audioSessionMode': 'default',
        'audioSessionActive': true,
        'audioSessionPreferredSampleRate': 44100.0,
        'audioSessionPreferredIOBufferDuration': 0.005,
        'supportsDTMF': true,
        'supportsHolding': true,
        'supportsGrouping': false,
        'supportsUngrouping': false,
        'ringtonePath': 'system_ringtone_default'
      }
    };
    final CallKitParams kitParams = CallKitParams.fromJson(params);
    mezDbgPrint("triggering");
    // ignore: unawaited_futures
    await FlutterCallkitIncoming.showCallkitIncoming(kitParams);
  }
}
