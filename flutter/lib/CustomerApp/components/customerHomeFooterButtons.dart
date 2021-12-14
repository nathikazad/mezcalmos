import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeFooterButtons extends StatelessWidget {
  HomeFooterButtons({
    Key? key,
  }) : super(key: key);
  LanguageController lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Obx(
      () => Column(
        children: [
          InkWell(
            onTap: () {
              lang.changeUserLanguage();
            },
            child: Ink(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 31.sp,
                    width: 31.sp,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(lang.oppositFlag))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(lang.oppositToLang, style: txt.bodyText1),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () async => await launch(tPrivacyPolicy),
            child: Ink(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Ionicons.lock_closed,
                    // color: Theme.of(context).primaryColorLight,
                    size: 25.sp,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    lang.strings['shared']['navDrawer']["legal"],
                    style: txt.bodyText1,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
