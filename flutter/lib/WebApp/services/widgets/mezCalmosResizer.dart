import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

abstract class MezCalmosResizer {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650 &&
      MediaQuery.of(context).size.width >= 350;

  static bool isSmallMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 350;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 900 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 900;

  static double getWepPageHorizontalPadding(context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 100;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 50;
    } else if (MezCalmosResizer.isSmallMobile(context)) {
      return 10;
    } else {
      return 11.sp;
    }
  }
}
