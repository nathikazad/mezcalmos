import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerAppTheme {
  static final lightTheme = ThemeData(
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      primary: Colors.white,
      backgroundColor: Color(0xFFAC59FC),
      padding: EdgeInsets.all(16),
      textStyle: TextStyle(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w700,
        fontSize: 15.sp,
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
          fontWeight: FontWeight.w600,
          fontSize: 20.sp,
          color: Colors.black),
      headline2: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
          color: Colors.black),
      headline3: TextStyle(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        color: Colors.black,
      ),
      bodyText1: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color: Colors.black),
      bodyText2: TextStyle(
          fontFamily: "Nunito",
          fontWeight: FontWeight.w600,
          fontSize: 13.sp,
          color: Colors.black),
      subtitle1: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: "Nunito",
          fontSize: 10.sp,
          color: Colors.black.withOpacity(0.8)),
    ),
  );
}
