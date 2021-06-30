
// Usefull when trying to make Sizes adptable!
import 'package:flutter/material.dart';
import 'package:get/get.dart';

  void mezcalmosLogger(String text, {bool isError = false}) => print("[ MEZCALMOS ][ GETX ] $text");
  
double getSizeRelativeToScreen(double v, double screenHeight, double screenWidth) => (screenHeight / screenWidth) * v;

//Our default snackBar
void mezcalmosSnackBar(String _title, String _msg) => Get.snackbar
( 
  _title , _msg,
  colorText: Colors.white,
  backgroundColor: Colors.black87,
  snackPosition: SnackPosition.BOTTOM,
  snackStyle: SnackStyle.FLOATING
);