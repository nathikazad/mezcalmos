import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:sizer/sizer.dart';

class TaxiAppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      //---------------------------------------------------- COLORS ------------------------------------------------------------------------//
      //---------------------------------------------------- COLORS ------------------------------------------------------------------------//
      primaryColor: Colors.white,

      primaryColorLight: Color(0xFFAC59FC),

      indicatorColor: Color(0xFFAC59FC),
      brightness: Brightness.light,

      dividerColor: Colors.grey.withOpacity(0.8),
      colorScheme: ColorScheme.light().copyWith(secondary: Colors.grey[850]),

      //---------------------------------------------------- WIGGETS ------------------------------------------------------------------------//
      //---------------------------------------------------- WIGGETS ------------------------------------------------------------------------//
      scaffoldBackgroundColor: Color(0XFFEDEDED),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              color: Colors.black),
          elevation: 0.2,
          centerTitle: true,
          titleSpacing: 16,
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFFAC59FC), elevation: 1.0),
      bottomAppBarTheme:
          BottomAppBarTheme(color: Color(0xFFAC59FC), elevation: 1.0),

      buttonTheme:
          ButtonThemeData(shape: CircleBorder(), padding: EdgeInsets.all(8)),
      dialogTheme: DialogTheme(
          titleTextStyle: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              color: Colors.black),
          contentTextStyle: TextStyle(
              fontFamily: "Nunito",
              fontWeight: FontWeight.w600,
              fontSize: 13.sp,
              color: Colors.black),
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        primary: Colors.white,
        backgroundColor: Color(0xFFAC59FC),
        padding: EdgeInsets.all(2),
        textStyle: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          color: Colors.white,
        ),
      )),
      iconTheme: IconThemeData(color: Colors.grey[850]),
      cardTheme: CardTheme(
          elevation: 0.5,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.grey.shade300,
        showCheckmark: false,
        disabledColor: Colors.grey,
        selectedColor: Colors.white,
        padding: EdgeInsets.all(12),
        labelStyle: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
            color: Colors.black),
        brightness: Brightness.light,
        secondarySelectedColor: Color(0xFFAC59FC),
        secondaryLabelStyle: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: Colors.white),
      ),

      //---------------------------------------------------- TYPOGRAPHY ------------------------------------------------------------------------//
      //---------------------------------------------------- Typography ------------------------------------------------------------------------//
      textTheme: TextTheme(
        headline1: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            fontSize: 20.sp,
            color: Colors.black),
        headline2: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
            color: Colors.black),
        headline3: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: Colors.black),
        bodyMedium: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w400,
            fontSize: 13.sp,
            color: Colors.black),
        subtitle1: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: "Nunito",
            fontSize: 10.sp,
            color: Colors.black.withOpacity(0.8)),
      ),
    );
  }
}
