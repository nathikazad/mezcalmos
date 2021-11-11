import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

typedef shouldSaveNotification = bool Function(Notification notification);

class FBNotificationsController extends GetxController {
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();

  RxList<Notification> notifications = RxList();
  LanguageController _lang = Get.find<LanguageController>();

  StreamSubscription? _notificationNodeAddListener;
  StreamSubscription? _notificationNodeRemoveListener;
  StreamController<Notification> _notificationsStreamController =
      StreamController.broadcast();
  late String _notificationNode;

  Stream<Notification> get notificationsStream =>
      _notificationsStreamController.stream;

  @override
  void onInit() async {
    super.onInit();
    mezDbgPrint("fbNotificationsController: Init");
  }

  void startListeningForNotificationsFromFirebase(String notificationNode,
      Notification Function(String key, dynamic value) notificationHandler) {
    mezDbgPrint("FBNotificationsController:startListeningForNotifications");
    mezDbgPrint(notificationNode);
    this._notificationNode = notificationNode;
    _notificationNodeAddListener?.cancel();
    _notificationNodeAddListener = null;
    _notificationNodeAddListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(notificationNode)
        .onChildAdded
        .listen((event) {
      mezDbgPrint(event.snapshot.value);
      Notification _notification =
          notificationHandler(event.snapshot.key!, event.snapshot.value);
      bool alreadyOnLinkPage = (Get.currentRoute == _notification.linkUrl);
      mezDbgPrint(Get.currentRoute);
      mezDbgPrint(_notification.linkUrl);
      if (alreadyOnLinkPage && _notification.showIfOnLinkPage)
        _notificationsStreamController.add(_notification);

      if (!alreadyOnLinkPage) {
        notifications.add(_notification);
        _notificationsStreamController.add(_notification);
        mezDbgPrint(_notification.toJson());
      } else {
        removeNotification(_notification.id);
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
