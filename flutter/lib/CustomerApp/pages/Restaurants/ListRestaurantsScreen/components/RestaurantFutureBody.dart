import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/components/RestaurandCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/components/RestaurantShimmerList.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class RestaurantFutureBody extends StatelessWidget {
  const RestaurantFutureBody({
    Key? key,
    required this.snapshot,
    this.i18n,
  }) : super(key: key);

  final AsyncSnapshot<List<Restaurant>> snapshot;

  final dynamic i18n;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 800),
      switchOutCurve: Curves.fastOutSlowIn,
      child: _switchWidget(),
    );
  }

  Widget _switchWidget() {
    switch (snapshot.connectionState) {
      case ConnectionState.waiting:
        return const RestaurantShimmerList();
      case ConnectionState.done:
        return RestaurantBodyDone(
          key: UniqueKey(),
          restaurants: snapshot.data!,
        );
      default:
        return Container(
          key: UniqueKey(),
          alignment: Alignment.center,
          child: Text('Error'),
        );
    }
  }
}

class RestaurantBodyDone extends StatefulWidget {
  RestaurantBodyDone({
    Key? key,
    required this.restaurants,
  }) : super(key: key);

  List<Restaurant> restaurants;

  @override
  State<RestaurantBodyDone> createState() => RestaurantBodyDoneState();
}

class RestaurantBodyDoneState extends State<RestaurantBodyDone> {
  dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
          ["pages"]["Restaurants"]["ListRestaurantsScreen"]
      ["ListRestaurantScreen"]["emptRestaurantList"];
  @override
  Widget build(BuildContext context) {
    return widget.restaurants.isNotEmpty
        ? SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: List.generate(
                    widget.restaurants.length,
                    (int index) => RestaurantCard(
                      restaurant: widget.restaurants[index],
                      onClick: () {
                        Get.toNamed<void>(
                          getRestaurantRoute(widget.restaurants[index].info.id),
                          arguments: widget.restaurants[index],
                        );
                      },
                    ),
                  ).toList(),
                ),
              ],
            ),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 300,
                  width: 380,
                  child: Image.asset(aComingSoon),
                ),
                Text(
                  "${_i18n()}",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(),
                )
              ],
            ),
          );
  }
}
