// Usefull when trying to make Sizes adptable!
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

double getSizeRelativeToScreen(
        double v, double screenHeight, double screenWidth) =>
    (screenHeight / screenWidth) * v;
