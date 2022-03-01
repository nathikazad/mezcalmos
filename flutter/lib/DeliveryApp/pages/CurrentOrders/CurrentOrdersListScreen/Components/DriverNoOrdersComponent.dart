import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/constants/assets.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:sizer/sizer.dart';

class DriverNoOrdersComponent extends StatelessWidget {
  /// Shows an image from asset and text telling the driver that there is no current orders right now
  DriverNoOrdersComponent({Key? key}) : super(key: key);
  LanguageController lang = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
                lang.strings['taxi']['incoming']["noOrdersTitle"],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.5.sp, fontFamily: 'psr'),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Obx(
              () => Text(
                lang.strings['taxi']['incoming']["noOrdersDesc"],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'psr',
                    color: Color.fromARGB(255, 168, 168, 168)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
