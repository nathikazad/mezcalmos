import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/rootNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

enum ShippingPriceType { Base, Min, PerKm }

class AdminDashboardController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  RxnNum shippingPrice = RxnNum();
  RxnNum minPrice = RxnNum();
  RxnNum perKmPrice = RxnNum();
  StreamSubscription? shippinngPriceStream;
  TextEditingController priceController = TextEditingController();
  TextEditingController minPriceController = TextEditingController();
  TextEditingController perKmPriceController = TextEditingController();

  Future<void> init() async {
    shippingPrice.value = await _getShippingPrice();
    priceController.text = shippingPrice.value.toString();
    mezDbgPrint(shippingPrice.value);
    shippinngPriceStream = _databaseHelper.firebaseDatabase
        .ref()
        .child(metaDataNode())
        .onValue
        .listen((DatabaseEvent event) {
      shippingPrice.value =
          event.snapshot.child("baseShippingPrice").value as num?;
      minPrice.value =
          event.snapshot.child("shippingCost/minPrice").value as num?;
      perKmPrice.value =
          event.snapshot.child("shippingCost/perKm").value as num?;

      priceController.text = shippingPrice.value.toString();
      minPriceController.text = minPrice.value.toString();

      perKmPriceController.text = perKmPrice.value.toString();
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

  Future<void> confirmHandler(
      {required num value, required ShippingPriceType type}) async {
    switch (type) {
      case ShippingPriceType.Base:
        await changePrice(value);
        break;
      case ShippingPriceType.Min:
        await changeMinPrice(value);
        break;
      case ShippingPriceType.PerKm:
        await changePerKmPrice(value);
    }
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

  Future<void> changeMinPrice(num value) async {
    mezDbgPrint("Called Min change ----------");
    await _databaseHelper.firebaseDatabase
        .ref()
        .child(minShippingPriceNode())
        .set(value)
        .onError((Object? error, StackTrace stackTrace) {
      mezDbgPrint(error);
      mezDbgPrint(stackTrace);
      MezSnackbar("Error", "Error");
    }).then((value) => Get.back());
  }

  Future<void> changePerKmPrice(num value) async {
    mezDbgPrint("Called Min change ----------");
    await _databaseHelper.firebaseDatabase
        .ref()
        .child(perKmShippingPriceNode())
        .set(value)
        .onError((Object? error, StackTrace stackTrace) {
      mezDbgPrint(error);
      mezDbgPrint(stackTrace);
      MezSnackbar("Error", "Error");
    }).then((value) => Get.back());
  }

  TextEditingController getTextController(ShippingPriceType shippingPriceType) {
    switch (shippingPriceType) {
      case ShippingPriceType.Base:
        return priceController;
      case ShippingPriceType.Min:
        return minPriceController;
      case ShippingPriceType.PerKm:
        return perKmPriceController;
    }
  }

  // return snapshot.value as num;

}
