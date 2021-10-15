import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
// import 'package:mezcalmos/Shared/constants/routes.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as MezNotification;
// import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
// import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
// import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:http/http.dart' as http;
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage event) async {
  mezDbgPrint("Handling a background message");
  if (event.data["notificationType"] == "newOrder" &&
      event.data["markReceivedUrl"] != null) {
    markInDb(event.data["markReceivedUrl"]);
  }
}

void markInDb(String url) async {
  String? driverId = GetStorage().read<String>(getUserId);
  if (driverId != null) {
    url = url.replaceAll("<driverId>", driverId);
    http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, bool>{"value": true}),
    );
  }
  // .then((value) => mezDbgPrint(jsonDecode(value.body)["data"]));
}

class DeviceNotificationsController extends GetxController {
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  List<StreamSubscription<RemoteMessage>> _listeners =
      <StreamSubscription<RemoteMessage>>[];

  @override
  void onInit() async {
    super.onInit();
    NotificationSettings settings = await requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    }
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
    mezDbgPrint('User granted permission: ${settings.authorizationStatus}');
    return settings;
  }

  Future<String?> getToken() async {
    final token = await _messaging.getToken();
    return token;
  }

  void detachListeners() {
    _listeners.forEach((sub) => sub
        .cancel()
        .then((value) => mezDbgPrint(
            "A listener was disposed on deviceNotificationsController !"))
        .catchError((err) => mezDbgPrint(
            "Error happend while trying to dispose deviceNotificationsController!")));
  }

  @override
  void onClose() async {
    mezDbgPrint(
        "[+] DeviceNotificationsController::dispose ---------> Was invoked !");
    detachListeners();
    super.onClose();
  }
}

abstract class FBNotificationsController extends GetxController {
  AuthController authController = Get.find<AuthController>();
  DatabaseHelper databaseHelper = Get.find<DatabaseHelper>();
  RxList<MezNotification.Notification> notifications =
      <MezNotification.Notification>[].obs;
  // StreamSubscription<Event>? taxiAuthListener;
  // List taxiAuthListenerCallbacks = [];
  RxBool _hasNewNotification = false.obs;
  LanguageController lang = Get.find<LanguageController>();

  bool get hasNewNotification => _hasNewNotification.value;
  set hasNewNotification(bool r) => _hasNewNotification.value = r;

  @override
  void onInit() async {
    super.onInit();
    mezDbgPrint("Hi from FBNOTIFICONTROLLER !");
  }

  // using this we can register our callbacks from diffrent places , and invoke them onValue !
  // void registerCallbackOnListenerInvoke(callback) {
  //   // if (!taxiAuthListenerCallbacks.contains(callback)) {
  //   //   mezDbgPrint(taxiAuthListenerCallbacks);
  //   taxiAuthListenerCallbacks.add(callback);
  //   mezDbgPrint(taxiAuthListenerCallbacks);
  //   mezDbgPrint("[+] ----------> $callback  ::  Was Registred successfully !!");
  //   // }
  // }

  // dynamic checkCallbackIsRegistred(String orderId) {
  //   dynamic res = taxiAuthListenerCallbacks.singleWhere(
  //       (element) => element['orderId'] == orderId,
  //       orElse: () => null);
  //   mezDbgPrint("Resuly -----------> $res");
  //   return res;
  // }

  void clearAllMessageNotification() {
    mezDbgPrint(
        "-=-=-=-=-=-=-=-=-=-=-=-=-=-= Clearing All Messages Notifications -=-=-=-=-=-=-=-=-=-=-=-=-=-= ");
    _hasNewNotification.value = false;
    _clearMessageNotificationsLocally();
    setAllMessagesAsReadInDb();
  }

  Future<void> setAllMessagesAsReadInDb();

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
    super.onClose();
  }
}
