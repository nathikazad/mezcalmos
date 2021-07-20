import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/mezcalmos_icons.dart';

class MezcalmosSideMenu extends GetWidget<AuthController> {
  SideMenuDraweController _draweController =
      Get.find<SideMenuDraweController>();
  LanguageController lang = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    print("=========> ImgUrl ======<  ${controller.user?.image}");

    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Drawer(
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              color: Colors.black,
              height: getSizeRelativeToScreen(25, sw, sh),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: getSizeRelativeToScreen(200, sw, sh),
                  bottom: getSizeRelativeToScreen(20, sw, sh)),
              child: SizedBox(
                height: getSizeRelativeToScreen(300, sw, sh),
                width: double.infinity,
                child: CircleAvatar(
                  // radius: 30.0,
                  child: ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child: controller.user?.image == null
                        ? Image.asset(
                            aDefaultAvatar,
                            width: getSizeRelativeToScreen(300, sw, sh),
                            height: getSizeRelativeToScreen(300, sw, sh),
                            fit: BoxFit.contain,
                          )
                        : Image.network(
                            controller.user!.image! + "?type=large",
                            fit: BoxFit.cover,
                            height: getSizeRelativeToScreen(300, sw, sh),
                            width: getSizeRelativeToScreen(300, sw, sh),
                          ),
                  ),
                  backgroundColor: Colors
                      .grey.shade100, //Color.fromARGB(255, 222, 222, 222),
                  // radius: 1,
                ),
              ),
            ),
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
                leading: Icon(
                  MezcalmosIcons.powerOff,
                  color: Color.fromARGB(255, 103, 121, 254),
                  size: 25,
                ),
                title: Obx(
                  () => Text(
                    lang.strings['shared']['navDrawer']["logout"],
                    style: TextStyle(fontFamily: 'psb', fontSize: 16),
                  ),
                )),
            Obx(() => ListTile(
                onTap: () {
                  lang.updateUserLanguage();
                  _draweController.cloeseMenu();
                },
                leading: Container(
                  height: 31,
                  width: 31,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image:
                          DecorationImage(image: AssetImage(lang.oppositFlag))),
                ),
                title: Text(lang.oppositToLang,
                    style: TextStyle(fontFamily: 'psb', fontSize: 16)))),
          ],
        ),
      ),
    );
  }
}
