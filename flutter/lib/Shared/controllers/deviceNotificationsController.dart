import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
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
  String? driverId = GetStorage().read<String>(getxUserId);
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

  @override
  void onInit() async {
    super.onInit();
    mezDbgPrint("DeviceNotificationsController onInit");
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
    mezDbgPrint(
        'User granted notification permission: ${settings.authorizationStatus}');
    return settings;
  }

  Future<String?> getToken() async {
    final token = await _messaging.getToken();
    return token;
  }

  @override
  void onClose() async {
    mezDbgPrint(
        "[+] DeviceNotificationsController::dispose ---------> Was invoked !");
    super.onClose();
  }
}
