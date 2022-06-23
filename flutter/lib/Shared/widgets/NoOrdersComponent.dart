import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["NoOrdersComponent"];

class NoOrdersComponent extends StatelessWidget {
  const NoOrdersComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: 220,
            width: 200,
            child: Image.asset(noOrdersAsset),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "${_i18n()["title"]}",
            style: Get.textTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "${_i18n()["subtitle"]}",
            style: Get.textTheme.bodyText1?.copyWith(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800),
          ),
        ],
      ),
    );
  }
}
