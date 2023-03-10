import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["FreeShippingComponent"];
//

class ShippingCostComponent extends StatelessWidget {
  const ShippingCostComponent(
      {Key? key,
      required this.shippingCost,
      this.textStyle,
      this.showPerKm = false,
      this.defaultShippingCost = 50,
      this.alignment = MainAxisAlignment.end})
      : super(key: key);
  final num shippingCost;
  final num defaultShippingCost;
  final MainAxisAlignment alignment;
  final bool showPerKm;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (shippingCost == 0)
          ? Flexible(
              child: Text(
                "${_i18n()["free"]}",
                style: context.txt.bodyLarge
                    ?.copyWith(color: primaryBlueColor, fontSize: 11.sp),
              ),
            )
          : Text(
              shippingCost.toPriceString() + "${(showPerKm) ? "/km" : ""}",
              style: textStyle,
            ),
    );
  }
}
