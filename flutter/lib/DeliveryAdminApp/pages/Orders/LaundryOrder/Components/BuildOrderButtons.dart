import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/Driver.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryOrder/Components/orderButtons.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

// Change status of the order compnent inside the order view screen

List<Widget> buildOrderButtons(Rxn<LaundryOrder> order,Driver? driver) {
  if (order.value?.inProcess() ?? false)
    return [
      Expanded(
        child: changeStatusButton(order,driver)!,
      ),
      OrderButtons.cancelButtonWidget(order.value!.orderId,)
    ];
  else
    return [];
}

Widget? changeStatusButton(Rxn<LaundryOrder> order,Driver? driver) {
  switch (order.value!.status) {
    case (LaundryOrdersStatus.OrderReceieved):
      return OrderButtons.startPickUp(order.value!.orderId,driver);
    case (LaundryOrdersStatus.OtwPickup):
      return OrderButtons.pickedUp(order.value!.orderId);
    case (LaundryOrdersStatus.PickedUp):
      return OrderButtons.atTheLaundry(order.value!.orderId);
    case (LaundryOrdersStatus.AtLaundry):
      return OrderButtons.readyForDeliveryButton(order.value!.orderId);
    case (LaundryOrdersStatus.ReadyForDelivery):
      return OrderButtons.otwDeliveryButton(order.value!.orderId);
    case (LaundryOrdersStatus.OtwDelivery):
      return OrderButtons.deliverdButton(order.value!.orderId);

    default:
      return null;
  }
}
