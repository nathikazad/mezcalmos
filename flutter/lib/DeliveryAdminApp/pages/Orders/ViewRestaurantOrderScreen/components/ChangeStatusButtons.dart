import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/ButtonStyles.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

List<Widget> buildRestOrderButtons(
  Rxn<RestaurantOrder> order,
) {
  if (order.value!.inProcess()) {
    return [
      changeStatusButton(order)!,
      ButtonsStyle.cancelButtonWidget(order.value!.orderId)
    ];
  } else
    return [];
}

// Change status of the order compnent inside the order view screen

List<Widget> changebuttonsDepandesOnStatus(Rxn<RestaurantOrder> order) {
  if (order.value?.inProcess() ?? false)
    return [
      Expanded(
        child: changeStatusButton(order)!,
      ),
      ButtonsStyle.cancelButtonWidget(order.value!.orderId)
    ];
  else
    return [];
}

Widget? changeStatusButton(Rxn<RestaurantOrder> order) {
  switch (order.value!.status) {
    case RestaurantOrderStatus.OrderReceieved:
      return ButtonsStyle.orderReceievedButtonWidget(order.value!.orderId);

    case RestaurantOrderStatus.PreparingOrder:
      return ButtonsStyle.preparingOrderButtonWidget(order.value!.orderId);

    default:
      return SizedBox();
  }
}
