import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

void MezSnackbar(String title, String msg,
    {SnackPosition position = SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    BuildContext? context}) {
  if (context != null) {
    var snackBar = SnackBar(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Get.textTheme.bodyText1!
                .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 5,
          ),
          Text(msg),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    Get.snackbar(title, msg,
        duration: duration,
        messageText: Text(
          "$msg",
          style: Get.textTheme.bodyText2?.copyWith(color: Colors.white),
          maxLines: 2,
        ),
        colorText: Colors.white,
        backgroundColor: Colors.black87,
        snackPosition: position,
        snackStyle: SnackStyle.FLOATING);
  }
}
