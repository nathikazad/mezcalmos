import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/buttonStyles.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

Widget? changeStatusButton(Rxn<RestaurantOrder> order) {
  mezDbgPrint(order.value);
  switch (order.value!.status) {
    case RestaurantOrderStatus.OrderReceieved:
      return BUttonsStyle.orderReceievedButtonWidget(order.value!.orderId);

    case RestaurantOrderStatus.PreparingOrder:
      return BUttonsStyle.preparingOrderButtonWidget(order.value!.orderId);

    case RestaurantOrderStatus.ReadyForPickup:
      return BUttonsStyle.readyForPickupButtonWidget(order.value!.orderId);
    case RestaurantOrderStatus.OnTheWay:
      return BUttonsStyle.onTheWayButtonWidget(order.value!.orderId);

    default:
      return null;
  }
}
