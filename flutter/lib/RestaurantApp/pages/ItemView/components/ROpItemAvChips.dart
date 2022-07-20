import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/controllers/ItemViewController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:sizer/sizer.dart';

class ROpItemAvChips extends StatelessWidget {
  const ROpItemAvChips({Key? key, required this.viewController})
      : super(key: key);
  final ItemViewController viewController;

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
                    "Available",
                    style: Get.textTheme.bodyText1,
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
                    "Unavailable",
                    style: Get.textTheme.bodyText1,
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
