import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["ClosedServiceProviderWidget"];

class ClosedServiceProviderWidget extends StatelessWidget {
  const ClosedServiceProviderWidget({super.key, required this.openCallBack});
  final Future<void> Function() openCallBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 25.h,
            width: 70.w,
            child: Image.asset(closedServiceAsset),
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
            textAlign: TextAlign.center,
            style: context.txt.bodyLarge?.copyWith(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800),
          ),
          SizedBox(
            height: 15,
          ),
          MezButton(
              label: "${_i18n()['btnTitle']}",
              icon: Icons.lock_open,
              onClick: openCallBack),
        ],
      ),
    );
  }
}
