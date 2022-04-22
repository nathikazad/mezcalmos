import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/RestaurantLocationCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/workinHoursCart.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

final DateFormat f = new DateFormat('hh:mma');
dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ViewRestaurantScreen"]["components"]
    ["restaurantInfoTab"];

class RestaurantInfoTab extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantInfoTab({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LanguageType userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                '${_i18n()["description"]} :',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 15),
              child: Text(restaurant.description?[userLanguage] ?? ""),
            ),
            (restaurant.schedule != null)
                ? getWorkingHoursWidget(restaurant.schedule, context)
                : Container(),
            SizedBox(
              height: 15,
            ),
            RestaurantLocationCard(restaurant: restaurant),
          ],
        ),
      ),
    );
  }

  Widget getWorkingHoursWidget(Schedule? schedule, BuildContext context) {
    final DateTime xDate = DateTime.now();
    final List<Widget> widgets = [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          "${_i18n()["workingHours"]}",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      SizedBox(
        height: 10,
      )
    ];
    final int pos = 0;
    for (int i = 0; i < schedule!.openHours.length; i++) {
      schedule.openHours.forEach((Weekday key, OpenHours value) {
        if (key.index == i) {
          widgets.add(WorkingHoursCart(
            day: "${_i18n()["weekDays"]["${key.toFirebaseFormatString()}"]}",
            isOpen: value.isOpen,
            openHour:
                "${f.format(DateTime(xDate.year, xDate.month, xDate.day, value.from[0], value.from[1]))}",
            closeHour:
                "${f.format(DateTime(xDate.year, xDate.month, xDate.day, value.to[0], value.to[1]))}",
          ));
        }
      });
    }
    return Column(
      children: widgets,
    );
  }
}
