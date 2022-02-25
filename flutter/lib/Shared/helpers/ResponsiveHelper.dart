// Usefull when trying to make Sizes adptable!
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Widget emptyOrWidgetSmallPhones({Widget? empty, required Widget child}) {
  if (Get.width > 320) {
    return child;
  } else {
    return empty == null
        ? SizedBox(
            height: 0,
            width: 0,
          )
        : empty;
  }
}

void responsiveSize(BuildContext context) {
  ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(375, 667),
      orientation: Orientation.portrait);
}

double getSizeRelativeToScreen(
        double v, double screenHeight, double screenWidth) =>
    (screenHeight / screenWidth) * v;
