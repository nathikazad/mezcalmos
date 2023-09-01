import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_driver/hsDeliveryDriver.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/queries/hsDleiveryOrderQuerries.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/subscriptions/hsDeliveryOrderSubscriptions.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';

class DriverCurrentOrdersController {
  //instances
  DeliveryAuthController opAuthController = Get.find<DeliveryAuthController>();
  HasuraDb hasuraDb = Get.find<HasuraDb>();

  // vars
  RxList<MinimalOrder> currentOrders = <MinimalOrder>[].obs;
  RxList<MinimalOrder> openOrders = <MinimalOrder>[].obs;
  RxBool initalized = RxBool(false);
  late int driverId;
  RxBool _isOnline = RxBool(true);
  RxBool onlineClicked = RxBool(false);
// streams
  StreamSubscription? currentOrdersListener;
  StreamSubscription? openOrdersListener;
  String? subscriptionId;
  List<WhMessage> messages = [
    WhMessage(
        subtitle:
            "Pedido realizado. Enviado al restaurante por WhatsApp. Verifica el estado del pedido con el restaurante. ¡Gracias!",
        date: DateTime(2023, 8, 31, 10, 15),
        phoneNumber: "+1234567890",
        isResolved: true),
    WhMessage(
        subtitle:
            "Order placed. Sent to restaurant via WhatsApp. Check order status with restaurant. Thank you!",
        date: DateTime(2023, 8, 31, 11, 30),
        phoneNumber: "+9876543210",
        isResolved: false),
    WhMessage(
        subtitle:
            "Tu pedido ha sido enviado al restaurante. Por favor, verifica el estado del pedido. ¡Gracias!",
        date: DateTime(2023, 8, 31, 12, 45),
        phoneNumber: "+1112223333",
        isResolved: false),
    WhMessage(
        subtitle:
            "Orden confirmada. Enviamos tu solicitud al restaurante. Por favor, mantente atento a las actualizaciones. ¡Gracias!",
        date: DateTime(2023, 8, 31, 14, 0),
        phoneNumber: "+4445556666",
        isResolved: false)
  ];

// getters

  bool get isOnline => _isOnline.value;

  Future<void> init() async {
    if (opAuthController.driver != null) {
      driverId = opAuthController.driver!.deliveryDriverId;
      _isOnline.value = opAuthController.driverState!.isOnline;
      mezDbgPrint("INIT ORDERS 👋👋👋👋👋👋 Restaurant id $driverId");
      try {
        // await _fetchServiceStatus(restaurantId);

        await _initOrders();
      } on Exception catch (e, stk) {
        mezDbgPrint(e);
        mezDbgPrint(stk);
      }

      initalized.value = true;
    }
  }

  Future<void> _initOrders() async {
    currentOrders.value =
        await get_current_driver_orders(driverId: driverId) ?? [];
    openOrders.value = await get_open_driver_orders(driverId: driverId) ?? [];
    subscriptionId = hasuraDb.createSubscription(start: () {
      currentOrdersListener =
          listen_on_current_driver_orders(driverId: driverId)
              .listen((List<MinimalOrder>? event) {
        if (event != null) {
          currentOrders.value = event;
        }
      });
      openOrdersListener = listen_on_open_driver_orders(driverId: driverId)
          .listen((List<MinimalOrder>? event) {
        if (event != null) {
          openOrders.value = event;
        }
      });
    }, cancel: () {
      currentOrdersListener?.cancel();
      currentOrdersListener = null;
      openOrdersListener?.cancel();
      openOrdersListener = null;
    });
  }

  Future<void> switchOnlineStatus(bool value) async {
    onlineClicked.value = true;
    _isOnline.value = await switch_driver_online_status_by_id(
            driverId: driverId, online: value) ??
        opAuthController.driverState!.isOnline;
    _isOnline.refresh();
    if (value) {
      unawaited(opAuthController
          .setupDeliveryDriver()
          .then((value) => opAuthController.startLocationListener()));
    } else {
      opAuthController.cancelLocationListener();
    }

    onlineClicked.value = false;
  }

  void dispose() {
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    currentOrders.close();
  }
}

class WhMessage {
  String subtitle;
  DateTime date;
  String phoneNumber;
  bool isResolved;

  WhMessage({
    required this.subtitle,
    required this.date,
    required this.isResolved,
    required this.phoneNumber,
  });
  IconData get icon {
    return isResolved ? Icons.check : Icons.watch_later_rounded;
  }
}
