import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/controllers/CustCartViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewCartScreen"]["components"]["OrderSummaryCard"];

class CardSummaryCard extends StatelessWidget {
  const CardSummaryCard({
    Key? key,
    required this.controller,
    this.serviceLoc,
  }) : super(key: key);

  final MezLocation? serviceLoc;

  final CustCartViewController controller;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //=======================Order summary================
            Container(
              alignment: Alignment.centerLeft,
              width: Get.width,
              child: Text(
                "${_i18n()["orderSummary"]}",
                style: txt.bodyText1,
              ),
            ),
            SizedBox(height: 4),
            //==================Order cost :==================
            Container(
              padding: const EdgeInsets.only(bottom: 4),
              width: Get.width,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text("${_i18n()["orderCost"]} :",
                          style: txt.bodyText2),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(controller.cart.itemsCost().toPriceString(),
                          style: txt.bodyText2),
                    ),
                  )
                ],
              ),
            ),
            //=======================Delivery cost :===============
            Container(
              padding: EdgeInsets.only(
                bottom: 4,
              ),
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text("${_i18n()["deliveryCost"]} :",
                          style: txt.bodyText2),
                    ),
                  ),
                  (controller.cart.shippingCost != null &&
                          controller.isShippingSet.isTrue)
                      ? Flexible(
                          child: ShippingCostComponent(
                          alignment: MainAxisAlignment.end,
                          shippingCost: controller.cart.shippingCost!,
                        ))
                      : (controller.getOrderDistance > 10 ||
                              controller.cart.shippingCost == null)
                          ? Text("_")
                          : Row(
                              children: [
                                Transform.scale(
                                    scale: 0.4,
                                    child: CircularProgressIndicator(
                                      color: primaryBlueColor,
                                    )),
                                Text('${_i18n()["toBeCalc"]}',
                                    style: txt.bodyText2
                                        ?.copyWith(fontStyle: FontStyle.italic)
                                    // TextStyle(fontStyle: FontStyle.italic),
                                    ),
                              ],
                            )
                ],
              ),
            ),
            //=======================Stripe fees :=============== //
            if (controller.showFees)
              Container(
                padding: EdgeInsets.only(
                  bottom: 4,
                ),
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Text("${_i18n()["stripeFees"]} :",
                            style: txt.bodyText2),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(controller.cart.stripeFees.toPriceString(),
                            style: txt.bodyText2),
                      ),
                    )
                  ],
                ),
              ),
            //=======================Total cost : ==================
            Container(
              padding: EdgeInsets.only(bottom: 4, top: 3),
              width: Get.width,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text(
                        "${_i18n()["totalCost"]} :",
                        style: txt.bodyText1
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        controller.cart.totalCost.toPriceString(),
                        style: txt.bodyText1?.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 14.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 8,
            // ),
          ],
        ),
      ),
    );
  }
}
