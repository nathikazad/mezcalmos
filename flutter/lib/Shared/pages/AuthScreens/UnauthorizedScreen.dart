// BELONGS TO TAXI APP, please move

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:sizer/sizer.dart';

import 'package:url_launcher/url_launcher_string.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ["AuthScreens"]["UnauthorizedScreen"];

class UnauthorizedScreen extends StatefulWidget {
  const UnauthorizedScreen({Key? key}) : super(key: key);

  @override
  _UnauthorizedScreenState createState() => _UnauthorizedScreenState();
}

class _UnauthorizedScreenState extends State<UnauthorizedScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // _animeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
// Color.fromARGB(255, 97, 127, 255),
// Color.fromARGB(255, 198, 90, 252),
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            key: Get.find<SideMenuDrawerController>().getNewKey(),
            drawer: MezSideMenu(),
            backgroundColor: Colors.white,
            appBar: MezcalmosAppBar(
              AppBarLeftButtonType.Menu,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 40.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/shared/notAuthorized.png"),
                        fit: BoxFit.contain),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '${_i18n()['unauthorized']}',
                  style: Get.textTheme.headline3,
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () async {
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: "+529541184711",
                      );
                      await launchUrlString(launchUri.toString());
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: '${_i18n()['subTitle1']} ',
                                style: Get.textTheme.bodyText2),
                            TextSpan(
                                text: '+52 954 118 4711',
                                style: Get.textTheme.bodyText1
                                    ?.copyWith(color: primaryBlueColor)),
                            TextSpan(
                                text: '${_i18n()['subTitle2']}',
                                style: Get.textTheme.bodyText2),
                          ],
                        ),
                      ),
                    )),
                SizedBox(
                  height: 35,
                ),
              ],
            )));
  }
}
