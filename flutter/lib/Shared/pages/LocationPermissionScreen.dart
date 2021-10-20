import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';

class LocationPermissionScreen extends StatelessWidget {
  SettingsController _settingsController = Get.find<SettingsController>();
  SideMenuDraweController _sideMenuDraweController =
      Get.find<SideMenuDraweController>();
  @override
  Widget build(BuildContext context) {
    mezDbgPrint("Onlocation screeeeeen !");
    return Scaffold(
        appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
            "menu", () => _sideMenuDraweController.openMenu()),
        resizeToAvoidBottomInset: false,
        key: _sideMenuDraweController.getNewKey(),
        drawer: MezSideMenu(),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: Get.height,
          width: Get.width,
          child: Center(
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: getSizeRelativeToScreen(100, Get.height, Get.width),
                    width: getSizeRelativeToScreen(100, Get.height, Get.width),
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        image: DecorationImage(
                            image: AssetImage(aLocationPermissionAsset))),
                  ),
                ),
                Text(
                  _settingsController.appLanguage.strings['taxi']['permissions']
                      ['locationIsOff'],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontFamily: 'psr'),
                ),
                SizedBox(
                  height: getSizeRelativeToScreen(10, Get.height, Get.width),
                ),
                Obx(
                  () => Text(
                    // "App can not work without Background Location Permission !",
                    _settingsController.appLanguage.strings['taxi']
                        ['permissions']['askForNotif'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'psb',
                        color: Colors.grey.shade400),
                  ),
                ),
                SizedBox(
                  height: getSizeRelativeToScreen(25, Get.height, Get.width),
                ),
                GestureDetector(
                  onTap: () async {
                    bool grantedPermission = false;
                    do {
                      grantedPermission = await getLocationPermission();
                      mezDbgPrint(
                          "Permissions Granted ==========> $grantedPermission");
                      if (!grantedPermission) {
                        mezDbgPrint("Permission not granted !");
                        mezcalmosSnackBar(
                            'info',
                            _settingsController.appLanguage.strings['taxi']
                                ['permissions']['locationPermissionDenied'],
                            position: SnackPosition.TOP);
                      } else {
                        break;
                      }
                    } while (grantedPermission == false);
                    Get.back(closeOverlays: true);
                  },
                  child: Container(
                    height: getSizeRelativeToScreen(25, Get.height, Get.width),
                    width: getSizeRelativeToScreen(100, Get.height, Get.width),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                          Color.fromARGB(255, 97, 127, 255),
                          Color.fromARGB(255, 198, 90, 252),
                        ]),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 5,
                              color: Colors.blue.shade100,
                              spreadRadius: 1),
                        ]),
                    child: Center(
                        child: Obx(
                      () => Text(
                        _settingsController.appLanguage.strings['taxi']
                            ['permissions']['permissionBtn'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'psb',
                            fontSize: 10,
                            letterSpacing: 1),
                      ),
                    )),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
