import 'dart:async';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message");
  print(message.toString());
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
      RemoteMessage? initialMessage =
          await FirebaseMessaging.instance.getInitialMessage();

      if (initialMessage != null) {
        print("message recieved in terminated state");
        print(initialMessage.toString());
      }
      _listeners.addAll([
        FirebaseMessaging.onMessage.listen((RemoteMessage event) {
          print("message recieved");
          print(event.notification!.body);
        }),
        FirebaseMessaging.onMessageOpenedApp.listen((message) {
          print('Message clicked!');
          print(message.toString());
        })
      ]);

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
  RxList<Notification> notifications = <Notification>[].obs;
  StreamSubscription<Event>? _taxiAuthListener;
  @override
  void onInit() async {
    super.onInit();

    if (_authController.user != null) {
      _taxiAuthListener = _databaseHelper.firebaseDatabase
          .reference()
          .child(notificationsNode(_authController.user!.uid))
          .onValue
          .listen((event) {
        notifications.value = <Notification>[];
        if (event.snapshot.value != null) {
          event.snapshot.value.forEach((dynamic key, dynamic value) {
            notifications.add(Notification.fromJson(key, value));
          });
        }
      });
    }
  }

  void clearMessageNotifications(String orderId) {
    notifications.forEach((notification) {
      if (notification.notificationType == "newMessage" &&
          notification.variableParams['orderId'] == orderId) {
        notifications.remove(notification);
      }
    });
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

  void dispose() {
    if (_taxiAuthListener != null) {
      _taxiAuthListener!
          .cancel()
          .then((value) => print(
              "A listener was disposed on currentOrderController::detachListeners !"))
          .catchError((err) => print(
              "Error happend while trying to dispose currentOrderController::detachListeners !"));
    }
  }
}
