import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class MezSideMenu extends GetWidget<AuthController> {
  SideMenuDraweController _draweController =
      Get.find<SideMenuDraweController>();
  LanguageController lang = Get.find<LanguageController>();

  String lmd = GetStorage().read(getxLmodeKey);
  String VERSION = GetStorage().read(version);

  @override
  Widget build(BuildContext context) {
    print("=========> ImgUrl ======<  ${controller.user?.image}");

    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // radius: 30.0,
                          Container(
                            height: 120,
                            width: 120,
                            child: ClipOval(
                              clipBehavior: Clip.antiAlias,
                              child: controller.user?.image == null ||
                                      controller.user?.image == ""
                                  ? Image.asset(
                                      aDefaultAvatar,
                                      width:
                                          getSizeRelativeToScreen(300, sw, sh),
                                      height:
                                          getSizeRelativeToScreen(300, sw, sh),
                                      fit: BoxFit.contain,
                                    )
                                  : Image.network(
                                      controller.user!.image! + "?type=large",
                                      fit: BoxFit.cover,
                                      height:
                                          getSizeRelativeToScreen(300, sw, sh),
                                      width:
                                          getSizeRelativeToScreen(300, sw, sh),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.05,
                          ),
                          Container(
                            child: Text(
                              controller.user?.displayName ?? tDefaultUserName,
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontFamily: 'psb', fontSize: 25.5),
                            ),
                          )
                        ],
                      ),
                    )),
                    Container(
                      width: Get.width * 0.8,
                      child: Column(
                        children: [
                          ListTile(
                              onTap: () async => await controller.signOut(),
                              leading: Icon(
                                MezcalmosIcons.power_off,
                                color: Color.fromARGB(255, 103, 121, 254),
                                size: 25,
                              ),
                              title: Obx(
                                () => Text(
                                  lang.strings['shared']['navDrawer']["logout"],
                                  style: TextStyle(
                                      fontFamily: 'psb', fontSize: 16),
                                ),
                              )),
                          ListTile(
                              onTap: () async => await launch(tPrivacyPolicy),
                              leading: Icon(
                                Icons.lock_sharp,
                                color: Color.fromARGB(255, 103, 121, 254),
                                size: 25,
                              ),
                              title: Obx(
                                () => Text(
                                  lang.strings['shared']['navDrawer']["legal"],
                                  style: TextStyle(
                                      fontFamily: 'psb', fontSize: 16),
                                ),
                              )),
                          Obx(() => ListTile(
                              onTap: () {
                                lang.changeUserLanguage();
                                _draweController.cloeseMenu();
                              },
                              leading: Container(
                                height: 31,
                                width: 31,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(lang.oppositFlag))),
                              ),
                              title: Text(lang.oppositToLang,
                                  style: TextStyle(
                                      fontFamily: 'psb', fontSize: 16)))),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: Get.height * 0.12,
              child: Center(
                child: Text(
                  'v1.0.8' + (lmd != "prod" ? " $lmd" : " "),
                ),
              ),
            )
          ],
        ),
        // child: Flex(
        //   direction: Axis.vertical,
        //   children: <Widget>[
        //     Container(
        //       alignment: Alignment.topLeft,
        //       color: Colors.black,
        //       height: getSizeRelativeToScreen(25, sw, sh),
        //     ),
        //     Padding(
        //       padding: EdgeInsets.only(
        //           top: getSizeRelativeToScreen(200, sw, sh),
        //           bottom: getSizeRelativeToScreen(20, sw, sh)),
        //       child: SizedBox(
        //         height: getSizeRelativeToScreen(300, sw, sh),
        //         width: double.infinity,
        //     child:
        //       ),
        //     ),
        //     Flexible(
        //    child:
        //     ),
        //     SizedBox(height: getSizeRelativeToScreen(300, sw, sh)),

        //   ],
        // ),
      ),
    );
  }
}
