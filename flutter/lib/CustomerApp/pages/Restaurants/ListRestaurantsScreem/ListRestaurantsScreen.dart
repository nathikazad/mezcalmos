import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/appbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreem/components/RestaurandCard.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';

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
    restaurants.sort((a, b) {
      if (b.schedule != null) {
        if (b.schedule!.isOpen() == true) {
          return 0;
        } else
          return -1;
      } else {
        return 1;
      }
    });

    responsiveSize(context);
    return Scaffold(
        appBar: CustomerAppBar(
          title: "${lang.strings['customer']['restaurant']['restaurants']}",
          autoBack: true,
        ),
        body: restaurants.length > 0
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(mainAxisSize: MainAxisSize.max, children: [
                    // SearchField(),
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
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: Container(
                            height: 300,
                            width: 380,
                            child: Image.asset(aComingSoon))),
                    Expanded(
                      child: Text(
                        lang.strings['customer']['restaurant']
                            ['emptRestaurantList'],
                        style:
                            Theme.of(context).textTheme.bodyText1!.copyWith(),
                      ),
                    )
                  ],
                ),
              ));
  }
}
