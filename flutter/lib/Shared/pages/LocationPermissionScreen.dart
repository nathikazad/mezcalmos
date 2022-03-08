import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:permission_handler/permission_handler.dart'
    show openAppSettings;

class LocationPermissionScreen extends StatelessWidget {
  final SettingsController _settingsController = Get.find<SettingsController>();
  final LocationController _locationController = Get.find<LocationController>();

  final SideMenuDrawerController _sideMenuDraweController =
      Get.find<SideMenuDrawerController>();

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("Onlocation screeeeeen !");
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: mezcalmosAppBar(AppBarLeftButtonType.Menu),
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
                      height:
                          getSizeRelativeToScreen(100, Get.height, Get.width),
                      width:
                          getSizeRelativeToScreen(100, Get.height, Get.width),
                      decoration: BoxDecoration(
                          // color: Colors.grey,
                          image: DecorationImage(
                              image: AssetImage(aLocationPermissionAsset))),
                    ),
                  ),
                  Obx(
                    () => Text(
                      _settingsController.appLanguage.strings['shared']
                          ['permissions']['locationIsOff'],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26, fontFamily: 'psr'),
                    ),
                  ),
                  SizedBox(
                    height: getSizeRelativeToScreen(10, Get.height, Get.width),
                  ),
                  Obx(
                    () => Text(
                      // "App can not work without Background Location Permission !",
                      _settingsController.appLanguage.strings['shared']
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
                    onTap: () async => await onGivePermissionBtnClick(),
                    child: Container(
                      height:
                          getSizeRelativeToScreen(25, Get.height, Get.width),
                      width:
                          getSizeRelativeToScreen(100, Get.height, Get.width),
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
                          _settingsController.appLanguage.strings['shared']
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
          )),
    );
  }

  Future<void> onGivePermissionBtnClick() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo =
          await DeviceInfoPlugin().androidInfo;
      int? sdkVersion = androidDeviceInfo.version.sdkInt;
      if (sdkVersion != null && sdkVersion >= 30) {
        YesNoDialogButton res = await yesNoDialog(
            body: _settingsController.appLanguage.strings['shared']
                ['permissions']['android_11'],
            text: "");

        if (res == YesNoDialogButton.Yes) {
          await openAppSettings();
        } else
          return;
      }
    }
    Location location = Location();
    bool _serviceEnabled = await location.requestService();
    // if Location Service is enabled!
    if (_serviceEnabled) {
      PermissionStatus _permissionStatus =
          await _locationController.requestLocationPermissions();
      mezDbgPrint(_permissionStatus);
      switch (_permissionStatus) {
        // on denied forever User must know cuz it needs manual change in IOS!!
        case PermissionStatus.deniedForever:
          MezSnackbar(
              'Error :(',
              _settingsController.appLanguage.strings['shared']['permissions']
                  ['locationPermissionDeniedForever'],
              position: SnackPosition.TOP);
          Future.delayed(Duration(seconds: 4), openAppSettings);
          break;

        // on granted !
        case PermissionStatus.granted:
          Get.back(closeOverlays: true);
          break;
        case PermissionStatus.grantedLimited:
          Get.back(closeOverlays: true);
          break;
        // Default
        default:
          MezSnackbar(
              'Error :(',
              _settingsController.appLanguage.strings['shared']['permissions']
                  ['locationPermissionDenied'],
              position: SnackPosition.TOP);
      }
    } else {
      MezSnackbar(
          'Error :(',
          _settingsController.appLanguage.strings['shared']['permissions']
              ['locationIsOff'],
          position: SnackPosition.TOP);
    }
  }
}
