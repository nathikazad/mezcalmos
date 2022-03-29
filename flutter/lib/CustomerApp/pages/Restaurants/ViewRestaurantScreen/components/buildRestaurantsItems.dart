import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/ViewItemScreen.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

import '../../../../router.dart';
import 'RestaurantListItemComponent.dart';

Widget buildResturantItems(List<Item> items, String restaurantId) {
  return Column(
    children: items.fold<List<Widget>>(
      <Widget>[],
      (List<Widget> children, Item item) {
        children.add(
          RestaurantsListItemsOfComponent(
            item: item,
            function: () {
              Get.toNamed<void>(
                getItemRoute(restaurantId, item.id),
                arguments: <String, dynamic>{
                  "mode": ViewItemScreenMode.AddItemMode,
                },
              );
            },
          ),
        );
        children.add(const SizedBox(height: 1));
        return children;
      },
    ),
  );
}
