import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/components/ItemComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/models/restaurant.dart';

import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen.dart';

class ListRestaurantsScreen extends GetView<RestaurantsInfoController> {
  RxList<Restaurant> restaurants = <Restaurant>[].obs;

  ListRestaurantsScreen() {
    RestaurantsInfoController controller =
        Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    controller.getRestaurants().then((value) {
      restaurants.value = value as List<Restaurant>;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Restaurant list"),
        //   actions: [
        //     TextButton(
        //         onPressed: () => Get.to(ViewCartScreen()), child: Text("Cart"))
        //   ],
        // ),
        body: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          width: Get.width,
          child: Text("Restaurants",
              style: GoogleFonts.sourceSansPro(
                textStyle: TextStyle(
                    color: const Color(0xfd1d1d1d),
                    fontWeight: FontWeight.w500,
                    fontFamily: "ProductSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 40.0),
              ),
              textAlign: TextAlign.left),
        ),
        Expanded(
          child: Obx(() => ListView(
              children: restaurants
                  .map((restaurant) => TextButton(
                      onPressed: () =>
                          Get.to(ViewRestaurantScreen(restaurant.id!)),
                      child: ItemComponent(
                        imgUrl: restaurant.photo!,
                        title: restaurant.name!,
                        restaurantId: restaurant.id!,
                        withBorder: true,
                      )))
                  .toList())),
        ),
      ],
    ));
  }
}
