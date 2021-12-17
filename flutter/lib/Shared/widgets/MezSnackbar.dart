import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void MezSnackbar(String title, String msg,
        {SnackPosition position = SnackPosition.BOTTOM}) =>
    Get.snackbar(title, msg,
        colorText: Colors.white,
        backgroundColor: Colors.black87,
        snackPosition: position,
        snackStyle: SnackStyle.FLOATING);
