// Usefull when trying to make Sizes adptable!
import 'package:flutter/foundation.dart';
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

double getSizeRelativeToScreen(
        double v, double screenHeight, double screenWidth) =>
    (screenHeight / screenWidth) * v;

extension Responsive on num {
  double get mezSp {
    final double multiplier = kIsWeb
        ? (SizerUtil.width > 700 ? 700 : SizerUtil.width)
        : SizerUtil.width;
    return this * (multiplier / 3) / 100;
  }

  double get mezW {
    final double width = kIsWeb
        ? (SizerUtil.width > 700 ? 700 : SizerUtil.width)
        : SizerUtil.width;
    return this * width / 100;
  }
}
