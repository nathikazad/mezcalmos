import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:sizer/sizer.dart';

Widget userProfileScreenTitle() {
  LanguageController lang = Get.find<LanguageController>();
  return Column(
    children: [
      SizedBox(
        height: 0.sp,
      ),
      Container(
        child: Text(
          lang.strings['shared']['userInfo']["title"],
          style: TextStyle(
              color: Colors.black, fontSize: 40.sp, fontFamily: 'psr'),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        height: 50.sp,
      ),
    ],
  );
}
