import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/Restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/models/restaurants/restaurant.dart';
import 'package:mezcalmos/Shared/widgets/GetFutureData.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen.dart';
import 'dart:async';

class ListRestaurantsScreen extends GetView<RestaurantsInfoController> {
  RxList<Restaurant> restaurantListStream = RxList.empty();

  @override
  Widget build(BuildContext context) {
    Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    // restaurantListStream.value =
    controller.getRestaurants().then((value) {
      restaurantListStream.value = value;
    });
    // controller.getRestaurants().listen((data) async {
    //   restaurantListStream.value = data;
    // });
    return Scaffold(
        appBar: AppBar(
          title: Text("Restaurant list"),
        ),
        body: Obx(() => Column(
            children: restaurantListStream.value
                .map((restaurant) => TextButton(
                    onPressed: () =>
                        Get.to(ViewRestaurantScreen(restaurant.id!)),
                    child: Text(restaurant.name!)))
                .toList())));
  }
}
