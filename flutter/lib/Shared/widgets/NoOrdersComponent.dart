import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["NoOrdersComponent"];

class NoOrdersComponent extends StatelessWidget {
  const NoOrdersComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        Get.find<LanguageController>().notifyChildrens();
        return Container(
          // margin: const EdgeInsets.all(12),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 25.h,
                width: 70.w,
                child: Image.asset(noOrdersAsset),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "${_i18n()["title"]}",
                style: context.txt.bodyLarge,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${_i18n()["subtitle"]}",
                style: context.txt.bodyLarge?.copyWith(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade800),
              ),
            ],
          ),
        );
      },
    );
  }
}
