/*
* Created By Mirai Devs.
* On 3/26/2022.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

import 'RestaurandCard.dart';
import 'RestaurandShimmerList.dart';

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
        return _RestaurantBodyDone(
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

class _RestaurantBodyDone extends StatelessWidget {
  const _RestaurantBodyDone({
    Key? key,
    required this.restaurants,
    this.i18n,
  }) : super(key: key);

  final List<Restaurant> restaurants;
  final dynamic i18n;

  @override
  Widget build(BuildContext context) {
    return restaurants.length > 0
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  restaurants.length,
                  (int index) => RestaurantCard(
                    restaurant: restaurants[index],
                    onClick: () {
                      Get.toNamed<void>(
                        getRestaurantRoute(restaurants[index].info.id),
                        arguments: restaurants[index],
                      );
                    },
                  ),
                ).toList(),
              ),
            ),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 300,
                    width: 380,
                    child: Image.asset(aComingSoon),
                  ),
                ),
                Expanded(
                  child: Text(
                    i18n['emptRestaurantList'],
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(),
                  ),
                )
              ],
            ),
          );
  }
}
