import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ["CreateServiceView"]["pages"]["createServiceStartPage"];

class CreateServiceStartPage extends StatelessWidget {
  const CreateServiceStartPage({super.key, required this.viewController});
  final CreateServiceViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              //  height: 30.h,
              width: 70.w,
              child: Image.asset(
                "assets/images/restaurantApp/createRestaurant.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: Text(
              '${_i18n()['openNewRestaurantText']}',
              style: Get.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          MezButton(
              label: "Create service",
              onClick: () async {
                unawaited(viewController.handleNext());
              }),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
