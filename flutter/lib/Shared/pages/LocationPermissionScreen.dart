import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';

class LocationPermissionScreen extends StatelessWidget {
  SideMenuDraweController _sideMenuDrawerController =
      Get.find<SideMenuDraweController>();

  SettingsController _settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    print("Onlocation screeeeeen !");
    return Scaffold(
      key: _sideMenuDrawerController.scaffoldKey,
      drawer: MezSideMenu(),
      backgroundColor: Colors.white,
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
          "menu", _sideMenuDrawerController.openMenu),
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
                "Location Service Turned Off",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontFamily: 'psr'),
              ),
              SizedBox(
                height: getSizeRelativeToScreen(10, Get.height, Get.width),
              ),
              Obx(
                () => Text(
                  // "App can not work without Background Location Permission !",
                  _settingsController.appLanguage.strings['taxi']['permissions']
                      ['askForNotif'],
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
                  bool grantedPermission = await getLocationPermission();
                  print("Permissions Granted ==========> $grantedPermission");
                  if (grantedPermission) {
                    _settingsController.hasLocationPermissions.value = true;
                  }
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
      ),
    );
  }
}
