import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/ButtonStyles.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

Widget? changeStatusButton(Rxn<RestaurantOrder> order) {
  mezDbgPrint(order.value);
  switch (order.value!.status) {
    case RestaurantOrderStatus.OrderReceieved:
      return ButtonsStyle.orderReceievedButtonWidget(order.value!.orderId);

    case RestaurantOrderStatus.PreparingOrder:
      return ButtonsStyle.preparingOrderButtonWidget(order.value!.orderId);

    case RestaurantOrderStatus.ReadyForPickup:
      return ButtonsStyle.readyForPickupButtonWidget(order.value!.orderId);
    case RestaurantOrderStatus.OnTheWay:
      return ButtonsStyle.onTheWayButtonWidget(order.value!.orderId);

    default:
      return null;
  }
}
