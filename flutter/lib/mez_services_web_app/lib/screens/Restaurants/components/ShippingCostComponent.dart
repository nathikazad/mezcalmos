import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/helpers/NumHelper.dart';

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
                Text(
                  defaultShippingCost.toPriceString(),
                  style: TextStyle(
                      fontSize: 13, decoration: TextDecoration.lineThrough),
                ),
                // Text(defaultShippingCost.toPriceString(),
                //     style: TextStyle(fontSize: 11)
                //     // style: Theme.of(context).textTheme.bodyText2?.copyWith(
                //     //     decoration: TextDecoration.lineThrough, fontSize: 11),
                //     ),
                SizedBox(
                  width: 5,
                ),
                Obx(
                  () => Text("${_i18n()["free"]}",
                      style: TextStyle(fontSize: 13, color: Color(0xFF6779FE))
                      //       ?.copyWith(color: Color(0xFF6779FE), fontSize: 11),
                      ),
                )
              ],
            )
          : Text(
              shippingCost.toPriceString(),
              style: TextStyle(fontSize: 13, color: Colors.black),
            ),
    );
  }
}
