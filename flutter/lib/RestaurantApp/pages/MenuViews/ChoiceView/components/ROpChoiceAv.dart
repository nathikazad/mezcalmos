import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpItemView"]["components"]["ROpItemAvChips"];

//
class ROpAvailableChips extends StatelessWidget {
  const ROpAvailableChips({
    Key? key,
    required this.isAvailable,
    required this.onAvailableTap,
    required this.onUnavailableTap,
    this.marging,
  }) : super(key: key);
  final bool isAvailable;
  final void Function(bool?) onAvailableTap;
  final void Function(bool?) onUnavailableTap;
  final EdgeInsets? marging;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marging,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_i18n()["available"]}',
                    style: context.txt.bodyLarge,
                  ),
                  radioCircleButton(
                      onTap: onAvailableTap, value: isAvailable == true),
                ],
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${_i18n()["unavailable"]}",
                    style: context.txt.bodyLarge,
                  ),
                  radioCircleButton(
                      onTap: onUnavailableTap, value: isAvailable == false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
