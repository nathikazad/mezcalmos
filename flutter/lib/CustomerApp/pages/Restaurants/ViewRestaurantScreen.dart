import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/models/Restaurant.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen.dart';

import 'package:mezcalmos/CustomerApp/router.dart';

class ViewRestaurantScreen extends GetView<RestaurantsInfoController> {
  late String restaurantId;
  Rxn<Restaurant> restaurant = Rxn();

  ViewRestaurantScreen() {
    this.restaurantId = Get.parameters['restaurantId']!;
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
                onPressed: () => Get.toNamed(kCartRoute), child: Text("Cart"))
          ],
        ),
        body: Obx(() {
          List<Item> items = restaurant.value?.items ?? [];
          return Column(
              children: items
                  .map((item) => TextButton(
                      onPressed: () => Get.toNamed(
                          getItemRoute(restaurantId, item.id!),
                          arguments: {"mode": ViewItemScreenMode.AddItemMode}),
                      child: Text(item.name!)))
                  .toList());
        }));
  }
}
