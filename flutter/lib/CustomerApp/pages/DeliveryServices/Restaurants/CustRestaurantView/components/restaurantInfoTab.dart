import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantView/controllers/CustomerRestaurantController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/CustomerApp/pages/Common/CustReviewsListView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/MezServiceOpenHours.dart';
import 'package:mezcalmos/Shared/widgets/Order/ReviewCard.dart';
import 'package:mezcalmos/Shared/widgets/ServiceLocationCard.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';
import 'package:sizer/sizer.dart';

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

  /// Language
  static final Language userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    mezDbgPrint(
        "Restaurant ==> ${restaurant.info.hasuraId.toString().toString()}  : Rate [${restaurant.rate}] - Reviews List: [${restaurant.reviews.length}]");
    final Language userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _topBarInfo(context),
        if (restaurant.info.description != null &&
            restaurant.info.description!.getTranslation(userLanguage) != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  '${_i18n()["description"]}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Text(restaurant.info.description?.getTranslation(userLanguage) ??
                  ""),
            ],
          ),
        if (restaurant.schedule != null)
          Column(
            children: [
              SizedBox(
                height: 15,
              ),
              MezServiceOpenHours(schedule: restaurant.schedule!),
            ],
          ),
        if (restaurant.info.location != null)
          ServiceLocationCard(
            location: restaurant.info.location,
          ),
        if (restaurant.paymentInfo != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                '${_i18n()["paymentMethod"]}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(
                    Icons.payments,
                    color: offShadeGreyColor,
                    size: 23,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${_i18n()["codText"]}',
                    style: context.txt.bodyLarge
                        ?.copyWith(color: offShadeGreyColor),
                  ),
                ],
              ),
              if (restaurant.paymentInfo?.acceptCard == false)
                Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.payment,
                          color: offShadeGreyColor,
                          size: 23,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${_i18n()["debitCreditText"]}',
                          style: context.txt.bodyLarge
                              ?.copyWith(color: offShadeGreyColor),
                        ),
                      ],
                    ),
                  ],
                )
            ],
          ),
        if (restaurant.showReviews)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    '${_i18n()["reviews"]}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.star,
                    color: primaryBlueColor,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    restaurant.rate!.toStringAsFixed(1),
                    style: context.txt.bodyLarge
                        ?.copyWith(color: primaryBlueColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: Text(
                      "(${restaurant.reviews.length.toString()})",
                      style: context.txt.titleSmall
                          ?.copyWith(color: offLightShadeGreyColor),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    // borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      CustReviewsListView.navigate(
                          serviceId: restaurant.restaurantId,
                          serviceType: ServiceProviderType.Restaurant);
                    },
                    child: Ink(
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '${_i18n()["viewAll"]}',
                        style: context.textTheme.bodyLarge
                            ?.copyWith(color: primaryBlueColor),
                      ),
                    ),
                  )
                ],
              ),
              // SizedBox(
              //   height: 15,
              // ),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: restaurant.reviews.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return ReviewCard(
                      review: restaurant.reviews[index],
                      showUserImage: false,
                    );
                  }),
            ],
          )
      ],
    );
  }

  Widget _topBarInfo(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Row(
              children: [
                Icon(
                  Icons.delivery_dining,
                  size: 3.4.h,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 1.w,
                ),
                Flexible(
                  child: ShippingCostComponent(
                      shippingCost: controller.basShippingPrice.value,
                      alignment: MainAxisAlignment.start,
                      textStyle: context.txt.bodyLarge),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Icon(
                  Icons.payments_outlined,
                  size: 3.4.h,
                  color: Colors.black,
                ),
                if (restaurant.paymentInfo?.acceptCard == true)
                  Row(
                    children: [
                      SizedBox(
                        width: 2.w,
                      ),
                      Icon(
                        Icons.credit_card,
                        size: 3.4.h,
                        color: Colors.black,
                      ),
                    ],
                  ),
                if (restaurant.showReviews)
                  Row(
                    children: [
                      SizedBox(
                        width: 4.w,
                      ),
                      Icon(
                        Icons.star_rate_rounded,
                        color: primaryBlueColor,
                        size: 3.4.h,
                      ),
                      Text(
                        restaurant.rate!.toStringAsFixed(1),
                        style: context.txt.bodyLarge,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          "(${restaurant.reviews.length.toString()})",
                          style: context.txt.bodyLarge
                              ?.copyWith(color: blackColor.withOpacity(0.7)),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          // if (restaurant.showReviews) _reviewsChip(),
        ],
      ),
    );
  }

  Widget _reviewsChip(BuildContext context) {
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
            style: context.txt.bodyLarge?.copyWith(color: Colors.white),
          ),
          const SizedBox(
            width: 3,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Text(
              "(${restaurant.reviews.length.toString()})",
              style: context.txt.bodyMedium?.copyWith(color: Colors.white),
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
