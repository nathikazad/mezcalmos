import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ["CreateServiceView"]["pages"]["createServiceStartPage"];

class CreateServiceStartPage extends StatelessWidget {
  const CreateServiceStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            alignment: Alignment.center,
            height: 30.h,
            width: 70.w,
            child: Image.asset(
              "assets/images/restaurantApp/createRestaurant.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 150),
          child: Text(
            '${_i18n()['openNewRestaurantText']}',
            style: Get.textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
