import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['components']['NoServicesFound'];

class NoServicesFound extends StatelessWidget {
  const NoServicesFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 10.h,
        ),
        Image.asset(
          aNoResults,
          height: 125.mezSp,
          width: 125.mezSp,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '${_i18n()['noServicesFound']}',
          style: context.textTheme.bodyLarge,
        ),
        Text(
          '${_i18n()['bodyMessage']}',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
