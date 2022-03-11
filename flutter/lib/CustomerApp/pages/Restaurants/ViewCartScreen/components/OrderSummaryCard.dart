import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/DropDownLocationList.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewCartScreen"]["components"]["OrderSummaryCard"];

class OrderSummaryCard extends StatelessWidget {
  final String? orderCost;
  final String? deliveryCost;
  final String? totalCost;

  final Function({Location? location})? setLocationCallBack;

  const OrderSummaryCard({
    Key? key,
    this.orderCost,
    this.deliveryCost,
    this.setLocationCallBack,
    this.totalCost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            //=======================Order summary================
            Container(
              alignment: Alignment.center,
              width: Get.width,
              child: Text("${_i18n()["orderSummary"]}", style: txt.headline3),
            ),
            Divider(
              height: 20,
            ),
            //==================Order cost :==================
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              width: Get.width,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text("${_i18n()["orderCost"]} :",
                          style: txt.bodyText2),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    child: Text("\$$orderCost", style: txt.bodyText1),
                  ))
                ],
              ),
            ),
            //=======================Delivery cost :===============
            Container(
              padding: EdgeInsets.only(bottom: 10),
              width: Get.width,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text("${_i18n()["deliveryCost"]} :",
                          style: txt.bodyText2),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    child: Text("\$$deliveryCost", style: txt.bodyText1),
                  ))
                ],
              ),
            ),
            //=======================Total cost : ==================
            Container(
              padding: EdgeInsets.only(bottom: 10),
              width: Get.width,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        "${_i18n()["totalCost"]} :",
                        style: txt.headline3!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.75.sp,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "\$$totalCost",
                      style: txt.headline3!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.75.sp,
                      ),
                    ),
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            //=======================Delivery location :===========
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "${_i18n()["deliveryLocation"]} :",
                style: txt.headline3!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.75.sp,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DropDownLocationList(onValueChangeCallback: setLocationCallBack),
          ],
        ),
      ),
    );
  }
}
