import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/models/Order.dart';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:firebase_database/firebase_database.dart';

class Customer {
  List<Order> currentOrders = [];
  String? appVersion;
  Cart? cart;
  Customer.fromSnapshot(DataSnapshot data) {
    print("from customer from snapshot");
    print(data.value);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{};
  }
}
