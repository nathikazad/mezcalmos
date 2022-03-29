import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreem/components/RestaurantFutureBody.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ListRestaurantsScreen"]["ListRestaurantScreen"];

class ListRestaurantsScreen extends StatefulWidget {
  const ListRestaurantsScreen({Key? key}) : super(key: key);

  @override
  _ListRestaurantsScreenState createState() => _ListRestaurantsScreenState();
}

class _ListRestaurantsScreenState extends State<ListRestaurantsScreen> {
  /// List<Restaurant>
  List<Restaurant> restaurants = <Restaurant>[];

  /// RestaurantsInfoController
  RestaurantsInfoController _restaurantsInfoController =
      Get.put<RestaurantsInfoController>(RestaurantsInfoController());

  _ListRestaurantsScreenState() {}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppBar(
        title: "${_i18n()['restaurants']}",
        autoBack: true,
      ),
      body: FutureBuilder<List<Restaurant>>(
        future: _restaurantsInfoController.getRestaurants(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Restaurant>> snapshot,
        ) {
          return RestaurantFutureBody(snapshot: snapshot);
        },
      ),
    );
  }

  void getAndSortRestaurants(List<Restaurant>? data) {
    restaurants = data!
        .where((Restaurant restaurant) => restaurant.state.available == true)
        .toList(growable: true);
    restaurants.sort(
      (Restaurant a, Restaurant b) {
        if (b.schedule != null) {
          if (b.schedule!.isOpen() == true) {
            return 0;
          } else
            return -1;
        } else {
          return 1;
        }
      },
    );
  }
}
