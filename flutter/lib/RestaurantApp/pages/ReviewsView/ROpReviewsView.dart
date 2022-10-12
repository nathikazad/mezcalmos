import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/ReviewsView/Components/ROpNoReviews.dart';
import 'package:mezcalmos/RestaurantApp/pages/ReviewsView/Components/ROpReviewCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/ReviewsView/Components/ROpReviewsFilters.dart';
import 'package:mezcalmos/RestaurantApp/pages/ReviewsView/Controllers/ROpReviewsViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpReviewsView"];

//
class ROpReviewsView extends StatefulWidget {
  const ROpReviewsView({super.key});

  @override
  State<ROpReviewsView> createState() => _ROpReviewsViewState();
}

class _ROpReviewsViewState extends State<ROpReviewsView> {
  ROpReviewsViewController viewController = ROpReviewsViewController();
  String? restaurantID;
  @override
  void initState() {
    restaurantID = Get.parameters["restaurantId"];
    if (restaurantID != null) {
      viewController.init(restaurantId: restaurantID!);
    } else {
      Get.back();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: Get.back, title: '${_i18n()["reviews"]}'),
      body: Obx(() {
        if (viewController.restaurant.value != null) {
          if (!viewController.hasReviews) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // top component //
                  _reviewsHeader(),
                  // performance text //
                  _performanceComponent(),
                  const SizedBox(
                    height: 25,
                  ),

                  // reviews chips //
                  ROpReviewsFilters(viewController: viewController),
                  SizedBox(
                    height: 8,
                  ),

                  // reviews list //
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: viewController.reviews.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ROpReviewCard(
                          review: viewController.reviews[index]);
                    },
                  )
                ],
              ),
            );
          } else {
            return NoReviewsComponent();
          }
        } else {
          return Container(
            alignment: Alignment.center,
            child: MezLogoAnimation(
              centered: true,
            ),
          );
        }
      }),
    );
  }

  Container _reviewsHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            viewController.restaurant.value!.rate!.toStringAsFixed(1),
            style: Get.textTheme.bodyText1
                ?.copyWith(fontSize: 25.sp, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 15,
          ),
          RatingBarIndicator(
            rating: viewController.rating.toDouble(),
            itemBuilder: (BuildContext context, int index) => Icon(
              Icons.star_rate_rounded,
              color: primaryBlueColor,
            ),
            itemCount: 5,
            itemSize: 35.0,
            direction: Axis.horizontal,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              "${_i18n()["base"]} ${viewController.reviews.length} ${_i18n()["reviews"].toString().toLowerCase()}")
        ],
      ),
    );
  }

  Container _performanceComponent() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      decoration: BoxDecoration(
          color: secondaryLightBlueColor,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${_i18n()["perfomTitle"]} ",
            style: Get.textTheme.bodyText1,
          ),
          Text(
            " ${_i18n()[viewController.performanceString()]} !",
            style: Get.textTheme.bodyText1?.copyWith(color: primaryBlueColor),
          ),
        ],
      ),
    );
  }
}
