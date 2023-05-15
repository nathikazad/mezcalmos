import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/constants/global.dart';
// import 'package:mezcalmos/Shared/controllers/agoraController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/notifications/hsNotificationInfo.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/env.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage event) async {
  mezDbgPrint("Handling a background message");
  mezDbgPrint(event.data);
  print("[MZL]" + event.data.toString());
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

class BaseBackgroundNotificationsController extends GetxController {
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  StreamSubscription<RemoteMessage>? onMessageOpenedAppListener;
  StreamSubscription<RemoteMessage>? onMessageListener;
  StreamSubscription<String>? _tokenStreamListener;

  AuthController authController = Get.find<AuthController>();
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
      notificationClickHandler(message);
    });

    onMessageListener =
        FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
      mezDbgPrint(
          "FirebaseMessage ======> ${event.data} | ${event.contentAvailable}");
      mezDbgPrint(event.data["notificationType"]);
      mezDbgPrint(NotificationType.Call.toFirebaseFormatString());
    });

    if (authController.fireAuthUser != null) {
      await saveNotificationToken();
    }
    authController.authStateStream.listen((User? fireUser) {
      if (fireUser != null) {
        saveNotificationToken();
      }
    });
  }

  void notificationClickHandler(RemoteMessage message) {
    mezDbgPrint("notificationClickHandler");
    mezDbgPrint("CurrentRoute : ${MezRouter.currentRoute}");
    mezDbgPrint(message.data);
    // if (message.data["linkUrl"] != null) Get.closeAllSnackbars();
    // if (message.data['linkUrl'].toString().contains('/messages/')) {
    //   if (MezRouter.isCurrentRoute(SharedRoutes.kWrapperRoute)) {
    //     Future<void>.delayed(Duration(milliseconds: 100), () {
    //       MezRouter.toNamed(SharedRoutes.kHomeRoute);
    //       MezRouter.toNamed(
    //         message.data["linkUrl"],
    //       );
    //     });
    //   } else {
    //     Future<void>.delayed(
    //       Duration(milliseconds: 100),
    //       () => MezRouter.toNamed(
    //         message.data["linkUrl"],
    //       ),
    //     );
    //   }
    // } else
    Future<void>.delayed(
      Duration(milliseconds: 100),
      () => MezRouter.toPath(message.data["linkUrl"]),
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

  Future<void> saveNotificationToken() async {
    final String? deviceNotificationToken = await getToken();
    await _tokenStreamListener?.cancel();
    _tokenStreamListener = null;
    _tokenStreamListener =
        FirebaseMessaging.instance.onTokenRefresh.listen(setToken);

    await setToken(deviceNotificationToken);
  }

  Future<void> setToken(String? deviceNotificationToken) async {
    if (deviceNotificationToken != null) {
      mezDbgPrint("😉😉😉😉😉😉 setting notif token 😉😉😉😉😉");
      final cModels.NotificationInfo? notifInfo = await get_notif_info(
          userId: authController.hasuraUserId!,
          appType: "${MezEnv.appType.toNormalString().toLowerCase()}");

      try {
        if (notifInfo != null && notifInfo.token != deviceNotificationToken) {
          // ignore: unawaited_futures
          update_notif_info(
              notificationInfo: cModels.NotificationInfo(
                  userId: authController.hasuraUserId!,
                  appType: MezEnv.appType,
                  id: notifInfo.id,
                  token: deviceNotificationToken,
                  turnOffNotifications: notifInfo.turnOffNotifications));
        } else if (notifInfo == null) {
          // ignore: unawaited_futures
          insert_notif_info(
              userId: authController.hasuraUserId!,
              token: deviceNotificationToken,
              appType: MezEnv.appType.toNormalString().unCapFirst);
        }
      } catch (e, stk) {
        mezDbgPrint(e);
        mezDbgPrint(stk);
      }
    }
  }

  @override
  Future<void> onClose() async {
    mezDbgPrint(
        "[+] DeviceNotificationsController::dispose ---------> Was invoked !");
    await onMessageOpenedAppListener?.cancel();
    await onMessageListener?.cancel();
    await _tokenStreamListener?.cancel();
    _tokenStreamListener = null;
    super.onClose();
  }
}
