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
      required this.onTapPlus,
      required this.onTapMinus})
      : super(key: key);
  final num data;
  final void Function()? onTapPlus;
  final void Function()? onTapMinus;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${_i18n()["normalDeliverytime"]}",
          style: Get.textTheme.bodyText1,
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
                        color: secondaryLightBlueColor, shape: BoxShape.circle),
                    child: Icon(
                      Icons.remove,
                      color: primaryBlueColor,
                    ),
                  ),
                ),
                Text(
                  "$data ${_i18n()["days"]}",
                  style: Get.textTheme.bodyText1,
                ),
                InkWell(
                  customBorder: CircleBorder(),
                  onTap: onTapPlus,
                  child: Ink(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: secondaryLightBlueColor, shape: BoxShape.circle),
                    child: Icon(
                      Icons.add,
                      color: primaryBlueColor,
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
