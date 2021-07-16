import 'dart:async';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage message) async {
  print("Handling a background message");
  print(message.toString());
}

class NotificationsController extends GetxController {
  FirebaseMessaging _messaging = FirebaseMessaging.instance;

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

      FirebaseMessaging.onMessage.listen((RemoteMessage event) {
        print("message recieved");
        print(event.notification!.body);
      });

      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        print('Message clicked!');
        print(message.toString());
      });

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

  //TODO: detach listeners on signout
}
