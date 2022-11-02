import 'package:flutter/material.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';

import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class WebAppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      //---------------------------------------------------- COLORS ------------------------------------------------------------------------//
      //---------------------------------------------------- COLORS ------------------------------------------------------------------------//
      primaryColor: Colors.white,

      primaryColorLight: Color(0xFF6779FE),

      indicatorColor: Color(0xFF6779FE),
      brightness: Brightness.light,

      dividerColor: Colors.grey.withOpacity(0.8),
      colorScheme: ColorScheme.light().copyWith(secondary: Colors.grey[850]),

      //---------------------------------------------------- WIGGETS ------------------------------------------------------------------------//
      //---------------------------------------------------- WIGGETS ------------------------------------------------------------------------//
      scaffoldBackgroundColor: Color(0XFFFAFAFA),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: GoogleFonts.nunito(
            textStyle: TextStyle(
          fontFamily: "Nunito",
          fontWeight: FontWeight.w600,
          fontSize: 17.sp,
          color: Colors.black,
        )),
        elevation: 0.2,
        centerTitle: true,
        titleSpacing: 16,
        iconTheme: IconThemeData(color: Colors.black),
        actionsIconTheme: IconThemeData(color: Colors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          isDense: true,
          focusColor: Color(0xFF6779FE),
          prefixIconColor: Color(0xFF6779FE),
          alignLabelWithHint: true,
          hintStyle: GoogleFonts.nunito(
            textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: "Nunito",
              fontSize: 10.sp,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.never),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF6779FE),
        elevation: 1.0,
      ),
      bottomAppBarTheme:
          BottomAppBarTheme(color: Color(0xFF6779FE), elevation: 1.0),

      buttonTheme:
          ButtonThemeData(shape: CircleBorder(), padding: EdgeInsets.all(8)),
      dialogTheme: DialogTheme(
        titleTextStyle: GoogleFonts.nunito(
          textStyle: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: Colors.black,
          ),
        ),
        contentTextStyle: GoogleFonts.nunito(
            textStyle: TextStyle(
          fontFamily: "Nunito",
          fontWeight: FontWeight.w600,
          fontSize: 13.sp,
          color: Colors.black,
        )),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        primary: Colors.white,
        backgroundColor: Color(0xFF6779FE),
        padding: EdgeInsets.all(12),
        textStyle: GoogleFonts.montserrat(
            textStyle: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color: Colors.white,
        )),
      )),
      iconTheme: IconThemeData(color: Colors.grey[850]),
      cardTheme: CardTheme(
        elevation: 0.5,
        margin: EdgeInsets.only(bottom: 3),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      chipTheme: ChipThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: SecondaryLightBlueColor,
          showCheckmark: false,
          disabledColor: Colors.grey,
          selectedColor: Colors.white,
          padding: EdgeInsets.all(5),
          labelStyle: GoogleFonts.montserrat(
              textStyle: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
            color: primaryBlueColor,
          )),
          brightness: Brightness.light,
          secondarySelectedColor: Color(0xFF6779FE),
          secondaryLabelStyle: GoogleFonts.montserrat(
            textStyle: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: Colors.white),
          )),

      //---------------------------------------------------- TYPOGRAPHY ------------------------------------------------------------------------//
      //---------------------------------------------------- Typography ------------------------------------------------------------------------//
      textTheme: TextTheme(
        headline1: GoogleFonts.nunito(
            textStyle: TextStyle(
                fontFamily: "Nunito",
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                color: Colors.black)),
        headline2: GoogleFonts.nunito(
            textStyle: TextStyle(
          fontFamily: "Nunito",
          fontWeight: FontWeight.w600,
          fontSize: 17.sp,
          color: Colors.black,
        )),
        headline3: GoogleFonts.montserrat(
            textStyle: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: Colors.black,
        )),
        bodyText1: GoogleFonts.montserrat(
            textStyle: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
          color: Colors.black,
        )),
        bodyText2: GoogleFonts.montserrat(
            textStyle: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
          height: 1.5,
          fontSize: 11.sp,
          color: Color(0xFF494949),
        )),
        subtitle2: GoogleFonts.montserrat(
            textStyle: TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
          color: Color(0xFF494949),
        )),
        subtitle1: GoogleFonts.nunito(
            textStyle: TextStyle(
          fontFamily: "Nunito",
          fontWeight: FontWeight.w400,
          fontSize: 11.sp,
          color: Colors.black,
        )),
      ),
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: Color(0xFF6779FE)),
    );
  }
}
