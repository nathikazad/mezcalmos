import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/Shared/graphql/order/hsRestaurantOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';

class ROpPastOrdersController {
  //instances
  RestaurantOpAuthController opAuthController =
      Get.find<RestaurantOpAuthController>();

  // vars

  RxList<MinimalOrder> pastOrders = <MinimalOrder>[].obs;
  RxBool initalized = RxBool(false);
  late int restaurantId;

// getters

  Future<void> init() async {
    restaurantId = opAuthController.restaurantId!;
    mezDbgPrint("INIT PAST ORDERS 👋👋👋👋👋👋 Restaurant id $restaurantId");
    try {
      await _initOrders();
    } on Exception catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }

    initalized.value = true;
  }

  Future<void> _initOrders() async {
    pastOrders.value =
        await get_past_restaurant_orders(restaurantId: restaurantId) ?? [];
  }

  // Future<void> _fetchServiceStatus(int restaurantId) async {
  //   _serviceStatus.value =
  //       await get_restaurant_status(restaurantId: restaurantId);
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
    // currentOrdersListener?.cancel();
    // currentOrdersListener = null;
  }
}
