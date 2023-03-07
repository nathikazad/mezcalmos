import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/courier_order/hsCourierOrder.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/hsDeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Courier/CourierOrderItem.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class DvOrderDetailsViewController {
  late int orderId;
  Rxn<DeliveryOrder> order = Rxn();
  Rxn<List<CourierOrdeItem>> items = Rxn();
  TextEditingController costText = TextEditingController();

  // methods //
  Future<void> init({required int orderId}) async {
    this.orderId = orderId;
    order.value = await get_driver_order_by_id(orderId: orderId);
    if (order.value != null && order.value!.orderType == OrderType.Courier) {
      unawaited(_fetchOrderItems(orderId));
    }
  }

  Future<void> _fetchOrderItems(int orderId) async {
    items.value =
        await get_courier_order_items(orderId: orderId, withCache: false);
  }

  Future<void> markItemAvailable(
      {required int itemId, required bool isAvailable}) async {
    await update_courier_order_item(itemId: itemId, available: isAvailable);
    await _fetchOrderItems(orderId);
  }

  // void editCost({required int itemId}) {
  //   editableItemsIds.add(itemId);
  //   editableItemsControllers.add(TextEditingController());
  // }

  Future<void> saveCost({required int itemId, required int index}) async {
    await update_courier_order_item(
        itemId: itemId, actualCost: num.tryParse(costText.text));
    await _fetchOrderItems(orderId);
  }

  void closeEdit({required int index}) {
    // editableItemsIds.removeAt(index);
    // editableItemsControllers.removeAt(index);
  }
}
