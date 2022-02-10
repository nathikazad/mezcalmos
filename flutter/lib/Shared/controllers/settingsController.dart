import 'dart:async';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/controllers/themeContoller.dart';
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
  bool locationOn = true;
  AppType appType;
  ThemeController get appTheme => _appTheme;
  LanguageController get appLanguage => _appLanguage;
  SettingsController(this.appType, this.sideMenuItems, this.locationOn);
  StreamSubscription<InternetConnectionStatus>?
      _internetConnectionStatusListener;

  @override
  void onInit() async {
    super.onInit();

    if (this.locationOn) {
      Get.put(LocationController(), permanent: true);
    }
    // here --------
    // FOR NOW WE SET IT TO EN (default  if not passed to LangController)
    _appTheme = Get.put(ThemeController(), permanent: true);
    _appLanguage = Get.put(LanguageController(), permanent: true);
    Get.put(SideMenuDrawerController(), permanent: false).sideMenuItems =
        this.sideMenuItems;

    if (GetStorage().read('notifSound') != null) {
      // if it's not null then the user already specified a path to the Notification SOund (cached),
      // which we will use it here.
    } else {
      ByteData _soundData = await rootBundle.load(aDefaultNotificationsSound);
      _selectedNotificationsSoundId =
          await _userNotificationsSoundPool.load(_soundData);
    }
    // start Listening on Internet Connectivity !
    startListeningForConnectivity();
  }

  Future playNotificationSound({int? soundId}) async {
    if (_selectedNotificationsSoundId != null)
      await _userNotificationsSoundPool.play(_selectedNotificationsSoundId!);
  }

  void startListeningForConnectivity() {
    // actively listen for status updates
    _internetConnectionStatusListener =
        InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        if (status == InternetConnectionStatus.disconnected &&
            Get.currentRoute != kNoInternetConnectionPage) {
          Future.delayed(Duration.zero, () {
            Get.toNamed(kNoInternetConnectionPage);
          });
        } else {
          if (Get.currentRoute == kNoInternetConnectionPage) {
            Future.delayed(Duration.zero, () {
              Get.back();
            });
          }
        }
      },
    );
  }

  @override
  void dispose() {
    _appTheme.dispose();
    _appLanguage.dispose();
    super.dispose();
  }
}
