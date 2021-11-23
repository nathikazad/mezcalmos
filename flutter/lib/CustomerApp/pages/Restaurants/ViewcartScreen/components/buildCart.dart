import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantCartController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/CancelAlertDailog.dart';
import 'package:mezcalmos/Shared/widgets/MezClearButton.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCart(Cart cart) {
  LanguageController lang = Get.find<LanguageController>();
  RestaurantCartController controller = Get.find<RestaurantCartController>();

  return Column(
    children: [
      SizedBox(
        height: 15.sp,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Text("${lang.strings['customer']['restaurant']['cart']['cart']}",
                style: TextStyle(
                    color: const Color(0xff1d1d1d),
                    fontFamily: "psr",
                    fontSize: 45.0.sp),
                textAlign: TextAlign.left),
            Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                gradient: LinearGradient(
                  begin: Alignment(0.1689453125, 0),
                  end: Alignment(1, 1),
                  colors: [
                    const Color(0xff5582ff).withOpacity(0.05000000074505806),
                    const Color(0xffc54efc).withOpacity(0.05000000074505806)
                  ],
                ),
              ),
              child:
                  Text((cart.quantity() != null) ? "${cart.quantity()}" : "0",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: const Color(0xff5c7fff),
                        fontFamily: "psr",
                        fontSize: 30.0.sp,
                      ),
                      textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 25.h,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Container(
              child:
                  Text(lang.strings['customer']['restaurant']['cart']['inCart'],
                      style: TextStyle(
                          color: const Color(0xff000f1c),
                          // fontWeight: FontWeight.w700,
                          fontFamily: "psb",
                          fontSize: 14.0),
                      textAlign: TextAlign.left),
            ),
            Spacer(),
            MezClearButton(
              onTapFunction: () async {
                bool yesNoRes = await cancelAlertDailog(
                    lang.strings["customer"]["restaurant"]["cart"]["clearCart"],
                    lang.strings["customer"]["restaurant"]["cart"]
                        ["clearCartConfirm"], () {
                  Get.back(result: true);
                }, () {
                  Get.back(result: false);
                });

                if (yesNoRes) {
                  controller.clearCart();
                  Get.back();
                }
              },
            ),
          ],
        ),
      ),
      // SizedBox(
      //   height: 15,
      // ),
    ],
  );
}
