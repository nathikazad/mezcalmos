import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/appbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreem/components/RestaurandCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreem/components/searchField.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/utilities/ResponsiveUtilities.dart';

class ListRestaurantsScreen extends StatefulWidget {
  @override
  _ListRestaurantsScreenState createState() => _ListRestaurantsScreenState();
}

class _ListRestaurantsScreenState extends State<ListRestaurantsScreen> {
  LanguageController lang = Get.find<LanguageController>();

  List<Restaurant> restaurants = <Restaurant>[];
  RestaurantsInfoController _restaurantsInfoController =
      Get.put<RestaurantsInfoController>(RestaurantsInfoController());
  _ListRestaurantsScreenState() {
    _restaurantsInfoController.getRestaurants().then((value) {
      setState(() {
        restaurants = value;
      });
    });
  }
  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    responsiveSize(context);
    return Scaffold(
        appBar: CustomerAppBar(
          title: "${lang.strings['customer']['restaurant']['restaurants']}",
          autoBack: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              SearchField(),
              Column(
                children: List.generate(
                    restaurants.length,
                    (index) => RestaurantCard(
                          restaurant: restaurants[index],
                          onClick: () {
                            Get.toNamed(
                                getRestaurantRoute(restaurants[index].id),
                                arguments: restaurants[index]);
                          },
                        )),
              ),
            ]),
          ),
        ));
  }
}
