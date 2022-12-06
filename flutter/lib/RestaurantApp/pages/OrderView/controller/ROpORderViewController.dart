import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/order/hsRestaurantOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

class ROpOrderViewController {
  Rxn<RestaurantOrder> order = Rxn();
  StreamSubscription? orderStream;

  Future<void> init({required int orderId}) async {
    order.value = await get_restaurant_order_by_id(orderId: orderId);
    if (order.value == null) {
      mezDbgPrint("🚨 Can't get order $orderId 🚨 ROpOrderViewController");
    } else {
      orderStream = listen_on_restaurant_order_by_id(orderId: orderId)
          .listen((RestaurantOrder? event) {
        mezDbgPrint(event);
        if (event != null) {
          mezDbgPrint("Stream triggred from order controller ✅✅✅✅✅✅✅✅✅");
          order.value = event;
        }
      });
    }
    mezDbgPrint("Order stream =============>$orderStream");
  }

  void dispose() {
    order.close();
    orderStream?.cancel();
    orderStream = null;
  }
}
