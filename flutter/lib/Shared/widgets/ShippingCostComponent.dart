import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["FreeShippingComponent"];
//

class ShippingCostComponent extends StatelessWidget {
  const ShippingCostComponent(
      {Key? key,
      required this.shippingCost,
      this.defaultShippingCost = 50,
      this.alignment = MainAxisAlignment.end})
      : super(key: key);
  final num shippingCost;
  final num defaultShippingCost;
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (shippingCost == 0)
          ? Row(
              mainAxisAlignment: alignment,
              children: [
                Flexible(
                  child: Text(
                    defaultShippingCost.toPriceString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(decoration: TextDecoration.lineThrough),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    "${_i18n()["free"]}",
                    style: Get.textTheme.bodyText1
                        ?.copyWith(color: primaryBlueColor),
                  ),
                )
              ],
            )
          : Text(
              shippingCost.toPriceString(),
            ),
    );
  }
}
