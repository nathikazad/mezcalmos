import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Offerings']['components'];

class CustBusinessNoOrderBanner extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  const CustBusinessNoOrderBanner(
      {super.key, this.margin = const EdgeInsets.only(top: 15)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.info_outline,
              color: primaryBlueColor,
            ),
          ),
          Expanded(
            child: Obx(
              () => Text(
                _i18n()['noBooking'],
                style: context.textTheme.titleMedium!.copyWith(
                  color: primaryBlueColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
