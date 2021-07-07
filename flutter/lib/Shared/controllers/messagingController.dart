import 'dart:async';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MessagingController extends GetxController {
  FirebaseMessaging _messaging = FirebaseMessaging.instance;

  //------------------------------------------------
  @override
  void onInit() {
    super.onInit();
    requestPermission();
   //------------------------------------------------
//----------------------On message listener--------------------------
 FirebaseMessaging.onMessage.listen((RemoteMessage event) {
    print("message recieved");
    print(event.notification!.body);
  });

//------------------------------------------------
//----------------------On Opened App message Click--------------------------
 FirebaseMessaging.onMessageOpenedApp.listen((message) {
    print('Message clicked!');
  });
//------------------------------------------------
//----------------------On Opened App message Click--------------------------
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message");
}
 FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//------------------------------------------------
  }
  //----------------------Request Permission--------------------------
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


//----------------------Get Token--------------------------
Future<String?> getToken() async{
   final token= await _messaging.getToken();
   return  token;
}
//------------------------------------------------

}

