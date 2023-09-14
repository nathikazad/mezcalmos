import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/hsDeliveryMessage/hsDeliveryMessage.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class DriverCurrentOrdersController {
  //instances
  DeliveryAuthController opAuthController = Get.find<DeliveryAuthController>();
  HasuraDb hasuraDb = Get.find<HasuraDb>();

  // vars
  RxList<DeliveryMessage> currentOrders = <DeliveryMessage>[].obs;
  RxList<DeliveryMessage> openOrders = <DeliveryMessage>[].obs;

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
    await _initOrders();
    _listenOnOrders();
  }

  Future<void> _initOrders() async {
    try {
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
    // onlineClicked.value = true;
    // _isOnline.value = await switch_driver_online_status_by_id(
    //         driverId: driverId, online: value) ??
    //     opAuthController.driverState!.isOnline;
    // _isOnline.refresh();
    // if (value) {
    //   unawaited(opAuthController
    //       .setupDeliveryDriver()
    //       .then((value) => opAuthController.startLocationListener()));
    // } else {
    //   opAuthController.cancelLocationListener();
    // }

    // onlineClicked.value = false;
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
  final int? driverId;
  final DateTime receivedTime;
  final DateTime? finishedTime;
  final int? userId;
  final DateTime? respondedTime;

  DeliveryMessage({
    required this.id,
    required this.entry,
    required this.phoneNumber,
    this.driverId,
    required this.receivedTime,
    this.finishedTime,
    required this.userId,
    this.respondedTime,
    this.userImage,
    this.userName,
  });
  bool get isResponded => respondedTime != null && driverId != null;
}

class DvMessageEntry {
  final String id;
  final String from;
  final DvTextMessage text;
  final String type;
  final bool resolved;
  final DateTime timestamp; // Change the type to DateTime

  DvMessageEntry({
    required this.id,
    required this.from,
    required this.text,
    required this.type,
    required this.resolved,
    required this.timestamp,
  });

  factory DvMessageEntry.fromJson(Map<String, dynamic> json) {
    return DvMessageEntry(
      id: json['id'] ?? '',
      from: json['from'] ?? '',
      text: DvTextMessage.fromJson(json['text']),
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
