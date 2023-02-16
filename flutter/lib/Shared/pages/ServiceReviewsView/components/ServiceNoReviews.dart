import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpReviewsView"];

//
class ServiceNoReviewsComponent extends StatelessWidget {
  const ServiceNoReviewsComponent();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 25.h, horizontal: 12),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            radius: 40,
            child: Icon(
              Icons.star_half_rounded,
              color: Colors.grey.shade600,
              size: 35,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '${_i18n()["noRevTitle"]}',
            style: Get.textTheme.bodyText1,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '${_i18n()["noRevDesc"]}',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
