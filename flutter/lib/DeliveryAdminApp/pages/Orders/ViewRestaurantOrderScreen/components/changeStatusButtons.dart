import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/buttonStyles.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

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

    case RestaurantOrderStatus.ReadyForPickup:
      return ButtonsStyle.readyForPickupButtonWidget(order.value!.orderId);
    case RestaurantOrderStatus.OnTheWay:
      return ButtonsStyle.onTheWayButtonWidget(order.value!.orderId);

    default:
      return null;
  }
}
