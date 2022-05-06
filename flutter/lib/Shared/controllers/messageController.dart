// import 'dart:async';

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart' as material;
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/rootNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';

class MessageController extends GetxController {
  Rxn<Chat> chat = Rxn();
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();
  StreamSubscription? chatListener;
  late AppType appType;

  @override
  void onInit() {
    super.onInit();
    mezDbgPrint("--------------------> messageController Initialized !");
    appType = Get.find<SettingsController>().appType;
  }

  void loadChat(
      {required String chatId, material.VoidCallback? onValueCallBack}) {
    chatListener?.cancel();
    chatListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(chatNode(chatId))
        .onValue
        .listen((Event event) {
      if (event.snapshot.value != null) {
        // mezDbgPrint("\n\n\n ${event.snapshot.value} \n\n\n");
        chat.value = Chat.fromJson(event.snapshot.key, event.snapshot.value);
        if (onValueCallBack != null) onValueCallBack();
        // mezDbgPrint(
        //     "--------------------> messageController Listener Invoked with Messages > ${_model.value.messages} ");
      }
    });
  }

  void sendMessage(
      {required String message,
      required String chatId,
      String? orderId}) async {
    final DatabaseReference messageNode = _databaseHelper.firebaseDatabase
        .reference()
        .child('${chatNode(chatId)}/messages')
        .push();

    // ignore: unawaited_futures
    messageNode.set(<String, dynamic>{
      "message": message,
      "userId": _authController.user!.id,
      "timestamp": DateTime.now().toUtc().toString(),
      "chatId": chatId,
      "orderId": orderId
    });

    // ignore: unawaited_futures
    _databaseHelper.firebaseDatabase
        .reference()
        .child('notificationQueue/${messageNode.key}')
        .set(MessageNotificationForQueue(
                message: message,
                userId: _authController.user!.id,
                chatId: chatId,
                messageId: messageNode.key,
                orderId: orderId)
            .toFirebaseFormatJson());
  }

  Participant? sender() {
    return chat.value?.participants[_authController.user!.id];
  }

  Participant? recipient(
      {required ParticipantType recipientType, String? recipientId}) {
    if (chat.value == null) return null;
    if (recipientId != null) {
      for (String key in chat.value!.participants.keys.toList()) {
        final Participant participant = chat.value!.participants[key]!;
        if (participant.id == recipientId) return participant;
      }
    }
    for (String key in chat.value!.participants.keys.toList()) {
      final Participant participant = chat.value!.participants[key]!;
      if (participant.participantType == recipientType) {
        mezDbgPrint(
            "the user name is ${participant.name} and the type is ${participant.participantType.toString()}");
        return participant;
      }
    }

    for (String key in chat.value!.participants.keys.toList()) {
      final Participant participant = chat.value!.participants[key]!;
      if (participant.id != _authController.user!.id) return participant;
    }
    return null;
  }

  void clearMessageNotifications({required String chatId}) {
    mezDbgPrint("Clearing message notifications");
    final ForegroundNotificationsController fbNotificationsController =
        Get.find<ForegroundNotificationsController>();
    fbNotificationsController
        .notifications()
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.chatId == chatId)
        .forEach((Notification notification) {
      fbNotificationsController.removeNotification(notification.id);
    });
  }

  // using onClose better , since  the getter of GetX invoke it automatically.
  // for now we will delete the MessageController instance manually , when Order canceled or finished.
  // Later on , it will be done automatically by GetX since we will be changing everything to GetxPage routes.

  @override
  void onClose() {
    chatListener?.cancel();
    chatListener = null;
    super.onClose();
  }
}
