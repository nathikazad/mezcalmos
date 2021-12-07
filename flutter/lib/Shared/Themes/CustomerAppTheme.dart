import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/Themes/styles/appBarStyleTheme.dart';
import 'package:mezcalmos/Shared/Themes/styles/cardStyleTheme.dart';
import 'package:mezcalmos/Shared/Themes/styles/textStyleTheme.dart';

class CustomerAppTheme {
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Color(0XFFEDEDED),
      appBarTheme: appBarStyleTheme,
      dividerColor: Colors.grey.withOpacity(0.8),
      brightness: Brightness.light,
      primaryColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.grey[850]),
      cardTheme: cardStyleTheme,
      textTheme: textStyleTheme,
      colorScheme: ColorScheme.light().copyWith(secondary: Colors.grey[850]));
}
