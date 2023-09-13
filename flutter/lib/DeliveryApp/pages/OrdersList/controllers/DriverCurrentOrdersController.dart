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

  List<WhMessage> get resolvedMessages =>
      _messages.where((WhMessage element) => element.resolved).toList();
  List<WhMessage> get unResolvedMessages =>
      _messages.where((WhMessage element) => !element.resolved).toList();

  List<WhMessage> _messages = [
    WhMessage(
      from: "12098628445",
      id: "wamid.HBgLMTIwOTg2Mjg0NDUVAgASGBQzQTBBOEQ2Q0E2Mjk2QjEwRDlGNAA=",
      resolved: false,
      text: TextMessage(body: "Hey"),
      timestamp: DateTime.now(),
      type: "text",
    ),
    WhMessage(
      from: "123456789",
      id: "wamid.XYZ123456789",
      resolved: true,
      text: TextMessage(body: "Hello there!"),
      timestamp: DateTime.now().subtract(Duration(days: 1)),
      type: "text",
    ),
    WhMessage(
      from: "987654321",
      id: "wamid.ABC987654321",
      resolved: false,
      text: TextMessage(body: "Hi, how are you?"),
      timestamp: DateTime.now().subtract(Duration(days: 2)),
      type: "text",
    ),
    WhMessage(
      from: "555555555",
      id: "wamid.PQR555555555",
      resolved: true,
      text: TextMessage(body: "Goodbye"),
      timestamp: DateTime.now().subtract(Duration(days: 3)),
      type: "text",
    ),
    WhMessage(
      from: "555555555",
      id: "wamid.PQR555555555",
      resolved: true,
      text: TextMessage(body: "Goodbye"),
      timestamp: DateTime.now().subtract(Duration(days: 3)),
      type: "text",
    ),
    WhMessage(
      from: "555555555",
      id: "wamid.PQR555555555",
      resolved: true,
      text: TextMessage(body: "Goodbye"),
      timestamp: DateTime.now().subtract(Duration(days: 3)),
      type: "text",
    ),
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
  String from;
  String id;
  bool resolved;
  TextMessage text;
  DateTime timestamp;
  String type;

  WhMessage({
    required this.from,
    required this.id,
    required this.resolved,
    required this.text,
    required this.timestamp,
    required this.type,
  });
  IconData get icon {
    return resolved ? Icons.check : Icons.watch_later_rounded;
  }

  factory WhMessage.fromJson(Map<String, dynamic> json) {
    return WhMessage(
      from: json['from'],
      id: json['id'],
      resolved: json['resolved'],
      text: TextMessage.fromJson(json['text']),
      timestamp: DateTime.parse(json['timestamp']),
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() => {
        'from': from,
        'id': id,
        'resolved': resolved,
        'text': text.toJson(),
        'timestamp': timestamp.toUtc(),
        'type': type,
      };
}

class TextMessage {
  String body;

  TextMessage({required this.body});

  factory TextMessage.fromJson(Map<String, dynamic> json) {
    return TextMessage(body: json['body']);
  }

  Map<String, dynamic> toJson() => {'body': body};
}
