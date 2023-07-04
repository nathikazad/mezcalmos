import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/controllers/ItemViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpItemView"]["components"]["ROpItemAvChips"];

//
class ROpItemAvChips extends StatelessWidget {
  const ROpItemAvChips({Key? key, required this.viewController})
      : super(key: key);
  final ROpItemViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35),
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
                        viewController.switchItemAv(true);
                      },
                      value:
                          viewController.editableItem.value!.available == true),
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
                        viewController.switchItemAv(false);
                      },
                      value: viewController.editableItem.value!.available ==
                          false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
