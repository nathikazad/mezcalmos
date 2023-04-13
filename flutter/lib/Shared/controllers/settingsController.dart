import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_api_availability/google_api_availability.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/controllers/themeContoller.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:soundpool/soundpool.dart';

class SettingsController extends GetxController {
  late final ThemeController _appTheme;
  late final LanguageController _appLanguage;

  // final Connectivity _connectivity = Connectivity();
  // NOTIFICATION RINGTONES
  // this will be customized by the user in future.
  Soundpool _userNotificationsSoundPool = Soundpool.fromOptions(
      options: SoundpoolOptions(streamType: StreamType.notification));
  int? _selectedNotificationsSoundId;

  // CALLS RINGTONES
  Soundpool _userCallingSoundPool = Soundpool.fromOptions(
      options: SoundpoolOptions(streamType: StreamType.music));

  int? _selectedCallingSoundId;

  final List<SideMenuItem> sideMenuItems;
  final LocationPermissionType locationType;

  ThemeController get appTheme => _appTheme;

  LanguageController get appLanguage => _appLanguage;

  SettingsController(this.locationType, {this.sideMenuItems = const []});
  bool _isGooglePlayServiceAvailable = true;
  bool get isGooglePlayServiceAvailable => _isGooglePlayServiceAvailable;

  @override
  Future<void> onInit() async {
    Get.put(LocationController(locationType: locationType), permanent: true);
    try {
      GooglePlayServicesAvailability res = await GoogleApiAvailability.instance
          .checkGooglePlayServicesAvailability();
      _isGooglePlayServiceAvailable =
          res == GooglePlayServicesAvailability.success;
    } catch (e) {
      mezDbgPrint("Google Play Services not available");
      _isGooglePlayServiceAvailable = false;
    }

    // here --------
    // FOR NOW WE SET IT TO EN (default  if not passed to LangController)
    _appTheme = Get.put(ThemeController(), permanent: true);
    _appLanguage = Get.put(LanguageController(), permanent: true);
    Get.put(SideMenuDrawerController(), permanent: false).sideMenuItems =
        sideMenuItems;

    // NOTIFICATION SOUND SETUP

    final ByteData _soundDataNotif =
        await rootBundle.load(aDefaultNotificationsSound);
    _selectedNotificationsSoundId =
        await _userNotificationsSoundPool.load(_soundDataNotif);
    // CALL SOUND SETUP
    final ByteData _soundDataCall = await rootBundle.load(aDefaultCallingSound);
    _selectedCallingSoundId = await _userCallingSoundPool.load(_soundDataCall);

    super.onInit();
  }

  Future<void> playNotificationSound({int? soundId}) async {
    if (_selectedNotificationsSoundId != null)
      await _userNotificationsSoundPool.play(_selectedNotificationsSoundId!);
  }

  /// This returns [StreamId], Useful it in case you play it repeatedly through param: [autoRepeat=false],
  ///
  /// that way you can call [stopCallingRingtone] using that streamID.
  Future<int?> playCallingRingtone({bool autoRepeat = false}) async {
    if (_selectedCallingSoundId != null) {
      return _userCallingSoundPool.play(
        _selectedCallingSoundId!,
        repeat: autoRepeat ? 100 : 0,
      );
    }
    return Future<int?>.value(null);
  }

  Future<void> stopCallingRingtone({required int? streamId}) async {
    if (streamId != null) await _userCallingSoundPool.stop(streamId);
  }

  @override
  void dispose() {
    _appTheme.dispose();
    _appLanguage.dispose();
    super.dispose();
  }
}
