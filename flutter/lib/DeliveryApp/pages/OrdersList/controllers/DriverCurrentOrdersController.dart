import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_driver/hsDeliveryDriver.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/queries/hsDleiveryOrderQuerries.dart';
import 'package:mezcalmos/Shared/graphql/hsDeliveryMessage/hsDeliveryMessage.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';

class DriverCurrentOrdersController {
  //instances
  DeliveryAuthController opAuthController = Get.find<DeliveryAuthController>();
  HasuraDb hasuraDb = Get.find<HasuraDb>();

  // vars
  RxList<DeliveryMessage> currentOrders = <DeliveryMessage>[].obs;
  RxList<DeliveryMessage> openOrders = <DeliveryMessage>[].obs;
  RxList<MinimalOrder> deliveryOpenOrders = <MinimalOrder>[].obs;
  RxList<MinimalOrder> deliveryCurrentOrders = <MinimalOrder>[].obs;

  RxBool initalized = RxBool(false);
  int get driverId => opAuthController.driver!.deliveryDriverId;
  RxBool _isOnline = RxBool(true);
  RxBool onlineClicked = RxBool(false);
// streams
  StreamSubscription<List<DeliveryMessage>?>? currentOrdersListener;
  StreamSubscription<List<DeliveryMessage>?>? openOrdersListener;
  String? subscriptionId;

// getters

  bool get isOnline => _isOnline.value;

  Future<void> init() async {
    _isOnline.value = opAuthController.driver!.deliveryDriverState.online;
    await _initOrders();

    _listenOnOrders();
  }

  Future<void> _initOrders() async {
    try {
      deliveryOpenOrders.value =
          await get_open_driver_orders() ?? <MinimalOrder>[];
      mezDbgPrint(
          "DV OPEN ORDERS ===============>${deliveryOpenOrders.value.length}");
      openOrders.value = await getDvOpenMessages(withCache: false);

      currentOrders.value =
          await getDvCurrentMessages(driverId: driverId, withCache: false);
      mezDbgPrint("Orders length ======>${openOrders.length}");
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      // TODO
    }
  }

  void _listenOnOrders() {
    subscriptionId = hasuraDb.createSubscription(start: () {
      currentOrdersListener = listenDvCurrentMessages(driverId: driverId)
          .listen((List<DeliveryMessage>? event) {
        if (event != null) {
          currentOrders.value = event;
        }
      });
      openOrdersListener =
          listenDvOpenMessages().listen((List<DeliveryMessage>? event) {
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
    _isOnline.value = value;
    _isOnline.refresh();
    _isOnline.value = await switch_driver_online_status_by_id(
            driverId: opAuthController.driver!.deliveryDriverId,
            online: value) ??
        _isOnline.value;

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

  Future<void> finishAllOrders() async {
    final List<String> numbers = currentOrders
        .map((DeliveryMessage element) => element.phoneNumber)
        .toList();
    try {
      final MarkMessagesResponse res =
          await CloudFunctions.whatsapp_markMessagesAsFinished(
              phoneNumbers: numbers);
      if (res.success) {
        showSavedSnackBar(
            title: "Finished", subtitle: "All messgaes are finished");
      }
    } catch (e, stk) {
      showErrorSnackBar();
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  void dispose() {
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
  }
}

class DeliveryMessage {
  final int id;
  final DvMessageEntry entry;
  final String phoneNumber;
  final String? userName;
  final String? userImage;
  final String? driverName;
  final String? driverPhone;
  final int? driverId;
  final DateTime receivedTime;
  final DateTime? finishedTime;
  final DateTime? respondedTime;

  DeliveryMessage({
    required this.id,
    required this.entry,
    required this.phoneNumber,
    this.driverId,
    required this.receivedTime,
    this.finishedTime,
    this.respondedTime,
    this.userImage,
    this.userName,
    this.driverName,
    this.driverPhone,
  });
  bool get isResponded => respondedTime != null && driverId != null;
}

class DvMessageEntry {
  final String id;
  final String from;
  final DvTextMessage? text;
  final String type;
  final bool resolved;
  final DateTime timestamp; // Change the type to DateTime

  DvMessageEntry({
    required this.id,
    required this.from,
    this.text,
    required this.type,
    required this.resolved,
    required this.timestamp,
  });

  factory DvMessageEntry.fromJson(Map<String, dynamic> json) {
    return DvMessageEntry(
      id: json['id'] ?? '',
      from: json['from'] ?? '',
      text: DvTextMessage.fromJson(json['text'] ?? <String, dynamic>{}),
      type: json['type'] ?? '',
      resolved: json['resolved'] ?? false,
      timestamp: DateTime.fromMillisecondsSinceEpoch(
          int.parse(json['timestamp'] ?? '0') *
              1000), // Convert timestamp to DateTime
    );
  }
}

class DvTextMessage {
  final String body;

  DvTextMessage({
    required this.body,
  });

  factory DvTextMessage.fromJson(Map<String, dynamic> json) {
    return DvTextMessage(
      body: json['body'] ?? '',
    );
  }
}
