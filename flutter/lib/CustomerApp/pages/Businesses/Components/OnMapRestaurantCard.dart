import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantView/CustomerRestaurantView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantsListView/components/RestaurantCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['components']['OnMapRestaurantCard'];

class OnMapRestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final EdgeInsetsGeometry margin;
  const OnMapRestaurantCard(
      {super.key,
      required this.restaurant,
      this.margin = const EdgeInsets.only(bottom: 75, left: 20, right: 20)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: RestaurantCard(
          onClick: () => CustomerRestaurantView.navigate(
                restaurantId: restaurant.info.hasuraId,
              ),
          restaurant: restaurant,
          customerLocation: null),
    );
  }
}
