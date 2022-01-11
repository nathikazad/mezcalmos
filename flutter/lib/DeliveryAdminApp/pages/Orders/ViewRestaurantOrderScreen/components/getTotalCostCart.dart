import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

Widget getTotalCostCart(Rxn<RestaurantOrder> order) {
  LanguageController lang = Get.find<LanguageController>();

  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        child: Text(
            "${lang.strings['customer']['restaurant']['cart']['totalCost']}",
            style: TextStyle(
                color: const Color(0xff000f1c),
                fontFamily: "psb",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
            textAlign: TextAlign.left),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: Get.width,
        height: 113,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: const Color(0xffececec), width: 0.5),
          color: const Color(0x80ffffff),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                        "${lang.strings['customer']['restaurant']['cart']['deliveryCost']}",
                        style: const TextStyle(
                            color: const Color(0xff000f1c),
                            fontFamily: "psr",
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0),
                        textAlign: TextAlign.left),
                    Spacer(),
                    Text(" \$40.00",
                        style: TextStyle(
                            color: const Color(0xff000f1c),
                            fontFamily: "psb",
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0.sp),
                        textAlign: TextAlign.right)
                  ],
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: Get.width,
                height: 0.5,
                decoration: BoxDecoration(color: const Color(0xffececec))),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    // Total
                    Text(
                        "${lang.strings['customer']['restaurant']['cart']['total']}",
                        style: const TextStyle(
                            color: const Color(0xff000f1c),
                            fontFamily: "psr",
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0),
                        textAlign: TextAlign.left),
                    Spacer(),
                    Text("  \$${currency.format(order.value!.cost)}",
                        style: TextStyle(
                            color: const Color(0xff000f1c),
                            fontFamily: "psb",
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0.sp),
                        textAlign: TextAlign.right)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}
