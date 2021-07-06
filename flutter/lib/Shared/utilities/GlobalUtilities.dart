// Usefull when trying to make Sizes adptable!
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void mezcalmosLogger(String text, {bool isError = false}) => print("[ MEZCALMOS ][ GETX ] $text");

double getSizeRelativeToScreen(double v, double screenHeight, double screenWidth) => (screenHeight / screenWidth) * v;

//Our default snackBar
void mezcalmosSnackBar(String _title, String _msg) =>
    Get.snackbar(_title, _msg, colorText: Colors.white, backgroundColor: Colors.black87, snackPosition: SnackPosition.BOTTOM, snackStyle: SnackStyle.FLOATING);

dynamic responseStatusChecker(dynamic resp, {String? onSuccessMessage, String? onErrorMessage}) {
  // basically
  if (resp == null) {
    print("Given Response is null !");
    return null;
  } else if (resp['status'] == "Error") {
    print("[RESPONSE ERROR] -> $resp['status'] ");
    return onErrorMessage ?? resp['status'];
  } else if (resp['status'] == "Success") {
    print("[RESPONSE SUCCESS] -> $resp['status'] ");
    return onSuccessMessage ?? resp['status'];
  } else {
    print("[RESPONSE UNKNOWN] -> $resp['status'] ");
    return null;
  }
}
