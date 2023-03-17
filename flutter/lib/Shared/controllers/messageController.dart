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
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/chatNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/rootNodes.dart';
import 'package:mezcalmos/Shared/graphql/chat/hsChat.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';

class MessageController extends GetxController {
  Rxn<HasuraChat> chat = Rxn();
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  HasuraDb hasuraDb = Get.find<HasuraDb>();
  String? subscriptionId;

  AuthController _authController = Get.find<AuthController>();
  SettingsController _settingsController = Get.find<SettingsController>();
  StreamSubscription? chatListener;
  late AppType appType;

  @override
  void onInit() {
    super.onInit();
    mezDbgPrint("--------------------> messageController Initialized !");
    appType = Get.find<SettingsController>().appType;
  }

  void loadChat({required int chatId, material.VoidCallback? onValueCallBack}) {
    mezDbgPrint("Load chat id ------------->>>> $chatId");

    get_chat_info(chat_id: chatId).then((HasuraChat? value) {
      mezDbgPrint("[77] Got Chat :: id ($chatId) :: $value !");

      if (value != null) {
        mezDbgPrint("[77] Got Chat !");
        chat.value = value;

        if (onValueCallBack != null) onValueCallBack();
      }

      if (subscriptionId != null) {
        hasuraDb.cancelSubscription(subscriptionId!);
        chatListener?.cancel();
        chatListener = null;
      } // if no listeneres we listen
      subscriptionId = hasuraDb.createSubscription(start: () {
        chatListener = listen_on_chat_messages(chatId: chatId)
            .listen((List<Message> msgs) {
          mezDbgPrint(
              "[+] Chat :: new messages :: trigger :: listener! =====>> ${chat.value.toString()}");
          if (msgs.isNotEmpty && msgs.length > chat.value!.messages.length) {
            chat.value!.messages.clear();
            chat.value!.messages.addAll(msgs);
            if (onValueCallBack != null) onValueCallBack();
          }
        });
      }, cancel: () {
        chatListener?.cancel();
        chatListener = null;
      });
    });
  }

  bool isInAppCallFeatureAvailable() {
    // This will be false for chats of type group
    return true;
  }

  Future<void> sendMessage({
    required String message,
    required int chatId,
  }) async {
    final DatabaseReference messageNode = _databaseHelper.firebaseDatabase
        .ref()
        .child(messagesNode(chatId.toString()))
        .push();

    await send_message(chat_id: chatId, msg:
        // timestamp as key
        <String, dynamic>{
      "timestamp": DateTime.now().toUtc().toString(),
      "message": message,
      "userId": _authController.user!.hasuraId,
    });

    // ignore: unawaited_futures
    _databaseHelper.firebaseDatabase
        .ref()
        .child(notificationQueueNode(messageNode.key))
        .set(MessageNotificationForQueue(
          message: message,
          userId: Get.find<AuthController>().hasuraUserId!,
          chatId: chatId.toString(),
          messageId: messageNode.key!,
          participantType:
              _settingsController.appType.convertParticipantTypefromAppType(),
        ).toFirebaseFormatJson());
  }

  void clearMessageNotifications({required int chatId}) {
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
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    super.onClose();
  }
}
