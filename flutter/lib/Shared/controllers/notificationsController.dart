import 'dart:async';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/constants/routes.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as MezNotification;
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

class DeviceNotificationsController extends GetxController {
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  List<StreamSubscription<RemoteMessage>> _listeners =
      <StreamSubscription<RemoteMessage>>[];

  @override
  void onInit() async {
    super.onInit();
    NotificationSettings settings = await requestPermission();
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
    print('User granted permission: ${settings.authorizationStatus}');
    return settings;
  }

  Future<String?> getToken() async {
    final token = await _messaging.getToken();
    return token;
  }

  void detachListeners() {
    _listeners.forEach((sub) => sub
        .cancel()
        .then((value) =>
            print("A listener was disposed on deviceNotificationsController !"))
        .catchError((err) => print(
            "Error happend while trying to dispose deviceNotificationsController!")));
  }

  void dispose() async {
    print(
        "[+] DeviceNotificationsController::dispose ---------> Was invoked !");
    detachListeners();
    super.onClose();
  }
}

class FBNotificationsController extends GetxController {
  AuthController _authController = Get.find<AuthController>();
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  RxList<MezNotification.Notification> notifications =
      <MezNotification.Notification>[].obs;
  StreamSubscription<Event>? _taxiAuthListener;
  // List taxiAuthListenerCallbacks = [];
  RxBool _hasNewNotification = false.obs;
  LanguageController _lang = Get.find<LanguageController>();

  bool get hasNewNotification => _hasNewNotification.value;

  @override
  void onInit() async {
    super.onInit();

    if (_authController.user != null) {
      _taxiAuthListener = _databaseHelper.firebaseDatabase
          .reference()
          .child(notificationsNode(_authController.user!.uid))
          .onValue
          .listen((event) {
        notifications.clear();
        if (event.snapshot.value != null) {
          print(
              "=========> FBNotificationController :: onInit :: Listener :: Invoked --> \n");
          print("New notif : ${event.snapshot.value}");
          event.snapshot.value.forEach((dynamic key, dynamic value) {
            MezNotification.Notification _notif =
                MezNotification.Notification.fromJson(key, value);

            // this is to not invoke callbacks of newMessage when type == order
            if (_notif.notificationType == "newMessage") {
              print("\n\n\n ${_notif.toJson()} \n\n\n");
              // taxiAuthListenerCallbacks.forEach((callback) {
              // this is much more dynamic :D
              if (Get.currentRoute != kMessagesRoute &&
                  Get.find<TaxiAuthController>().currentOrderId != null) {
                mezcalmosSnackBar(
                    "${_lang.strings['shared']['messages']['newMessage']} ${_notif.variableParams['sender']['name']}",
                    "${_notif.variableParams['message']}",
                    position: SnackPosition.TOP);
                _hasNewNotification.value = true;
              }
              // if (_notif.notificationType == callback["type"] &&
              //     _notif.variableParams["orderId"] == callback["orderId"]) {
              //   callback["__call__"](_notif);
              //   // this is our actuall callback
              // }
              // });
            }
            notifications.add(_notif);

            print(notifications.toJson());
          });
        }
      });
    }
  }

  // using this we can register our callbacks from diffrent places , and invoke them onValue !
  // void registerCallbackOnListenerInvoke(callback) {
  //   // if (!taxiAuthListenerCallbacks.contains(callback)) {
  //   //   print(taxiAuthListenerCallbacks);
  //   taxiAuthListenerCallbacks.add(callback);
  //   print(taxiAuthListenerCallbacks);
  //   print("[+] ----------> $callback  ::  Was Registred successfully !!");
  //   // }
  // }

  // dynamic checkCallbackIsRegistred(String orderId) {
  //   dynamic res = taxiAuthListenerCallbacks.singleWhere(
  //       (element) => element['orderId'] == orderId,
  //       orElse: () => null);
  //   print("Resuly -----------> $res");
  //   return res;
  // }

  void clearAllMessageNotification() {
    print(
        "-=-=-=-=-=-=-=-=-=-=-=-=-=-= Clearing All Messages Notifications -=-=-=-=-=-=-=-=-=-=-=-=-=-= ");
    _hasNewNotification.value = false;
    _clearMessageNotificationsLocally();
    setAllMessagesAsReadInDb();
  }

  Future<void> setAllMessagesAsReadInDb() async {
    // for now i', just removing all notifications to test.

    await _databaseHelper.firebaseDatabase
        .reference()
        .child(notificationsNode(_authController.user!.uid))
        .remove();
  }

  void _clearMessageNotificationsLocally(/*String? orderId*/) {
    notifications.removeWhere(
        (notification) => notification.notificationType == "newMessage");
    //  if (notification.notificationType == "newMessage" &&
    //     notification.variableParams['orderId'] == orderId) {
    //   notifications.remove(notification);
    // }
  }

  int remainingMessageNotificationsCount(String orderId) {
    int count = 0;
    notifications.forEach((notification) {
      if (notification.notificationType == "newMessage" &&
          notification.variableParams['orderId'] == orderId) {
        count++;
      }
    });
    return count;
  }

  @override
  void onClose() {
    if (_taxiAuthListener != null) {
      _taxiAuthListener!
          .cancel()
          .then((value) => print(
              "A listener was disposed on currentOrderController::detachListeners !"))
          .catchError((err) => print(
              "Error happend while trying to dispose currentOrderController::detachListeners !"));
    }
    super.onClose();
  }
}
