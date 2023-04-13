import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/env.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeFooterButtons extends StatelessWidget {
  const HomeFooterButtons({
    Key? key,
  }) : super(key: key);

  /// LanguageController
  static final LanguageController _languageController =
      Get.find<LanguageController>();

  dynamic _i18n() => _languageController.strings['CustomerApp']['components']
      ['CustomerHomeFooterButtons'];

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            child: InkWell(
              onTap: () {
                _languageController.changeUserLanguage();
              },
              child: Ink(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 20.sp,
                      width: 20.sp,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(_languageController.oppositFlag),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      _languageController.oppositToLang,
                      style: txt.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: InkWell(
              onTap: () async =>
                  launchUrlString(MezEnv.appType.getPrivacyLink()),
              child: Ink(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Ionicons.lock_closed,
                      // color: Theme.of(context).primaryColorLight,
                      size: 20.sp,
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Text(
                        _i18n()["privacyPolicy"],
                        style: txt.bodyMedium,
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
