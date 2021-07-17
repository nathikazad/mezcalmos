import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/mezcalmos_icons.dart';

class MezcalmosSideMenu extends GetWidget<AuthController> {
  SettingsController _settingsController = Get.find<SettingsController>();
 LanguageController lang =Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    print("=========> ImgUrl ======<  ${controller.user?.image}");

    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Drawer(
        child: Flex(
          direction: Axis.vertical,
          // padding: EdgeInsets.zero,
          children: <Widget>[
            //DrawerHeader(
            // child: Text(
            //   'mezcalmos',
            // ),
            //   decoration: BoxDecoration(
            //       color: Colors.green,
            //       image: DecorationImage(
            //           fit: BoxFit.fill,
            //           image: AssetImage('assets/images/header.png'))),
            //),
            Container(
              alignment: Alignment.topLeft,
              color: Colors.black,
              height: getSizeRelativeToScreen(25, sw, sh),
              // width: 1,
            ),
            Container(
                margin: EdgeInsets.only(
                    top: getSizeRelativeToScreen(200, sw, sh),
                    bottom: getSizeRelativeToScreen(20, sw, sh)),
                height: getSizeRelativeToScreen(300, sw, sh),
                width: double.infinity,
                child: CircleAvatar(
                  radius: 30.0,
                  child: ClipOval(
                    child: controller.user?.image == null
                        ? Image.asset(aDefaultAvatar)
                        : Image.network(controller.user!.image + "?type=large"),
                  ),
                  backgroundColor: Colors
                      .grey.shade100, //Color.fromARGB(255, 222, 222, 222),
                  // radius: 1,
                )),

            Flexible(
              child: Text(
                controller.user?.displayName ?? tDefaultUserName,
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'psb', fontSize: 25.5),
              ),
            ),

            SizedBox(height: getSizeRelativeToScreen(300, sw, sh)),
            ListTile(
                onTap: () async => await controller.signOut(),
                leading:  Icon(MezcalmosIcons.powerOff, color: Color.fromARGB(255, 103, 121, 254),
                                  size: 25,),
                title: Text(
                  lang.strings['shared']['navDrawer']["logout"],
                  style: TextStyle(fontFamily: 'psb', fontSize: 16),
                )),
            Obx(() => ListTile(
                onTap: () => _settingsController.appLanguage.changeLang(),
                leading: Container(
                  height: 31,
                  width: 31,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                              _settingsController.appLanguage.oppositFlag))),
                ),
                title: Text(_settingsController.appLanguage.oppositToLang,
                    style: TextStyle(fontFamily: 'psb', fontSize: 16)))),
            // Container(
            //   height: 222,
            //   // color: Colors.red,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.all(getSizeRelativeToScreen(25.0, sw, sh)),
            //         child: GestureDetector(
            //           onTap: () async => await controller.signOut(),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               Icon(Icons.power_settings_new_rounded),
            //               SizedBox(width: getSizeRelativeToScreen(20.0, sw, sh)),
            //               Center(
            //                   child: Text(
            //                 tDisconnect,
            //                 style: TextStyle(fontFamily: 'psb', fontSize: 16),
            //               )),
            //             ],
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.all(getSizeRelativeToScreen(25.0, sw, sh)),
            //         child: GestureDetector(
            //           onTap: () {
            //             _settingsController.appLanguage.changeLang();
            //           },
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               Icon(Icons.language),
            //               SizedBox(width: getSizeRelativeToScreen(20.0, sw, sh)),
            //               Center(child: Obx(() => Text(_settingsController.appLanguage.langFullName, style: TextStyle(fontFamily: 'psb', fontSize: 16)))),
            //             ],
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
