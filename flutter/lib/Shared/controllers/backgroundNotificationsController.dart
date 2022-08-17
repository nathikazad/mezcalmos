import 'dart:async';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/Agora/agoraController.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Generic.dart' as Gen;
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:uuid/uuid.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage event) async {
  mezDbgPrint("Handling a background message");
  mezDbgPrint(event.data);
  print("[MZL]" + event.data.toString());
  if (event.data["notificationType"] == "newOrder" &&
      event.data["markReceivedUrl"] != null) {
    await markInDb(event.data["markReceivedUrl"]);
  } else if (event.data["notificationType"] ==
      NotificationType.Call.toFirebaseFormatString()) {
    switch (event.data['callNotificationType']
        .toString()
        .toCallNotificationtType()) {
      case CallNotificationtType.Incoming:
        mezDbgPrint("# 👁 # [ BG NOTIF ] # [ I N C O M I N G ] ${event.data}");

        await triggerIncomingCallAlert(
          callerName: event.data["callerName"],
          callerImage: event.data["callerImage"],
          callerType: event.data["callerType"],
          callerId: event.data["callerId"],
          languageType: event.data["language"].toString().toLanguageType(),
          extra: <String, dynamic>{
            "chatId": event.data['chatId'],
            "agoraToken": event.data['agoraToken'],
            "calleeuid": event.data['calleeuid'],
          },
        );
        break;
      // not here
      case CallNotificationtType.EndCall:
        mezDbgPrint("# 👀 # [ BG NOTIF ] # [ E N D - C A L L] ${event.data}");
        await FlutterCallkitIncoming.endAllCalls();

        // await FlutterCallkitIncoming.endCall(
        //   event.data['chatId'],
        // );
        break;
      default:
        mezDbgPrint("# 🗣 # [ BG NOTIF ] # [ U N K N O W N] ${event.data}");
    }
  }
}

Future<void> triggerIncomingCallAlert({
  required String callerName,
  required String callerImage,
  required String callerType,
  required String callerId,
  required Gen.LanguageType languageType,
  required Map<String, dynamic> extra,
}) async {
  final String _uuid = Uuid().v1();
  final Map<String, dynamic> params = <String, dynamic>{
    'id': _uuid,
    'nameCaller': callerName,
    'appName': 'Mezcalmos',
    'avatar': callerImage,
    'handle': callerName,
    'type': callerType,
    'duration': 30000,
    'textAccept': 'Accept',
    'textDecline': 'Decline',
    'textMissedCall': 'Missed call',
    'textCallback': 'Call back',
    'extra': {...extra, 'callerId': callerId, 'callerType': callerType},
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
  // ignore: unawaited_futures
  await FlutterCallkitIncoming.showCallkitIncoming(params);
}

Future<void> markInDb(String url) async {
  final String? driverId = GetStorage().read<String>(getxUserId);
  if (driverId != null) {
    url = url.replaceAll("<driverId>", driverId);
    await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, bool>{"value": true}),
    );
  }
  // .then((value) => mezDbgPrint(jsonDecode(value.body)["data"]));
}

class BackgroundNotificationsController extends GetxController {
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  StreamSubscription<RemoteMessage>? onMessageOpenedAppListener;
  StreamSubscription<RemoteMessage>? onMessageListener;
  DateTime? _lastTimeBackgroundNotificationOpenedApp;
  DateTime? get lastTimeBackgroundNotificationOpenedApp =>
      _lastTimeBackgroundNotificationOpenedApp;
  @override
  Future<void> onInit() async {
    super.onInit();
    mezDbgPrint("BackgroundNotificationsController onInit");
    final NotificationSettings settings = await requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    }
    // ignore: unawaited_futures, always_specify_types
    _messaging.getInitialMessage().then(
          (RemoteMessage? message) =>
              message != null ? notificationClickHandler(message) : null,
        );
    onMessageOpenedAppListener =
        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _lastTimeBackgroundNotificationOpenedApp = DateTime.now();
      notificationClickHandler(message);
    });

    onMessageListener =
        FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      Sagora agora = Get.find<Sagora>();
      mezDbgPrint(
          "FirebaseMessage ======> ${message.data} | ${message.contentAvailable}");
      if (message.data["notificationType"] ==
          NotificationType.Call.toFirebaseFormatString()) {
        if (message.data['callNotificationType']
                .toString()
                .toCallNotificationtType() ==
            CallNotificationtType.Incoming) {
          // handle incoming
          await agora.handleIfInChannelAlready();
          await triggerIncomingCallAlert(
              callerName: message.data["callerName"],
              callerImage: message.data["callerImage"],
              callerType: message.data["callerType"],
              callerId: message.data["callerId"],
              languageType:
                  message.data["language"].toString().toLanguageType(),
              extra: <String, dynamic>{
                "chatId": message.data['chatId'],
                "agoraToken": message.data['agoraToken'],
                "calleeuid": message.data['calleeuid'],
              });
        } else {
          mezDbgPrint("LOG ===> GOT END CALL BG NOTIF ===> ${message.data}");
          await FlutterCallkitIncoming.endAllCalls();
          await agora.engine.leaveChannel();
          Get.find<Sagora>().callStatus.value = CallStatus.none;
        }
      }
    });
  }

  void notificationClickHandler(RemoteMessage message) {
    mezDbgPrint("notificationClickHandler");
    mezDbgPrint("CurrentRoute : ${Get.currentRoute}");
    mezDbgPrint(message.data);
    if (message.data["linkUrl"] != null) Get.closeAllSnackbars();
    if (message.data['linkUrl'].toString().contains('/messages/')) {
      if (isCurrentRoute(kWrapperRoute)) {
        Future<void>.delayed(Duration(milliseconds: 100), () {
          Get.toNamed<void>(kHomeRoute);
          Get.toNamed<void>(
            message.data["linkUrl"],
            arguments: <String, bool>{'showViewOrderBtn': true},
          );
        });
      } else {
        Future<void>.delayed(
          Duration(milliseconds: 100),
          () => Get.toNamed<void>(
            message.data["linkUrl"],
            arguments: <String, bool>{'showViewOrderBtn': true},
          ),
        );
      }
      ;
    } else
      Future<void>.delayed(
        Duration(milliseconds: 100),
        () => Get.toNamed<void>(message.data["linkUrl"]),
      );
  }

  Future<NotificationSettings> requestPermission() async {
    final NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    mezDbgPrint(
        'User granted notification permission: ${settings.authorizationStatus}');
    return settings;
  }

  Future<String?> getToken() async {
    final String? token = await _messaging.getToken();
    return token;
  }

  @override
  Future<void> onClose() async {
    mezDbgPrint(
        "[+] DeviceNotificationsController::dispose ---------> Was invoked !");
    await onMessageOpenedAppListener?.cancel();
    await onMessageListener?.cancel();
    super.onClose();
  }
}
