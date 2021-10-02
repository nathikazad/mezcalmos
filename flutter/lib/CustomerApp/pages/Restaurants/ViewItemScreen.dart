import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/Restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/models/restaurants/restaurant.dart';
import 'dart:async';

class ViewItemScreen extends GetView<RestaurantsInfoController> {
  String restaurantId;
  String itemtId;
  Rxn<Item> item = Rxn();

  ViewItemScreen(this.restaurantId, this.itemtId) {
    Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    controller.getItem(restaurantId, itemtId).then((value) {
      item.value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text("${item.value?.name ?? 'Loading'}")),
        ),
        body: Obx(() => Text(item.value?.name ?? "Loading")));
  }
}
