import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpItemView"]["components"]["ROpItemAvChips"];

//
class MezItemAvSwitcher extends StatelessWidget {
  const MezItemAvSwitcher(
      {Key? key,
      required this.value,
      required this.onAvalableTap,
      required this.onUnavalableTap})
      : super(key: key);
  final bool value;
  final Function() onAvalableTap;
  final Function() onUnavalableTap;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      onTap: (bool? v) {
                        onAvalableTap();
                      },
                      value: value == true),
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
                      onTap: (bool? v) {
                        onUnavalableTap();
                      },
                      value: value == false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
