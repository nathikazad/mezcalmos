import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/agoraController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage event) async {
  mezDbgPrint("Handling a background message");
  mezDbgPrint(event.data);
  print("[MZL]" + event.data.toString());
  if (event.data["notificationType"] == "newOrder" &&
      event.data["markReceivedUrl"] != null) {
    // await markInDb(event.data["markReceivedUrl"]);
  } else if (event.data["notificationType"] ==
      NotificationType.Call.toFirebaseFormatString()) {
    unawaited(Sagora.handleCallNotificationEvent(event));
  }
}

// Future<void> markInDb(String url) async {
//   final String? driverId = GetStorage().read<String>(getxUserId);
//   if (driverId != null) {
//     url = url.replaceAll("<driverId>", driverId);
//     await http.put(
//       Uri.parse(url),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, bool>{"value": true}),
//     );
//   }
//   // .then((value) => mezDbgPrint(jsonDecode(value.body)["data"]));
// }

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
        FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
      mezDbgPrint(
          "FirebaseMessage ======> ${event.data} | ${event.contentAvailable}");
      mezDbgPrint(event.data["notificationType"]);
      mezDbgPrint(NotificationType.Call.toFirebaseFormatString());

      if (event.data["notificationType"] ==
          NotificationType.Call.toFirebaseFormatString()) {
        mezDbgPrint(event.data);
        unawaited(Sagora.handleCallNotificationEvent(event));
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
          MezRouter.toNamed<void>(kHomeRoute);
          MezRouter.toNamed<void>(
            message.data["linkUrl"],
            arguments: <String, bool>{'showViewOrderBtn': true},
          );
        });
      } else {
        Future<void>.delayed(
          Duration(milliseconds: 100),
          () => MezRouter.toNamed<void>(
            message.data["linkUrl"],
            arguments: <String, bool>{'showViewOrderBtn': true},
          ),
        );
      }
    } else
      Future<void>.delayed(
        Duration(milliseconds: 100),
        () => MezRouter.toNamed<void>(message.data["linkUrl"]),
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
