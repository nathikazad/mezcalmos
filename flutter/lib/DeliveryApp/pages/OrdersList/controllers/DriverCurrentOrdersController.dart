import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_driver/hsDeliveryDriver.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/hsDeliveryOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';

class DriverCurrentOrdersController {
  //instances
  DeliveryAuthController opAuthController = Get.find<DeliveryAuthController>();
  HasuraDb hasuraDb = Get.find<HasuraDb>();

  // vars
  RxList<MinimalOrder> currentOrders = <MinimalOrder>[].obs;
  RxList<MinimalOrder> pastOrders = <MinimalOrder>[].obs;
  RxBool initalized = RxBool(false);
  late int driverId;
  RxBool _isOnline = RxBool(true);
  RxBool onlineClicked = RxBool(false);
// streams
  StreamSubscription? currentOrdersListener;
  String? subscriptionId;

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
    pastOrders.value = await get_past_driver_orders(driverId: driverId) ?? [];
    subscriptionId = hasuraDb.createSubscription(start: () {
      currentOrdersListener =
          listen_on_current_driver_orders(driverId: driverId)
              .listen((List<MinimalOrder>? event) {
        if (event != null) {
          currentOrders.value = event;
        }
      });
    }, cancel: () {
      currentOrdersListener?.cancel();
      currentOrdersListener = null;
    });
  }

  Future<void> switchOnlineStatus(bool value) async {
    onlineClicked.value = true;
    _isOnline.value = await switch_driver_online_status_by_id(
            driverId: driverId, online: value) ??
        opAuthController.driverState!.isOnline;
    _isOnline.refresh();
    onlineClicked.value = false;
  }

  void dispose() {
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    currentOrders.close();
  }
}
