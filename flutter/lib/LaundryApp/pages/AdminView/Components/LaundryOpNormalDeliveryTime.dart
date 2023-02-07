import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]["pages"]
    ["AdminView"]["components"]["LaundryOpNormalDeliveryTime"];

//
class LaundryOpNormalDeliveryTime extends StatelessWidget {
  const LaundryOpNormalDeliveryTime(
      {Key? key,
      required this.data,
      this.enabled = true,
      required this.onTapPlus,
      required this.onTapMinus})
      : super(key: key);
  final num data;
  final void Function()? onTapPlus;
  final void Function()? onTapMinus;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${_i18n()["normalDeliverytime"]}",
          style: Get.textTheme.bodyLarge,
        ),
        SizedBox(
          height: 10,
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  customBorder: CircleBorder(),
                  onTap: onTapMinus,
                  child: Ink(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: enabled
                            ? secondaryLightBlueColor
                            : Colors.grey.shade300,
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.remove,
                      color: enabled ? primaryBlueColor : Colors.grey.shade600,
                    ),
                  ),
                ),
                Text(
                  "$data ${_i18n()["days"]}",
                  style: Get.textTheme.bodyLarge,
                ),
                InkWell(
                  customBorder: CircleBorder(),
                  onTap: enabled ? onTapPlus : null,
                  child: Ink(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: enabled
                            ? secondaryLightBlueColor
                            : Colors.grey.shade300,
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.add,
                      color: enabled ? primaryBlueColor : Colors.grey.shade600,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
