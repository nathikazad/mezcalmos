import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/models/Order.dart';

class Customer {
  List<Order> currentOrders = [];
  String? appVersion;
  Cart? cart;
  dynamic data;
  Customer.fromSnapshot(dynamic data) {
    this.data = data;
    if (data["state"]["currentOrders"] != null) {
      data["state"]["currentOrders"]
          .forEach((dynamic orderId, dynamic orderData) {
        if (orderData["orderType"] ==
            convertOrderTypeEnumToString(OrderType.Restaurant)) {
          this.currentOrders.add(RestaurantOrder.fromData(orderId, orderData));
        }
        // print(Item.itemFromData(itemId, itemData, language).toJson());
      });
    }
    // currentOrders.add(Order(orderTime: DateTime.now()));
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{};
  }
}
