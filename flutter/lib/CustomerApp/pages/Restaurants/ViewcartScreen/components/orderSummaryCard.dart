import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dropDownListCartView.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummaryCard extends StatelessWidget {
  final String? orderCost;
  final String? deliveryCost;
  final String? totalCost;
  const OrderSummaryCard({
    Key? key,
    this.orderCost,
    this.deliveryCost,
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
              child: Text(
                "Order summary",
                style: txt.headline2!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(
              height: 9.h,
            ),
            //================Divider=======================
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 1.5,
              width: Get.width,
              color: Color.fromRGBO(229, 229, 229, 1),
            ),
            SizedBox(
              height: 17.5.h,
            ),
            //==================Order cost :==================
            Container(
              padding: EdgeInsets.only(bottom: 10.h),
              width: Get.width,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        "Order cost :",
                        style: txt.headline3!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.75.sp,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "$orderCost \$",
                      style: txt.headline3!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.75.sp,
                      ),
                    ),
                  ))
                ],
              ),
            ),
            //=======================Delivery cost :===============
            Container(
              padding: EdgeInsets.only(bottom: 10.h),
              width: Get.width,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        "Delivery cost :",
                        style: txt.headline3!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.75.sp,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "$deliveryCost \$",
                      style: txt.headline3!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.75.sp,
                      ),
                    ),
                  ))
                ],
              ),
            ),
            //=======================Total cost : ==================
            Container(
              padding: EdgeInsets.only(bottom: 10.h),
              width: Get.width,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        "Total cost :",
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
                      "$totalCost \$",
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
              height: 16.h,
            ),
            //=======================Delivery location :===========
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Delivery location :",
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
            DropDownListCartView(),
          ],
        ),
      ),
    );
  }
}
