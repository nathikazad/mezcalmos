import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/Agora/agoraController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/pages/AgoraCall.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:uuid/uuid.dart';

void startListeningOnCallEvents() {
  FlutterCallkitIncoming.onEvent.listen((CallEvent? event) async {
    mezDbgPrint("CallEvent ===>  $event");

    switch (event?.name) {
      case CallEvent.ACTION_CALL_ENDED:
        await Get.find<Sagora>().removeSession();
        break;

      case CallEvent.ACTION_CALL_ACCEPT:
        final Sagora _sagora = Get.find<Sagora>();
        if ((await _sagora.checkAgoraPermissions())) {
          // it's better to send token and chatId withing the variableParams on call notif
          // that way we wont need to fetch the token and uid from db, using the bellow line :
          // final dynamic agoraAuth = await _sagora.getAgoraToken();
          _sagora.joinChannel(
            token: event?.body?['extra']['agoraToken'],
            channelId: event?.body?['extra']['chatId'],
            uid: event?.body?['extra']['uid'],
          );

          // Pushing to call screen + awaiting in case we wanna return with value.
          // ignore: unawaited_futures
          Get.to<dynamic>(
            AgoraCall(
              chatId: event?.body?['extra']['chatId'],
              talkingTo: Participant(
                image: event!.body['avatar'],
                name: event.body['nameCaller'],
                participantType:
                    event.body['handle'].toString().toParticipantType(),
                // wrong actual user id, it's more like an agora generated id
                id: event.body['id'],
              ),
            ),
          );
        }

        break;
      default:
    }
  });
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage event) async {
  mezDbgPrint("Handling a background message");
  mezDbgPrint(event.data);

  if (event.data["notificationType"] == "newOrder" &&
      event.data["markReceivedUrl"] != null) {
    await markInDb(event.data["markReceivedUrl"]);
  } else if (event.data["notificationType"] ==
      NotificationType.Call.toFirebaseFormatString()) {
    mezDbgPrint("######## GOT BG FCM ###### ${event.data}");
    switch (event.data['callNotificationType']) {
      case CallNotificationtType.Incoming:
        final Map<String, dynamic> _extras = {
          "chatId": event.data['chatId'],
          "agoraToken": event.data['agoraToken'],
          "uid": event.data['uid']
        };
        await showCallkitIncoming(
          callerName: event.data["callerName"],
          callerImage: event.data["callerImage"],
          callerType: event.data["callerType"],
          language: event.data["language"],
          extra: _extras,
        );
        break;
      case CallNotificationtType.EndCall:
        await FlutterCallkitIncoming.endAllCalls();
        break;
      default:
    }
  }
}

Future<void> showCallkitIncoming(
    {required String callerName,
    required String callerImage,
    required String callerType,
    required String? language,
    Map<String, dynamic> extra = const {}}) async {
  final Map<String, dynamic> params = <String, dynamic>{
    'id': Uuid().v4(),
    'nameCaller': callerName,
    'appName': callerName,
    'avatar': callerImage,
    'handle': callerType,
    'type': 0,
    'duration': 30000,
    'textAccept': 'Accept',
    'textDecline': 'Decline',
    'textMissedCall': 'Missed call',
    'textCallback': 'Call back',
    'extra': extra,
    // 'headers': <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
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
      'iconName': 'CallKitLogo',
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
    startListeningOnCallEvents();
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
        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.data["notificationType"] ==
          NotificationType.Call.toFirebaseFormatString()) {
        showCallkitIncoming(
            callerName: message.data["callerName"],
            callerImage: message.data["callerImage"],
            callerType: message.data["callerType"],
            language: message.data["language"]);
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
