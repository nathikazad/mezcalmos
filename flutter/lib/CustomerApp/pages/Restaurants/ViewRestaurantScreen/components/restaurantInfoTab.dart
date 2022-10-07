import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/ReviewCard.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
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
    mezDbgPrint(
        "Restaurant ==> ${restaurant.info.id}  : Rate [${restaurant.rate}] - Reviews List: [${restaurant.reviews.length}]");
    final LanguageType userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (restaurant.showReviews) _reviewsChip(),
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
        if (restaurant.showReviews)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    "Reviews",
                    style: Get.textTheme.bodyText1,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.star_border_outlined,
                    color: primaryBlueColor,
                  ),
                  Text(
                    restaurant.rate!.toStringAsFixed(1),
                    style: Get.textTheme.bodyText1
                        ?.copyWith(color: primaryBlueColor),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    "(${restaurant.reviews.length.toString()})",
                    style: Get.textTheme.bodyText2,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: restaurant.reviews.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return ReviewCard(
                      review: restaurant.reviews[index],
                    );
                  })
              // SliverList(
              //     delegate: SliverChildListDelegate(
              //   List.generate(restaurant.reviews.length, (int index) {
              //     return ReviewCard(
              //       review: restaurant.reviews[index],
              //     );
              //   }),
              // )),
              // Column(
              //   children: List.generate(restaurant.reviews.length, (int index) {
              //     return ReviewCard(
              //       review: restaurant.reviews[index],
              //     );
              //   }),
              // )
            ],
          )
      ],
    );
  }

  Align _reviewsChip() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        decoration: BoxDecoration(
          color: primaryBlueColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.star_rate_rounded,
              color: Colors.white,
            ),
            Text(
              restaurant.rate!.toStringAsFixed(1),
              style: Get.textTheme.bodyText1?.copyWith(color: Colors.white),
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              "(${restaurant.reviews.length.toString()})",
              style: Get.textTheme.bodyText2?.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
