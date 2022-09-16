import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/rootNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class AdminDashboardController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  RxnNum shippingPrice = RxnNum();
  StreamSubscription? shippinngPriceStream;
  TextEditingController priceController = TextEditingController();

  Future<void> init() async {
    shippingPrice.value = await _getShippingPrice();
    priceController.text = shippingPrice.value.toString();
    mezDbgPrint(shippingPrice.value);
    shippinngPriceStream = _databaseHelper.firebaseDatabase
        .ref()
        .child(baseShippingPriceNode())
        .onValue
        .listen((DatabaseEvent event) {
      mezDbgPrint(event.snapshot.value);
      shippingPrice.value = event.snapshot.value as num?;
      priceController.text = shippingPrice.value.toString();
    });
  }

  Future<num> _getShippingPrice() async {
    final DataSnapshot snapshot = (await _databaseHelper.firebaseDatabase
            .ref()
            .child(baseShippingPriceNode())
            .once())
        .snapshot;
    return snapshot.value as num;
  }

  Future<void> changePrice(num value) async {
    await _databaseHelper.firebaseDatabase
        .ref()
        .child(baseShippingPriceNode())
        .set(value)
        .onError((Object? error, StackTrace stackTrace) {
      MezSnackbar("Error", "Error");
    }).then((value) => Get.back());
  }

  // return snapshot.value as num;

}
