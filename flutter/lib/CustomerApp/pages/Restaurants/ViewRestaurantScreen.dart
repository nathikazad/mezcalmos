import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/models/Restaurant.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen.dart';
import 'dart:async';

class ViewRestaurantScreen extends GetView<RestaurantsInfoController> {
  String restaurantId;
  Rxn<Restaurant> restaurant = Rxn();

  ViewRestaurantScreen(this.restaurantId) {
    RestaurantsInfoController controller =
        Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    controller.getRestaurant(restaurantId).then((value) {
      restaurant.value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text("${restaurant.value?.name ?? 'Loading'}")),
          actions: [
            TextButton(
                onPressed: () => Get.to(ViewCartScreen()), child: Text("Cart"))
          ],
        ),
        body: Obx(() {
          List<Item> items = restaurant.value?.items ?? [];
          return Column(
              children: items
                  .map((item) => TextButton(
                      onPressed: () =>
                          Get.to(
                          ViewItemScreen.forNewItem(restaurantId, item.id!)),
                      child: Text(item.name!)))
                  .toList());
        }));
  }
}

class ListRestaurantsScreen extends GetView<RestaurantsInfoController> {
  RxList<Restaurant> restaurants = <Restaurant>[].obs;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Restaurant list"),
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
