import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/Restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/models/restaurants/restaurant.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen.dart';
import 'dart:async';

class ViewRestaurantScreen extends GetView<RestaurantsInfoController> {
  String restaurantId;
  Rxn<Restaurant> restaurant = Rxn();

  ViewRestaurantScreen(this.restaurantId);

  @override
  Widget build(BuildContext context) {
    Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    controller.getRestaurant(restaurantId).then((value) {
      restaurant.value = value;
    });
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text("${restaurant.value?.name ?? 'Loading'}")),
        ),
        body: Obx(() {
          List<Item> items = restaurant.value?.items ?? [];
          return Column(
              children: items
                  .map((item) => TextButton(
                      onPressed: () =>
                          Get.to(ViewItemScreen(restaurantId, item.id!)),
                      child: Text(item.name!)))
                  .toList());
        }));
  }
}
