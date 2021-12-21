import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
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
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              lang.changeUserLanguage();
            },
            child: Ink(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 20.sp,
                    width: 20.sp,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(lang.oppositFlag))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(lang.oppositToLang, style: txt.bodyText2),
                ],
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: () async => await launch(tPrivacyPolicy),
              child: Ink(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Ionicons.lock_closed,
                      // color: Theme.of(context).primaryColorLight,
                      size: 20.sp,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        lang.strings['shared']['navDrawer']["legal"],
                        style: txt.bodyText2,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
