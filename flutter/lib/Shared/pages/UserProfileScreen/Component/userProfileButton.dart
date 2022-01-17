import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

Widget UserProfileButton(
    {required Function function, required bool isEditing}) {
  LanguageController lang = Get.find<LanguageController>();
  return Container(
    padding: EdgeInsets.only(bottom: 20.sp),
    child: MaterialButton(
      onPressed: () async => function(),
      padding: EdgeInsets.only(left: 0, right: 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          height: 48.sp,
          width: (Get.width - 20).sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(81, 132, 255, 1),
              Color.fromRGBO(206, 73, 252, 1)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  (!isEditing) ? Icons.edit_outlined : Icons.save_outlined,
                  color: Colors.white,
                  size: 19,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  (!isEditing)
                      ? lang.strings['shared']['userInfo']["editBtn"]
                      : lang.strings['shared']['userInfo']["saveBtn"],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
