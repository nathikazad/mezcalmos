import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

Widget reCreateOrderBtn(TaxiRequest taxiRequest) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    child: GestureDetector(
      onTap: () {
        popEverythingAndNavigateTo(kTaxiRequestRoute, args: taxiRequest);
      },
      child: Container(
        height: getSizeRelativeToScreen(16, Get.height, Get.width),
        width: getSizeRelativeToScreen(16, Get.height, Get.width),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade400,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Icon(
            Icons.replay_circle_filled_sharp,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    ),
  );
}
