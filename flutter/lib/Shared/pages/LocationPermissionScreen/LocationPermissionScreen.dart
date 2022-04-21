import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/pages/LocationPermissionScreen/controller/LocationPermissionController.dart';
import 'package:mezcalmos/Shared/pages/LocationPermissionScreen/widgets/LocationPermissionsWidgets.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/ThreeDotsLoading.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ['LocationPermissionScreen'];

class LocationPermissionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LocationPermissionScreenState();
  }
}

class _LocationPermissionScreenState extends State<LocationPermissionScreen> {
  final LocationPermissionController viewController =
      LocationPermissionController();

  late final LocationPermissionWidgets viewWidgets;
  @override
  void initState() {
    viewWidgets = LocationPermissionWidgets(viewController: viewController);
    viewController.init(
      onLocationPermissionsStatusChange: _onLocationPermissionsChange,
      initialAndroidBodyTextSetter: _updateAndroidPermissionAskingText,
      initialIosBodyTextSetter: _updateIosPermissionAskingText,
    );
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();

    super.dispose();
  }

  void _onLocationPermissionsChange(LocationPermissionsStatus? status) {
    switch (status) {
      case LocationPermissionsStatus.Denied:
        viewController
            .setErrorText(() => _i18n()["locationPermissionStatus"]["denied"]);
        break;
      case LocationPermissionsStatus.BackgroundAccessDenied:
        viewController.setErrorText(() =>
            _i18n()["locationPermissionStatus"]["backgroundAccessDenied"]);
        break;
      case LocationPermissionsStatus.ForeeverDenied:
        viewController.setErrorText(
            () => _i18n()["locationPermissionStatus"]["foreverDenied"]);
        break;
      case LocationPermissionsStatus.ServiceOff:
        viewController.setErrorText(
            () => _i18n()["locationPermissionStatus"]["serviceOff"]);
        break;
      case LocationPermissionsStatus.Ok:
        viewController.setErrorText(null);
        break;
      default:
        viewController.setErrorText(null);
        break;
    }
  }

  void _updateIosPermissionAskingText() {
    if (viewController.locationController.locationType ==
        LocationPermissionType.Foreground) {
      viewController.setAskPermissionsTextRefrence(
          () => _i18n()['locationPermissionText']['ios']['foreground']);
    } else {
      viewController.setAskPermissionsTextRefrence(
        () => _i18n()['locationPermissionText']['ios']['background'],
      );
    }
  }

  void _updateAndroidPermissionAskingText() {
    // This is a better scallable way to handle permissions in future,
    // in case there is location permissions related os changes
    if (viewController.adnroidSdkVersion != null) {
      if (viewController.adnroidSdkVersion! <= 28) {
        // Android 9 (api 28) or less
        if (viewController.locationController.locationType ==
            LocationPermissionType.Foreground) {
          viewController.setAskPermissionsTextRefrence(
            () => _i18n()['locationPermissionText']['android']['foreground']
                ['android9'],
          );
        } else
          viewController.setAskPermissionsTextRefrence(
            () => _i18n()['locationPermissionText']['android']['background']
                ['android9'],
          );
        return;
      } else if (viewController.adnroidSdkVersion == 29) {
        // Android 10 - api 29
        if (viewController.locationController.locationType ==
            LocationPermissionType.Foreground) {
          viewController.setAskPermissionsTextRefrence(
            () => _i18n()['locationPermissionText']['android']['foreground']
                ['android10'],
          );
        } else
          viewController.setAskPermissionsTextRefrence(
            () => _i18n()['locationPermissionText']['android']['background']
                ['android10'],
          );

        return;
      }
    }
    // Android 11 - api 30 or more - is Default.
    if (viewController.locationController.locationType ==
        LocationPermissionType.Foreground) {
      viewController.setAskPermissionsTextRefrence(
        () => _i18n()['locationPermissionText']['android']['foreground']
            ['android11'],
      );
    } else
      viewController.setAskPermissionsTextRefrence(
        () => _i18n()['locationPermissionText']['android']['foreground']
            ['android11'],
      );
  }

// TODO :  MAKE BUTTON TEXT DEPENDING ON STATUS
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: mezcalmosAppBar(AppBarLeftButtonType.Menu),
        resizeToAvoidBottomInset: false,
        key: Get.find<SideMenuDrawerController>().getNewKey(),
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
              children: <Widget>[
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
                Obx(
                  () => Text(
                    _i18n()['locationIsOff'],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontFamily: 'psr'),
                  ),
                ),
                SizedBox(
                  height: getSizeRelativeToScreen(10, Get.height, Get.width),
                ),
                Obx(() => viewController.errorText != null
                    ? Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(
                              viewController.errorText!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'psr',
                                color: Colors.red.shade300,
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox()),
                SizedBox(
                  height: getSizeRelativeToScreen(10, Get.height, Get.width),
                ),
                Obx(
                  () => viewController.askPermissionsText != null
                      ? Text(
                          viewController.askPermissionsText!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'psb',
                            color: Colors.grey.shade400,
                          ),
                        )
                      : Container(
                          height: 20,
                          width: Get.width,
                          child: ThreeDotsLoading(),
                        ),
                ),
                SizedBox(
                  height: getSizeRelativeToScreen(25, Get.height, Get.width),
                ),
                GestureDetector(
                  onTap: viewController.onGivePermissionsClick,
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
                        _i18n()['permissionBtn'],
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
      ),
    );
  }
}
