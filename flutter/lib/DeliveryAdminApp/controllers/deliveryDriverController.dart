import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/deliveryNodes.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';

import '../../Shared/helpers/PrintHelper.dart';

class DeliveryDriverController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  ForegroundNotificationsController _fbNotificationsController =
      Get.find<ForegroundNotificationsController>();
  RxList<DeliveryDriver> deliveryDrivers = <DeliveryDriver>[].obs;
  StreamSubscription? _deliveryDriversListener;

  @override
  void onInit() {
    super.onInit();
    mezDbgPrint("--------------------> DeliveryDriverController Initialized !");

    _deliveryDriversListener?.cancel();
    _deliveryDriversListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(deliveryDriversNode())
        .onValue
        .listen((Event event) {
      final List<DeliveryDriver> _deliveryDrivers = <DeliveryDriver>[];
      if (event.snapshot.value != null) {
        for (var deliveryDriverId in event.snapshot.value.keys) {
          final dynamic deliveryDriverData =
              event.snapshot.value[deliveryDriverId];

          _deliveryDrivers.add(
            DeliveryDriver.fromData(deliveryDriverId, deliveryDriverData),
          );
        }
      }
      deliveryDrivers.value = _deliveryDrivers;
    });
  }

  Future<ServerResponse> assignDeliveryDriver({
    required String deliveryDriverId,
    required String orderId,
    required OrderType orderType,
    DeliveryDriverType deliveryDriverType = DeliveryDriverType.DropOff,
    bool changeDriver = false,
  }) async {
    final HttpsCallable dropOrderFunction =
        FirebaseFunctions.instance.httpsCallable('delivery-assignDriver');
    try {
      final HttpsCallableResult<dynamic> response =
          await dropOrderFunction.call(
        <String, dynamic>{
          "orderId": orderId,
          "deliveryDriverType": deliveryDriverType.toFirebaseFormatString(),
          "deliveryDriverId": deliveryDriverId,
          "orderType": orderType.toFirebaseFormatString(),
          "changeDriver": changeDriver,
        },
      );
      debugPrint('HttpsCallableResult response: ${response.data}');
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(
        ResponseStatus.Error,
        errorMessage: "Server Error",
        errorCode: "serverError",
      );
    }
  }
}
