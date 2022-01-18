import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/controllers/themeContoller.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:soundpool/soundpool.dart';

class LocationController extends GetxController {
  StreamController<bool> _hasLocationPermissionStreamController =
      StreamController<bool>.broadcast(sync: false);

  Stream<bool> get locationPermissionStream =>
      _hasLocationPermissionStreamController.stream;
  Timer? _locationListenerTimer;

  @override
  void onInit() async {
    super.onInit();
    startPeriodicLocationPermissionsListener();
  }

  void startPeriodicLocationPermissionsListener() {
    _locationListenerTimer =
        Timer.periodic(Duration(milliseconds: 500), (Timer t) async {
      _locationListenerTimer?.cancel();
      _locationListenerTimer = null;
      bool locationPermission = await _getLocationPermission();
      if (!locationPermission && Get.currentRoute != kLocationPermissionPage) {
        PermissionStatus _status = await Location().requestPermission();
        if (_status != PermissionStatus.granted) {
          Future.delayed(Duration.zero, () {
            Get.toNamed(kLocationPermissionPage);
          });
        }
      }
      _hasLocationPermissionStreamController.add(locationPermission);
      startPeriodicLocationPermissionsListener();
    });
  }

  Future<bool> _getLocationPermission() async {
    bool serviceEnabled = await Location().serviceEnabled();
    if (!serviceEnabled) return false;
    PermissionStatus _tempLoca = await Location().hasPermission();

    return _tempLoca == PermissionStatus.granted;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
