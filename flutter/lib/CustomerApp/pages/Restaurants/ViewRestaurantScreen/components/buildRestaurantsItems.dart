import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'RestaurantListItemComponent.dart';

import '../../../../router.dart';

Widget buildResturantItems(List<Item> items, String restaurantId) {
  return Column(
    children: items.fold<List<Widget>>(<Widget>[], (children, item) {
      children.add(RestaurantsListItemsOfComponent(
          item: item,
          function: () {
            Get.toNamed(
              getItemRoute(restaurantId, item.id!),
              arguments: {"mode": ViewItemScreenMode.AddItemMode},
            );
          }));
      children.add(SizedBox(
        height: 20,
      ));
      return children;
    }),
  );
}
