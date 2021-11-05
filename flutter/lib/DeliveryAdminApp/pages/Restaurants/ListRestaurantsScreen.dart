import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/components/ItemComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';

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
       appBar: MezcalmosSharedWidgets.mezcalmosAppBar("back", () => Get.back(),
            actionIcons: []),
        body: Column(
      children: [
        SizedBox(
          height: Get.height * 0.03,
        ),
        SizedBox(
          height: Get.height * 0.03,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
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
          child: Container(
            child: Obx(() => ListView(
                padding: const EdgeInsets.only(top: 10),
                children: restaurants
                    .map((restaurant) => ItemComponent(
                          imgUrl: restaurant.photo!,
                          title: restaurant.name!,
                          restaurantId: restaurant.id!,
                          withBorder: true,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          onClick: () {
                            Get.toNamed(getRestaurantRoute(restaurant.id!));
                          },
                        ))
                    .toList())),
          ),
        ),
      ],
    ));
  }
}
