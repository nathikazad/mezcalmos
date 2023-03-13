// WARNING : ===================

// DO NOT TOUCH OR IMPORT ANYTHING IN THIS MAIN PLEASE.
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/appStart/appStartBase.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/agoraController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/env.dart';

final ThemeData _defaultAppTheme = ThemeData(
  primaryColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

class StartingPointNative extends StartingPointBase {
  //  Sideminu
  StartingPointNative({
    super.appTheme = null,
    required super.signInCallback,
    required super.signOutCallback,
    required super.routes,
    required super.appType,
    super.sideMenuItems,
    super.locationPermissionType = LocationPermissionType.None,
  });

  @override
  _StartingPointState createState() => _StartingPointState();
}

class _StartingPointState extends StartingPointBaseState {
  _StartingPointState();

  @override
  Future<void> setGlobalsAndLocalStorage() {
    super.setGlobalsAndLocalStorage();
    return PlatformOSHelper.setAppInfoGlobals();
  }

  @override
  void initializeThirdParties() {
    super.initializeThirdParties();
    Stripe.publishableKey = MezEnv.appLaunchMode == AppLaunchMode.prod
        ? stripePubProdKey
        : stripePubTestKey;
    Stripe.instance.applySettings();
    Get.put<Sagora>(Sagora(), permanent: true);
    mezDbgPrint("AppStart Native initalized 😛😛😛😛😛");
  }
}
