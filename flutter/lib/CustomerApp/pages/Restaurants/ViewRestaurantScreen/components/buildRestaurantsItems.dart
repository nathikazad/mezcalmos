import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/RestaurantListItemComponent.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class RestaurantCategoriesList extends StatelessWidget {
  RestaurantCategoriesList({Key? key, required this.restaurant})
      : super(key: key);
  final Restaurant restaurant;
  LanguageType userLanguage = Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
          children: List.generate(
              restaurant.getCategories.length,
              (int index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.getCategories[index].name?[userLanguage] ??
                            "",
                        style: Get.theme.textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      if (restaurant
                              .getCategories[index].dialog?[userLanguage] !=
                          null)
                        Text(restaurant
                            .getCategories[index].dialog![userLanguage]!),
                      SizedBox(
                        height: 5,
                      ),
                      _buildResturantItems(
                          restaurant.getCategories[index].items,
                          restaurant.info.id),
                      if (index != restaurant.getCategories.length - 1)
                        Divider(),
                    ],
                  ))),
    );
  }
}

Widget _buildResturantItems(List<Item> items, String restaurantId) {
  return Column(
    children: items.fold<List<Widget>>(<Widget>[],
        (List<Widget> children, Item item) {
      children.add(RestaurantsListItemsOfComponent(
          item: item,
          function: () {
            Get.toNamed(
              getItemRoute(restaurantId, item.id),
              arguments: {"mode": ViewItemScreenMode.AddItemMode},
            );
          }));
      children.add(SizedBox(
        height: 8,
      ));
      return children;
    }),
  );
}
