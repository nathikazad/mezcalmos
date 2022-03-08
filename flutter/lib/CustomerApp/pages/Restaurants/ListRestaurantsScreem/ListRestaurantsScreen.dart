import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

import '../../../router.dart';
import 'components/RestaurandCard.dart';

class ListRestaurantsScreen extends StatefulWidget {
  @override
  _ListRestaurantsScreenState createState() => _ListRestaurantsScreenState();
}

class _ListRestaurantsScreenState extends State<ListRestaurantsScreen> {
  LanguageController lang = Get.find<LanguageController>();

  List<Restaurant> restaurants = <Restaurant>[];
  RestaurantsInfoController _restaurantsInfoController =
      Get.put<RestaurantsInfoController>(RestaurantsInfoController());
  _ListRestaurantsScreenState() {}
  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppBar(
        title: "${lang.strings['customer']['restaurant']['restaurants']}",
        autoBack: true,
      ),
      body: FutureBuilder<List<Restaurant>>(
        future: _restaurantsInfoController.getRestaurants(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              {
                getAndSortRestaurants(snapshot.data);
                return buildRestaurant(context);
              }
            default:
              return Container(
                alignment: Alignment.center,
                child: Text('Error'),
              );
          }
        },
      ),
    );
  }

  Widget buildRestaurant(BuildContext context) {
    return Container(
      child: restaurants.length > 0
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: List.generate(
                      restaurants.length,
                      (index) => RestaurantCard(
                            restaurant: restaurants[index],
                            onClick: () {
                              Get.toNamed(
                                  getRestaurantRoute(
                                      restaurants[index].info.id),
                                  arguments: restaurants[index]);
                            },
                          )),
                ),
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
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  void getAndSortRestaurants(List<Restaurant>? data) {
    restaurants = data!
        .where((resto) => resto.state.available == true)
        .toList(growable: true);
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
  }
}
