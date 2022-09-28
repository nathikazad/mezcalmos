import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void MezSnackbar(String title, String msg,
        {SnackPosition position = SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3)}) =>
    Get.snackbar(title, msg,
        duration: duration,
        colorText: Colors.white,
        backgroundColor: Colors.black87,
        snackPosition: position,
        snackStyle: SnackStyle.FLOATING);
