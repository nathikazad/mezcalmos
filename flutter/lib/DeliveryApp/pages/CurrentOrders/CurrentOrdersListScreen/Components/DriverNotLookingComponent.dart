import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/constants/assets.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:sizer/sizer.dart';

class DriverNotLookingComponent extends StatelessWidget {
  ///  Shows an image from assets and text telling the drive he is offline

  DriverNotLookingComponent({Key? key}) : super(key: key);
  dynamic _i18n =
      Get.find<LanguageController>().strings["CustomerApp"]["pages"];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 20.h,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(turnOn_asset))),
        ),
        SizedBox(
          height: 15.sp,
        ),
        Column(
          children: [
            Obx(
              () => Text(
                lang.strings['taxi']['incoming']["toggleTitle"],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.5.sp, fontFamily: 'psr'),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Obx(
              () => Text(
                lang.strings['taxi']['incoming']["toggleDesc"],
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
