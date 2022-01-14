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

class SettingsController extends GetxController {
  late final ThemeController _appTheme;
  late final LanguageController _appLanguage;
  // this will be customized by the user in future.
  Soundpool _userNotificationsSoundPool = Soundpool.fromOptions(
      options: SoundpoolOptions(streamType: StreamType.notification));
  int? _selectedNotificationsSoundId;

  final List<SideMenuItem>? sideMenuItems;

  AppType appType;
  ThemeController get appTheme => _appTheme;
  LanguageController get appLanguage => _appLanguage;

  StreamController<bool> _hasLocationPermissionStreamController =
      StreamController<bool>.broadcast(sync: false);

  Stream<bool> get locationPermissionStream =>
      _hasLocationPermissionStreamController.stream;

  SettingsController(this.appType, this.sideMenuItems);
  Timer? _locationListenerTimer;

  @override
  void onInit() async {
    super.onInit();
    // here --------
    // FOR NOW WE SET IT TO EN (default  if not passed to LangController)
    _appTheme = Get.put(ThemeController(), permanent: true);
    _appLanguage = Get.put(LanguageController(), permanent: true);
    Get.put(SideMenuDrawerController(), permanent: false).sideMenuItems =
        this.sideMenuItems;

    startPeriodicLocationPermissionsListener();

    if (GetStorage().read('notifSound') != null) {
      // if it's not null then the user already specified a path to the Notification SOund (cached),
      // which we will use it here.
    } else {
      ByteData _soundData = await rootBundle.load(aDefaultNotificationsSound);
      _selectedNotificationsSoundId =
          await _userNotificationsSoundPool.load(_soundData);
    }
  }

  Future playNotificationSound({int? soundId}) async {
    if (_selectedNotificationsSoundId != null)
      await _userNotificationsSoundPool.play(_selectedNotificationsSoundId!);
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
    _appTheme.dispose();
    _appLanguage.dispose();
    super.dispose();
  }
}
