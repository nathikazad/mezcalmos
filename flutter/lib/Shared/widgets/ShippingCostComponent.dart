import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      this.textStyle,
      this.showPerKm = false,
      this.formattedShippingCost,
      this.alignment = MainAxisAlignment.end})
      : super(key: key);
  final num? shippingCost;
  final String? formattedShippingCost;
  final MainAxisAlignment alignment;
  final bool showPerKm;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        formattedShippingCost ?? shippingCost?.toPriceString() ?? "-",
        style: textStyle,
      ),
    );
  }
}
