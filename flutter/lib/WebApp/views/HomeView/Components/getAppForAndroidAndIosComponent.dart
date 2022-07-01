import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
import 'package:sizer/sizer.dart';

class GetAppForAndroidAndIosComponent extends StatelessWidget {
  GetAppForAndroidAndIosComponent({Key? key}) : super(key: key);
  final LanguageController langController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
      width: Get.width,
      margin: EdgeInsets.symmetric(
        horizontal: getMargingSizeForContainer(context),
      ),
      decoration:
          BoxDecoration(border: Border.all(width: 3, color: Colors.black)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: getSizeForText(context),
          ),
          Obx(
            () => Text(
              "${langController.strings["WebApp"]["getAppNow"]}}",
              style: txt.headline1!.copyWith(
                  fontSize: getSizeForText(context),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Montserrat",
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: getSizeForText(context) / 2,
          ),
          Row(
            children: [
              Spacer(),
              Container(
                  width: getSizeForImage(context),
                  child: Image.asset("assets/images/webApp/googlePlayImg.png")),
              SizedBox(
                width: 3.sp,
              ),
              Container(
                  width: getSizeForImage(context),
                  child: Image.asset("assets/images/webApp/appStroreImg.png")),
              Spacer(),
            ],
          ),
          SizedBox(
            height: getSizeForText(context),
          ),
        ],
      ),
    );
  }

  double getMargingSizeForContainer(context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 100;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 50;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 11.sp;
    } else {
      return 0;
    }
  }

  double getSizeForImage(context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return Get.width * 0.15;
    } else if (MezCalmosResizer.isTablet(context)) {
      return Get.width * 0.16;
    } else if (MezCalmosResizer.isMobile(context)) {
      return Get.width * 0.2;
    } else {
      return 0;
    }
  }

  double getSizeForText(context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 11.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 11.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 15.sp;
    } else {
      return 0;
    }
  }
}
