import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/phoneCallController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage event) async {
  mezDbgPrint("firebaseMessagingBackgroundHandler::test ====> ${event.data}");
  mezDbgPrint("Handling a background message");
  if (event.data["notificationType"] == "newOrder" &&
      event.data["markReceivedUrl"] != null) {
    await markInDb(event.data["markReceivedUrl"]);
  }
}

Future<void> markInDb(String url) async {
  final String? driverId = GetStorage().read<String>(getxUserId);
  if (driverId != null) {
    url = url.replaceAll("<driverId>", driverId);
    await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, bool>{"value": true}),
    );
  }
}

class BackgroundNotificationsController extends GetxController {
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  StreamSubscription<RemoteMessage>? onMessageOpenedAppListener;
  DateTime? _lastTimeBackgroundNotificationOpenedApp;
  DateTime? get lastTimeBackgroundNotificationOpenedApp =>
      _lastTimeBackgroundNotificationOpenedApp;
  final PhoneCallController _phoneCallController = PhoneCallController();

  @override
  Future<void> onInit() async {
    super.onInit();
    final NotificationSettings settings = await requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onBackgroundMessage(
        ((RemoteMessage message) async {
          // if the incomming message has notificationType of newCall
          if (message.data["notificationType"] == "newCall") {
            // invoking fireThePhoneCall
            await _phoneCallController.fireThePhoneCall(
              callUUID: message.data["uuid"],
              callerId: message.data["id"],
              callerName: message.data["name"],
              onAnswerCallback: () {
                Get.toNamed<void>(message.data["linkUrl"]);
              },
              onDeclineCallback: null,
            );
          }

          return firebaseMessagingBackgroundHandler(message);
        }),
      );
    }
    // ignore: unawaited_futures, always_specify_types
    _messaging.getInitialMessage().then(
          (RemoteMessage? message) =>
              message != null ? notificationClickHandler(message) : null,
        );
    onMessageOpenedAppListener =
        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _lastTimeBackgroundNotificationOpenedApp = DateTime.now();
      notificationClickHandler(message);
    });
  }

  void notificationClickHandler(RemoteMessage message) {
    if (message.data["linkUrl"] != null) Get.closeAllSnackbars();
    if (message.data['linkUrl'].toString().contains('/messages/')) {
      Future<void>.delayed(Duration(milliseconds: 100), () {
        Get.toNamed<void>(kHomeRoute);

        Get.toNamed<void>(
          message.data["linkUrl"],
          arguments: <String, bool>{'showViewOrderBtn': true},
        );
      });
    } else
      Future<void>.delayed(
        Duration(milliseconds: 100),
        () => Get.toNamed<void>(message.data["linkUrl"]),
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

  @override
  Future<void> onClose() async {
    mezDbgPrint(
        "[+] DeviceNotificationsController::dispose ---------> Was invoked !");
    await onMessageOpenedAppListener?.cancel();
    super.onClose();
  }
}

// class CallsController {
//   // Callkeep
//   final FlutterCallkeep _callKeep = FlutterCallkeep();
//   bool _callKeepInited = false;

//   Future<dynamic> callBackgroundHandler(Map<String, dynamic> message) {
//     print('backgroundMessage: message => ${message.toString()}');
//     var payload = message['data'];
//     var callerId = payload['caller_id'] as String;
//     var callerNmae = payload['caller_name'] as String;
//     var uuid = payload['uuid'] as String?;
//     var hasVideo = payload['has_video'] == "true";

//     final callUUID = uuid ?? Uuid().v4();
//     _callKeep.on(CallKeepPerformAnswerCallAction(),
//         (CallKeepPerformAnswerCallAction event) {
//       print(
//           'backgroundMessage: CallKeepPerformAnswerCallAction ${event.callUUID}');
//       Timer(const Duration(seconds: 1), () {
//         print(
//             '[setCurrentCallActive] $callUUID, callerId: $callerId, callerName: $callerNmae');
//         _callKeep.setCurrentCallActive(callUUID);
//       });
//       //_callKeep.endCall(event.callUUID);
//     });

//     _callKeep.on(CallKeepPerformEndCallAction(),
//         (CallKeepPerformEndCallAction event) {
//       print(
//           'backgroundMessage: CallKeepPerformEndCallAction ${event.callUUID}');
//     });
//     if (!_callKeepInited) {
//       _callKeep.setup(
//         null,
//         <String, dynamic>{
//           'ios': {
//             'appName': getAppName(),
//           },
//           'android': {
//             'alertTitle': 'Permissions required',
//             'alertDescription':
//                 'This application needs to access your phone accounts',
//             'cancelButton': 'Cancel',
//             'okButton': 'ok',
//             'foregroundService': {
//               'channelId': getPackageName(),
//               'channelName': 'Foreground service for my app',
//               'notificationTitle': 'My app is running on background',
//               'notificationIcon':
//                   'Path to the resource icon of the notification',
//             },
//           },
//         },
//         backgroundMode: true,
//       );
//       _callKeepInited = true;
//     }

//     print('backgroundMessage: displayIncomingCall ($callerId)');
//     _callKeep.displayIncomingCall(callUUID, callerId,
//         localizedCallerName: callerNmae, hasVideo: hasVideo);
//     _callKeep.backToForeground();
//     /*

//   if (message.containsKey('data')) {
//     // Handle data message
//     final dynamic data = message['data'];
//   }

//   if (message.containsKey('notification')) {
//     // Handle notification message
//     final dynamic notification = message['notification'];
//     print('notification => ${notification.toString()}');
//   }

//   // Or do other work.
//   */
//     return Future<dynamic>.value(null);
//   }

//   // v ars --

//   RxMap<String, Call> calls = <String, Call>{}.obs;
//   String newUUID() => Uuid().v4();
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

//   ///

//   void init(BuildContext context) {
//     _callKeep.on(CallKeepDidDisplayIncomingCall(), didDisplayIncomingCall);
//     _callKeep.on(CallKeepPerformAnswerCallAction(), answerCall);
//     _callKeep.on(CallKeepDidPerformDTMFAction(), didPerformDTMFAction);
//     _callKeep.on(
//         CallKeepDidReceiveStartCallAction(), didReceiveStartCallAction);
//     _callKeep.on(CallKeepDidToggleHoldAction(), didToggleHoldCallAction);
//     _callKeep.on(
//         CallKeepDidPerformSetMutedCallAction(), didPerformSetMutedCallAction);
//     _callKeep.on(CallKeepPerformEndCallAction(), endCall);
//     _callKeep.on(CallKeepPushKitToken(), onPushKitToken);

//     _callKeep.setup(context, <String, dynamic>{
//       'ios': {
//         'appName': 'CallKeepDemo',
//       },
//       'android': {
//         'alertTitle': 'Permissions required',
//         'alertDescription':
//             'This application needs to access your phone accounts',
//         'cancelButton': 'Cancel',
//         'okButton': 'ok',
//         'foregroundService': {
//           'channelId': 'com.company.my',
//           'channelName': 'Foreground service for my app',
//           'notificationTitle': 'My app is running on background',
//           'notificationIcon': 'Path to the resource icon of the notification',
//         },
//       },
//     });

//     if (Platform.isAndroid) {
//       //if (isIOS) iOS_Permission();
//       //  _firebaseMessaging.requestNotificationPermissions();

//       _firebaseMessaging.getToken().then((token) {
//         print('[FCM] token => ' + token!);
//       });

//       FirebaseMessaging.configure(
//         onMessage: (Map<String, dynamic> message) async {
//           print('onMessage: $message');
//           if (message.containsKey('data')) {
//             // Handle data message
//             var payload = message['data'];
//             var callerId = payload['caller_id'] as String;
//             var callerName = payload['caller_name'] as String;
//             var uuid = payload['uuid'] as String;
//             var hasVideo = payload['has_video'] == "true";
//             final callUUID = uuid ?? Uuid().v4();
//             calls[callUUID] = Call(callerId);
//             _callKeep.displayIncomingCall(callUUID, callerId,
//                 localizedCallerName: callerName, hasVideo: hasVideo);
//           }
//         },
//         onBackgroundMessage: callBackgroundHandler,
//         onLaunch: (Map<String, dynamic> message) async {
//           print('onLaunch: $message');
//         },
//         onResume: (Map<String, dynamic> message) async {
//           print('onResume: $message');
//         },
//       );
//     }
//   }

//   void removeCall(String callUUID) {
//     calls.remove(callUUID);
//   }

//   void setCallHeld(String callUUID, bool held) {
//     calls[callUUID]?.held = held;
//   }

//   void setCallMuted(String callUUID, bool muted) {
//     calls[callUUID]?.muted = muted;
//   }

//   Future<void> answerCall(CallKeepPerformAnswerCallAction event) async {
//     final String callUUID = event.callUUID!;
//     final String number = calls[callUUID]!.number;
//     print('[answerCall] $callUUID, number: $number');
//     Timer(const Duration(seconds: 1), () {
//       print('[setCurrentCallActive] $callUUID, number: $number');
//       _callKeep.setCurrentCallActive(callUUID);
//     });
//   }

//   Future<void> endCall(CallKeepPerformEndCallAction event) async {
//     print('endCall: ${event.callUUID}');
//     removeCall(event.callUUID!);
//   }

//   Future<void> didPerformDTMFAction(CallKeepDidPerformDTMFAction event) async {
//     print('[didPerformDTMFAction] ${event.callUUID}, digits: ${event.digits}');
//   }

//   Future<void> didReceiveStartCallAction(
//       CallKeepDidReceiveStartCallAction event) async {
//     if (event.handle == null) {
//       // @TODO: sometime we receive `didReceiveStartCallAction` with handle` undefined`
//       return;
//     }
//     final String callUUID = event.callUUID ?? newUUID();
//     calls[callUUID] = Call(event.handle!);
//     print('[didReceiveStartCallAction] $callUUID, number: ${event.handle}');

//     _callKeep.startCall(callUUID, event.handle!, event.handle!);

//     Timer(const Duration(seconds: 1), () {
//       print('[setCurrentCallActive] $callUUID, number: ${event.handle}');
//       _callKeep.setCurrentCallActive(callUUID);
//     });
//   }

//   Future<void> didPerformSetMutedCallAction(
//       CallKeepDidPerformSetMutedCallAction event) async {
//     final String number = calls[event.callUUID]!.number;
//     print(
//         '[didPerformSetMutedCallAction] ${event.callUUID}, number: $number (${event.muted})');

//     setCallMuted(event.callUUID!, event.muted!);
//   }

//   Future<void> didToggleHoldCallAction(
//       CallKeepDidToggleHoldAction event) async {
//     final String number = calls[event.callUUID]!.number;
//     print(
//         '[didToggleHoldCallAction] ${event.callUUID}, number: $number (${event.hold})');

//     setCallHeld(event.callUUID!, event.hold!);
//   }

//   Future<void> hangup(String callUUID) async {
//     _callKeep.endCall(callUUID);
//     removeCall(callUUID);
//   }

//   Future<void> setOnHold(String callUUID, bool held) async {
//     _callKeep.setOnHold(callUUID, held);
//     final String handle = calls[callUUID]!.number;
//     print('[setOnHold: $held] $callUUID, number: $handle');
//     setCallHeld(callUUID, held);
//   }

//   Future<void> setMutedCall(String callUUID, bool muted) async {
//     _callKeep.setMutedCall(callUUID, muted);
//     final String handle = calls[callUUID]!.number;
//     print('[setMutedCall: $muted] $callUUID, number: $handle');
//     setCallMuted(callUUID, muted);
//   }

//   Future<void> updateDisplay(String callUUID) async {
//     final String number = calls[callUUID]!.number;
//     // Workaround because Android doesn't display well displayName, se we have to switch ...
//     if (isIOS) {
//       _callKeep.updateDisplay(callUUID,
//           displayName: 'New Name', handle: number);
//     } else {
//       _callKeep.updateDisplay(callUUID,
//           displayName: number, handle: 'New Name');
//     }

//     print('[updateDisplay: $number] $callUUID');
//   }

//   Future<void> displayIncomingCallDelayed(
//       String number, BuildContext context) async {
//     Timer(const Duration(seconds: 3), () {
//       displayIncomingCall(number, context);
//     });
//   }

//   Future<void> displayIncomingCall(String number, BuildContext context) async {
//     final String callUUID = newUUID();
//     calls[callUUID] = Call(number);
//     print('Display incoming call now');
//     final bool hasPhoneAccount = await _callKeep.hasPhoneAccount();
//     if (!hasPhoneAccount) {
//       await _callKeep.hasDefaultPhoneAccount(context, <String, dynamic>{
//         'alertTitle': 'Permissions required',
//         'alertDescription':
//             'This application needs to access your phone accounts',
//         'cancelButton': 'Cancel',
//         'okButton': 'ok',
//         'foregroundService': {
//           'channelId': 'com.company.my',
//           'channelName': 'Foreground service for my app',
//           'notificationTitle': 'My app is running on background',
//           'notificationIcon': 'Path to the resource icon of the notification',
//         },
//       });
//     }

//     print('[displayIncomingCall] $callUUID number: $number');
//     _callKeep.displayIncomingCall(callUUID, number,
//         handleType: 'number', hasVideo: false);
//   }

//   void didDisplayIncomingCall(CallKeepDidDisplayIncomingCall event) {
//     var callUUID = event.callUUID;
//     var number = event.handle;
//     print('[displayIncomingCall] $callUUID number: $number');
//     calls[callUUID!] = Call(number!);
//   }

//   void onPushKitToken(CallKeepPushKitToken event) {
//     print('[onPushKitToken] token => ${event.token}');
//   }
// }

class Call {
  Call(this.number);
  String number;
  bool held = false;
  bool muted = false;
}
