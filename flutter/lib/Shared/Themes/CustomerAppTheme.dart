import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerAppTheme {
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Color(0XFFEDEDED),
      dividerColor: Colors.grey.withOpacity(0.8),
      brightness: Brightness.light,
      primaryColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.grey[850]),
      cardTheme: CardTheme(
          elevation: 0.5,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontFamily: "psr",
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: Colors.black),
        headline2: TextStyle(
            fontFamily: "psr",
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: Colors.black),
        headline3: TextStyle(
          fontFamily: "psr",
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          color: Colors.black,
        ),
        bodyText1: TextStyle(
            fontFamily: "psr",
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: Colors.black),
        bodyText2: TextStyle(
            fontFamily: "psr",
            fontWeight: FontWeight.w400,
            fontSize: 13.sp,
            color: Colors.black),
        subtitle1: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "psr",
            fontSize: 11.sp,
            color: Colors.black.withOpacity(0.8)),
      ),
      colorScheme: ColorScheme.light().copyWith(secondary: Colors.grey[850]));
}
