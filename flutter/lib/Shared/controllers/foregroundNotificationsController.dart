import 'package:flutter/material.dart' as material;
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

typedef shouldSaveNotification = bool Function(Notification notification);

class ForegroundNotificationsController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();

  RxList<Notification> notifications = RxList();
  LanguageController lang = Get.find<LanguageController>();

  StreamSubscription? _notificationNodeAddListener;
  StreamSubscription? _notificationNodeRemoveListener;
  StreamController<Notification> _displayNotificationsStreamController =
      StreamController.broadcast();
  late String _notificationNode;

  Stream<Notification> get displayNotificationsStream =>
      _displayNotificationsStreamController.stream;

  @override
  void onInit() {
    mezDbgPrint(
        "sd@s:ForegroundNotificationsController::Notifications =====> ${notifications.length}");

    mezDbgPrint("sd@s:ForegroundNotificationsController: Init");
    super.onInit();
  }

  void startListeningForNotificationsFromFirebase(String notificationNode,
      Notification Function(String key, dynamic value) notificationHandler) {
    // mezDbgPrint(
    //     "ForegroundNotificationsController:startListeningForNotifications");
    // mezDbgPrint(notificationNode);
    this._notificationNode = notificationNode;
    _notificationNodeAddListener?.cancel();
    _notificationNodeAddListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(notificationNode)
        .onChildAdded
        .listen((event) {
      // mezDbgPrint("sd@s:ForegroundNotificationsController:: NEW NOTIFICATION");
      // mezDbgPrint(event.snapshot.value);
      try {
        Notification _notification =
            notificationHandler(event.snapshot.key!, event.snapshot.value);
        bool alreadyOnLinkPage = (Get.currentRoute == _notification.linkUrl);

        switch (_notification.notificationAction) {
          case NotificationAction.ShowPopUp:
            if (Get.find<AppLifeCycleController>().appState ==
                material.AppLifecycleState.resumed) {
              _displayNotificationsStreamController.add(_notification);
            }
            break;
          case NotificationAction.ShowSnackBarAlways:
            _displayNotificationsStreamController.add(_notification);
            break;
          case NotificationAction.ShowSnackbarOnlyIfNotOnPage:
            if (!alreadyOnLinkPage) {
              _displayNotificationsStreamController.add(_notification);
            }
            break;
        }

        if (!alreadyOnLinkPage) {
          notifications.add(_notification);
        } else {
          removeNotification(_notification.id);
        }
      } on StateError {
        mezDbgPrint("Invalid notification");
      }
    });

    _notificationNodeRemoveListener?.cancel();
    _notificationNodeRemoveListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(notificationNode)
        .onChildRemoved
        .listen((event) {
      Notification _notifaction =
          notificationHandler(event.snapshot.key!, event.snapshot.value);
      notifications.value = notifications.value
          .where((element) => element.id != _notifaction.id)
          .toList();
    });
  }

  void removeNotification(String notificationId) {
    _databaseHelper.firebaseDatabase
        .reference()
        .child("$_notificationNode/$notificationId")
        .remove();
  }

  bool hasNewNotifications() {
    return notifications.value.isNotEmpty;
  }

  void clearAllMessageNotification() {
    mezDbgPrint(
        "fbNotificationsController: Clearing All Messages Notifications");
    notifications()
        .where((notification) =>
            notification.notificationType == NotificationType.NewMessage)
        .forEach((element) {
      removeNotification(element.id);
    });
  }

  void clearAllNotification() {
    mezDbgPrint("fbNotificationsController: Clearing All Notifications");
    _databaseHelper.firebaseDatabase
        .reference()
        .child("$_notificationNode")
        .remove();
  }

  @override
  void onClose() {
    _notificationNodeAddListener?.cancel();
    _notificationNodeRemoveListener?.cancel();
    super.onClose();
  }
}
