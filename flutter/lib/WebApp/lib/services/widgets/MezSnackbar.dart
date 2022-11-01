import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

void MezSnackbar(String title, String msg,
    {SnackPosition position = SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3)}) {
  Get.snackbar(title, msg,
      duration: duration,
      colorText: Colors.white,
      backgroundColor: Colors.black87,
      snackPosition: position,
      snackStyle: SnackStyle.FLOATING);
}

void MezSnackbarForWeb(String title, String msg, BuildContext context,
    {duration: const Duration(seconds: 3)}) {
  var snackBar = SnackBar(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w600),
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

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
