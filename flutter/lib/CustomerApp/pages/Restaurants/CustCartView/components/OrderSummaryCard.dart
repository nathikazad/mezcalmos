import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/controllers/CustCartViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewCartScreen"]["components"]["OrderSummaryCard"];

class CardSummaryCard extends StatelessWidget {
  CardSummaryCard(
      {Key? key,
      required this.controller,
      this.serviceLoc,
      this.pickerWidget,
      this.isWebWidget})
      : super(key: key);

  final Location? serviceLoc;

  final CustCartViewController controller;

  /// this param will take a widget
  final Widget? pickerWidget;
  bool? isWebWidget = false;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
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
              child: Text("${_i18n()["orderSummary"]}",
                  style: (isWebWidget == true)
                      ? GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)
                      : txt.bodyText1),
            ),
            const SizedBox(height: 20),
            //==================Order cost :==================
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              width: Get.width,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text("${_i18n()["orderCost"]} :",
                          style: (isWebWidget == true)
                              ? GoogleFonts.montserrat(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(73, 73, 73, 1))
                              : txt.bodyText2),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        controller.cart.itemsCost().toPriceString(),
                        style: (isWebWidget != true)
                            ? GoogleFonts.montserrat(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(73, 73, 73, 1))
                            : null,
                      ),
                    ),
                  )
                ],
              ),
            ),
            //=======================Delivery cost :===============
            Container(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text("${_i18n()["deliveryCost"]} :",
                          style: (isWebWidget == true)
                              ? GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(73, 73, 73, 1))
                              : txt.bodyText2),
                    ),
                  ),
                  (controller.cart.shippingCost != null &&
                          controller.isShippingSet.isTrue)
                      ? Flexible(
                          child: ShippingCostComponent(
                          isWebVersion: isWebWidget,
                          alignment: MainAxisAlignment.end,
                          shippingCost: controller.cart.shippingCost!,
                        ))
                      : (controller.getOrderDistance > 10 ||
                              controller.cart.shippingCost == null)
                          ? Text(
                              "_",
                              style: (isWebWidget != true)
                                  ? GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(73, 73, 73, 1))
                                  : null,
                            )
                          : Row(
                              children: [
                                Transform.scale(
                                    scale: 0.4,
                                    child: CircularProgressIndicator(
                                      color: primaryBlueColor,
                                    )),
                                Text(
                                  '${_i18n()["toBeCalc"]}',
                                  style: TextStyle(fontStyle: FontStyle.italic),
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
                  bottom: 10,
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
                        child: Text(controller.cart.stripeFees.toPriceString()),
                      ),
                    )
                  ],
                ),
              ),
            //=======================Total cost : ==================
            Container(
              padding: EdgeInsets.only(bottom: 10, top: 3),
              width: Get.width,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text("${_i18n()["totalCost"]} :",
                          style: (isWebWidget == true)
                              ? GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)
                              : txt.bodyText1),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(controller.cart.totalCost.toPriceString(),
                          style: (isWebWidget == true)
                              ? GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)
                              : txt.bodyText1),
                    ),
                  ),
                ],
              ),
            ),
            if (isWebWidget != null) pickerWidget!,
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
