import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mezcalmos/Shared/controllers/agoraController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotifications/baseBackgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';

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

class NativeBackgroundNotificationsController
    extends BaseBackgroundNotificationsController {
  @override
  Future<void> onInit() async {
    super.onInit();
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
}
