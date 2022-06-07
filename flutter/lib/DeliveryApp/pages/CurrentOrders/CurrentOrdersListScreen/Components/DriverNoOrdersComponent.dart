import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/constants/assets.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:sizer/sizer.dart';

class DriverNoOrdersComponent extends StatelessWidget {
  /// Shows an image from asset and text telling the driver that there is no current orders right now
  const DriverNoOrdersComponent({Key? key}) : super(key: key);
  dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
          ["pages"]["CurrentOrders"]["CurrentOrdersListScreen"]["Components"]
      ["DriverNoOrdersComponent"];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 20.h,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(noOrdersFound_asset))),
        ),
        SizedBox(
          height: 15.sp,
        ),
        Column(
          children: [
            Obx(
              () => Text(
                _i18n()["noOrdersTitle"],
                textAlign: TextAlign.center,
                style: Get.textTheme.headline3,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => Text(
                _i18n()["noOrdersDesc"],
                textAlign: TextAlign.center,
                style: Get.textTheme.bodyText2
                    ?.copyWith(fontSize: 12.sp, color: Colors.grey.shade700),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
