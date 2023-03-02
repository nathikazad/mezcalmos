import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:qlevar_router/qlevar_router.dart';

void MezSnackbar(String title, String msg,
        {SnackPosition position = SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3)}) =>
    ScaffoldMessenger.of(QR.context!).showSnackBar(SnackBar(
        content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [Text(title), Text(msg)],
    )));
      // title, msg,
      //   duration: duration,
      //   messageText: Text(
      //     "$msg",
      //     style: Get.textTheme.bodyText2?.copyWith(color: Colors.white),
      //     maxLines: 2,
      //   ),
      //   colorText: Colors.white,
      //   backgroundColor: Colors.black87,
      //   snackPosition: position,
      //   snackStyle: SnackStyle.FLOATING, content: null,);
