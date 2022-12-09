import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/order/hsRestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalRestaurantOrder.dart';

class ROpCurrentOrdersController {
  RxList<MinimalRestaurantOrder> currentOrders = <MinimalRestaurantOrder>[].obs;
  StreamSubscription? currentOrdersListener;
  late int restaurantId;

  Future<void> init({required int restaurantId}) async {
    this.restaurantId = restaurantId;
    currentOrders.value =
        await get_current_restaurant_orders(restaurantId: restaurantId) ?? [];
    currentOrdersListener =
        listen_on_current_restaurant_orders(restaurantId: restaurantId)
            .listen((List<MinimalRestaurantOrder>? event) {
      if (event != null) {
        currentOrders.value = event;
      }
    });
  }

  void dispose() {
    currentOrdersListener?.cancel();
    currentOrdersListener = null;
  }
}
