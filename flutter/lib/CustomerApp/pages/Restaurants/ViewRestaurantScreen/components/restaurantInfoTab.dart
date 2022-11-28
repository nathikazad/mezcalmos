import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/Controllers/CustomerRestaurantController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/ReviewCard.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/MezServiceOpenHours.dart';
import 'package:mezcalmos/Shared/widgets/ServiceLocationCard.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';

final DateFormat f = new DateFormat('hh:mma');
dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ViewRestaurantScreen"]["components"]
    ["restaurantInfoTab"];

class RestaurantInfoTab extends StatelessWidget {
  final Restaurant restaurant;
  final CustomerRestaurantController controller;

  const RestaurantInfoTab({
    Key? key,
    required this.restaurant,
    required this.controller,
  }) : super(key: key);

  /// LanguageType
  static final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    mezDbgPrint(
        "Restaurant ==> ${restaurant.info.firebaseId}  : Rate [${restaurant.rate}] - Reviews List: [${restaurant.reviews.length}]");
    final LanguageType userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _topBarInfo(),
        if (restaurant.description![userLanguage] != null &&
            restaurant.description![userLanguage]!.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  '${_i18n()["description"]}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: Text(restaurant.description?[userLanguage] ?? ""),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        if (restaurant.schedule != null)
          MezServiceOpenHours(schedule: restaurant.schedule!),
        SizedBox(
          height: 20,
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
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    '${_i18n()["reviews"]}',
                    style: Get.textTheme.bodyText1,
                  ),
                  Spacer(),
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
                  Container(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: Text(
                      "(${restaurant.reviews.length.toString()})",
                      style: Get.textTheme.bodyText2,
                    ),
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
            ],
          )
      ],
    );
  }

  Widget _topBarInfo() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Row(
              children: [
                Text(
                  _getDollarsSign(),
                  style: Get.textTheme.bodyText1?.copyWith(
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.delivery_dining,
                  color: Colors.grey.shade800,
                ),
                Flexible(
                  child: ShippingCostComponent(
                    shippingCost: controller.basShippingPrice.value,
                    alignment: MainAxisAlignment.start,
                    textStyle: Get.textTheme.bodyText1?.copyWith(
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.payments_sharp,
                  color: Colors.grey.shade800,
                ),
                if (restaurant.paymentInfo?.acceptCard == true)
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Icon(
                        Icons.credit_card,
                        color: Colors.grey.shade800,
                      )),
              ],
            ),
          ),
          if (restaurant.showReviews) _reviewsChip(),
        ],
      ),
    );
  }

  Widget _reviewsChip() {
    return Container(
      decoration: BoxDecoration(
        color: primaryBlueColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Text(
              "(${restaurant.reviews.length.toString()})",
              style: Get.textTheme.bodyText2?.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  String _getDollarsSign() {
    if (restaurant.getAverageCost() <= 80) {
      return "\$";
    }
    if (restaurant.getAverageCost() > 80 &&
        restaurant.getAverageCost() <= 140) {
      return "\$\$";
    }
    if (restaurant.getAverageCost() > 140) {
      return "\$\$\$";
    } else {
      return "";
    }
  }
}
