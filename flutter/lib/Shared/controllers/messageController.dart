import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';

class MessageController extends GetxController with MezDisposable {
  Rx<Chat> _model = Chat("", "", {}, [], "").obs;
  Chat? get value => _model.value;
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();

  late String _dbAddress;

  @override
  void onInit() {
    super.onInit();
    print("--------------------> messageController Initialized !");
  }

  void loadChat(String userId, String orderId,
      {VoidCallback? onValueCallBack}) {
    _dbAddress = orderChatNode(orderId);

    _databaseHelper.firebaseDatabase
        .reference()
        .child(orderChatNode(orderId))
        .onValue
        .listen((event) {
      if (event.snapshot.value != null) {
        // print("\n\n\n ${event.snapshot.value} \n\n\n");
        Chat res = Chat.fromJson(event.snapshot.key, event.snapshot.value);

        _model.value = res;
        if (onValueCallBack != null) onValueCallBack();
        // print(
        //     "--------------------> messageController Listener Invoked with Messages > ${_model.value.messages} ");
      }
    }).canceledBy(this);
  }

  void sendMessage(String message) {
    _databaseHelper.firebaseDatabase
        .reference()
        .child('$_dbAddress/messages')
        .push()
        .set(<String, dynamic>{
      "message": message,
      "userId": _authController.user!.uid,
      "timestamp": DateTime.now().toUtc().toString(),
      "orderId": _model.value.orderId
    });
  }

  Participant? sender() {
    return _model.value.participants[_authController.user!.uid];
  }

  Participant? recipient() {
    Participant? recipient = null;
    _model.value.participants.forEach((key, value) {
      if (key != _authController.user!.uid) {
        recipient = value;
      }
    });
    return recipient;
  }

  // using onClose better , since  the getter of GetX invoke it automatically.
  // for now we will delete the MessageController instance manually , when Order canceled or finished.
  // Later on , it will be done automatically by GetX since we will be changing everything to GetxPage routes.

  @override
  void onClose() {
    cancelSubscriptions();
    super.onClose();
  }
}
