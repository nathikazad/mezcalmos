import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/models/Restaurant.dart';
import 'package:mezcalmos/CustomerApp/router.dart';

class ListRestaurantsScreen extends GetView<RestaurantsInfoController> {
  RxList<Restaurant> restaurants = <Restaurant>[].obs;

  ListRestaurantsScreen() {
    RestaurantsInfoController controller =
        Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    controller.getRestaurants().then((value) {
      restaurants.value = value;
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Restaurant list"),
          actions: [
            TextButton(
                onPressed: () => Get.toNamed(kCartRoute), child: Text("Cart"))
          ],
        ),
        body: _getBody());
  }

  Widget _getBody() {
    return Obx(() => Column(
        children: restaurants
            .map((restaurant) => TextButton(
                onPressed: () =>
                    Get.toNamed(getRestaurantRoute(restaurant.id!)), 
                child: Text(restaurant.name!)))
            .toList()));
  }
}
