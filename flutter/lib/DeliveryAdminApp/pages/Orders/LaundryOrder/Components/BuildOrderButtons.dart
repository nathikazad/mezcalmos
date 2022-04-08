import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryOrder/Components/LaundryOrderButtons.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

// Change status of the order compnent inside the order view screen

List<Widget> buildOrderButtons(
  Rxn<LaundryOrder> order,
) {
  if (order.value!.inProcess()) {
    return <Widget>[
      changeStatusButton(order)!,
      OrderButtons.cancelButtonWidget(
        order.value!.orderId,
      )
    ];
  } else
    return <Widget>[];
}

Widget? changeStatusButton(
  Rxn<LaundryOrder> order,
) {
  switch (order.value!.status) {
    case (LaundryOrderStatus.AtLaundry):
      return Expanded(
        child: OrderButtons.readyForDeliveryButton(order.value!),
      );

    default:
      return const SizedBox();
  }
}
