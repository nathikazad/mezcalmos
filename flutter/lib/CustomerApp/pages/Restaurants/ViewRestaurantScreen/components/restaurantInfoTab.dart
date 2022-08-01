import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/widgets/MezServiceOpenHours.dart';
import 'package:mezcalmos/Shared/widgets/ServiceLocationCard.dart';

final DateFormat f = new DateFormat('hh:mma');
dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ViewRestaurantScreen"]["components"]
    ["restaurantInfoTab"];

class RestaurantInfoTab extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantInfoTab({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  /// LanguageType
  static final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    final LanguageType userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (restaurant.description![userLanguage] != null &&
            restaurant.description![userLanguage]!.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  '${_i18n()["description"]} :',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 25),
                child: Text(restaurant.description?[userLanguage] ?? ""),
              ),
            ],
          ),
        if (restaurant.schedule != null)
          MezServiceOpenHours(schedule: restaurant.schedule!),
        SizedBox(
          height: 25,
        ),
        if (restaurant.info.location != null)
          ServiceLocationCard(
            location: restaurant.info.location,
          ),
      ],
    );
  }
}
