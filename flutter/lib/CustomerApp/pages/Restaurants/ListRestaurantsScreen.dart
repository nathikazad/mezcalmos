import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/models/Restaurant.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen.dart';
import 'package:mezcalmos/Shared/widgets/GetFutureData.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen.dart';
import 'dart:async';

class ListRestaurantsScreen extends GetView<RestaurantsInfoController> {
  RxList<Restaurant> restaurants = <Restaurant>[].obs;
  ListRestaurantsScreen() {
    RestaurantsInfoController controller =
        Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    controller.getRestaurants().then((value) {
      restaurants.value = value as List<Restaurant>;
    });
    // controller.getCurrentOrder().listen((data) {
    //   order = data;
    // });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Restaurant list"),
          actions: [
            TextButton(
                onPressed: () => Get.to(ViewCartScreen()), child: Text("Cart"))
          ],
        ),
        body: Obx(() => Column(
        children: restaurants
                .map((restaurant) => TextButton(
                    onPressed: () =>
                        Get.to(ViewRestaurantScreen(restaurant.id!)),
                    child: Text(restaurant.name!)))
                .toList())));
  }
}
