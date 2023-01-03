import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/hsDeliveryOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class DriverCurrentOrdersController {
  //instances
  DeliveryAuthController opAuthController = Get.find<DeliveryAuthController>();
  HasuraDb hasuraDb = Get.find<HasuraDb>();

  // vars
  RxList<MinimalOrder> currentOrders = <MinimalOrder>[].obs;
  RxList<MinimalOrder> pastOrders = <MinimalOrder>[].obs;
  RxBool initalized = RxBool(false);
  late int driverId;
  // Rxn<Restaurant> restaurant = Rxn();
  Rxn<ServiceStatus> _serviceStatus = Rxn();
  RxBool _isApproved = RxBool(false);
// streams
  StreamSubscription? currentOrdersListener;
  String? subscriptionId;

// getters
  bool get isOpen => _serviceStatus == ServiceStatus.Open;
  bool get isAproved => _isApproved.value;

  Future<void> init() async {
    driverId = opAuthController.driver!.deliveryDriverId;
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

  // Future<void> _fetchServiceStatus(int restaurantId) async {
  //   _serviceStatus.value =
  //       await get_restaurant_status(restaurantId: restaurantId);
  //   _isApproved.value =
  //       await get_restaurant_approved(restaurantId: restaurantId) ?? false;
  // }

  // Future<void> turnOffOrders() async {
  //   _serviceStatus.value = await update_restaurant_status(
  //       id: restaurantId, status: ServiceStatus.Closed_temporarily);
  // }

  // Future<void> turnOnOrders() async {
  //   _serviceStatus.value = await update_restaurant_status(
  //       id: restaurantId, status: ServiceStatus.Open);
  // }

  void dispose() {
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    currentOrders.close();
  }
}
