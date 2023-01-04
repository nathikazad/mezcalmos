import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/ButtonStyles.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

List<Widget> buildRestOrderButtons(
  Rxn<RestaurantOrder> order,
) {
  if (order.value!.inProcess()) {
    return <Widget>[
      changeStatusButton(order)!,
      SizedBox(
        height: 8,
      ),
      ButtonsStyle.cancelButtonWidget(order.value!.orderId)
    ];
  } else
    return <Widget>[];
}

// Change status of the order compnent inside the order view screen

Widget? changeStatusButton(Rxn<RestaurantOrder> order) {
  switch (order.value!.status) {
    case RestaurantOrderStatus.OrderReceived:
      return ButtonsStyle.OrderReceivedButtonWidget(order.value!.orderId);

    case RestaurantOrderStatus.PreparingOrder:
      return ButtonsStyle.preparingOrderButtonWidget(order.value!);

    default:
      return const SizedBox();
  }
}
