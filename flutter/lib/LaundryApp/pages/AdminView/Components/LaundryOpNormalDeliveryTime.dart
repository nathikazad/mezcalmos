import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class LaundryOpNormalDeliveryTime extends StatelessWidget {
  const LaundryOpNormalDeliveryTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Normal delivery time",
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
                  onTap: () {},
                  child: Ink(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: SecondaryLightBlueColor, shape: BoxShape.circle),
                    child: Icon(
                      Icons.remove,
                      color: primaryBlueColor,
                    ),
                  ),
                ),
                Text(
                  "2 days",
                  style: Get.textTheme.bodyText1,
                ),
                InkWell(
                  customBorder: CircleBorder(),
                  onTap: () {},
                  child: Ink(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: SecondaryLightBlueColor, shape: BoxShape.circle),
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
