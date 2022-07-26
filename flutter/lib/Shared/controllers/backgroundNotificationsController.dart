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
    mezDbgPrint("######## GOT BG FCM ###### ${event.data}");
    switch (event.data['callNotificationType']
        .toString()
        .toCallNotificationtType()) {
      case CallNotificationtType.Incoming:
        mezDbgPrint(event.data);
        // mezDbgPrint("Got extras ===> $_extras");
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
        await FlutterCallkitIncoming.endAllCalls();
        // await FlutterCallkitIncoming.endCall(
        //   event.data['chatId'],
        // );
        break;
      default:
        mezDbgPrint(
            "Got dEFAULT #E ===> ${event.data['callNotificationType']}");
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
  final Map<String, dynamic> params = <String, dynamic>{
    'id': Uuid().v1(),
    'nameCaller': callerName,
    'appName': getAppName(),
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
      mezDbgPrint(
          "FirebaseMessage ======> ${message.data} | ${message.contentAvailable}");
      if (message.data["notificationType"] ==
          NotificationType.Call.toFirebaseFormatString()) {
        if (message.data['callNotificationType']
                .toString()
                .toCallNotificationtType() ==
            CallNotificationtType.Incoming) {
          // handle incoming
          if (Get.currentRoute != kAgoraCallScreen) {
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
          }
        } else {
          // FirebaseMessage ======> {chatId: -N7lDrRmBPB5g82se9KR, linkUrl: /messages/-N7lDrRmBPB5g82se9KR,
          //callerImage: https://firebasestorage.googleapis.com/v0/b/mezcalmos-staging.appspot.com/o/users%2FoAxB9JquC1S7zQyRUuZF2gI1suL2%2Favatar%2FoAxB9JquC1S7zQyRUuZF2gI1suL2.compressed.jpg?alt=media&token=af4e39bd-b57e-4470-9a02-b7230bd84dc2,
          //callerType: customer, callerName: SAADR, notificationType: call, language: en, callerId: oAxB9JquC1S7zQyRUuZF2gI1suL2,
          //callNotificationType: endCall} | true
          mezDbgPrint("LOG ===> GOT END CALL BG NOTIF ===> ${message.data}");
          // Locally ending the call
          // FlutterCallkitIncoming.endCall(message.data);
          await FlutterCallkitIncoming.endAllCalls();
          mezDbgPrint("LOG ===> GOT END CALL BG NOTIF ===> endedAllCalls");
          // Agora side- leaving the channel!
          await Get.find<Sagora>().engine.leaveChannel();
          mezDbgPrint("LOG ===> GOT END CALL BG NOTIF ===> leftChannel");
          // if the current route is the agora screen we have to pop it out of the stacks!
          if (Get.currentRoute == kAgoraCallScreen) {
            Get.back<void>(closeOverlays: true);
          }
        }
      }
    });
  }

  void notificationClickHandler(RemoteMessage message) {
    mezDbgPrint("notificationClickHandler");
    mezDbgPrint("CurrentRoute : ${Get.currentRoute}");
    mezDbgPrint(
        "_____________________________________________ BACKROUNG MESSAGE ____________________________________");
    mezDbgPrint(message.data);
    mezDbgPrint(
        "_____________________________________________ BACKROUNG MESSAGE ____________________________________");
    if (message.data["linkUrl"] != null) Get.closeAllSnackbars();
    if (message.data['linkUrl'].toString().contains('/messages/')) {
      mezDbgPrint(
          "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<MessagesRouting");
      mezDbgPrint("GET CURRENT ROUTE 1 =================${Get.currentRoute}");
      if (Get.currentRoute == kWrapperRoute) {
        mezDbgPrint("GET CURRENT ROUTE 2 =================${Get.currentRoute}");
        Future<void>.delayed(Duration(milliseconds: 100), () {
          mezDbgPrint(Get.currentRoute);
          Get.toNamed(kHomeRoute);
          mezDbgPrint(
              "GET CURRENT ROUTE 3 =================${Get.currentRoute}");
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
