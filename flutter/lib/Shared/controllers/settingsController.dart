import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/controllers/themeContoller.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:soundpool/soundpool.dart';

class SettingsController extends GetxController {
  late final ThemeController _appTheme;
  late final LanguageController _appLanguage;

  // NOTIFICATION RINGTONES
  // this will be customized by the user in future.
  Soundpool _userNotificationsSoundPool = Soundpool.fromOptions(
      options: SoundpoolOptions(streamType: StreamType.notification));
  int? _selectedNotificationsSoundId;
  // CALLS RINGTONES
  Soundpool _userCallingSoundPool = Soundpool.fromOptions(
      options: SoundpoolOptions(streamType: StreamType.notification));

  int? _selectedCallingSoundId;

  final List<SideMenuItem> sideMenuItems;
  final LocationPermissionType locationType;
  AppType appType;
  ThemeController get appTheme => _appTheme;
  LanguageController get appLanguage => _appLanguage;
  SettingsController(this.appType, this.locationType,
      {this.sideMenuItems = const []});
  StreamSubscription<InternetConnectionStatus>?
      _internetConnectionStatusListener;

  @override
  Future<void> onInit() async {
    Get.put(LocationController(locationType: locationType), permanent: true);
    // here --------
    // FOR NOW WE SET IT TO EN (default  if not passed to LangController)
    _appTheme = Get.put(ThemeController(), permanent: true);
    _appLanguage = Get.put(LanguageController(), permanent: true);
    Get.put(SideMenuDrawerController(), permanent: false).sideMenuItems =
        sideMenuItems;

    // NOTIFICATION SOUND SETUP
    if (GetStorage().read('notifSound') != null) {
      // if it's not null then the user already specified a path to the Notification SOund (cached),
      // which we will use it here.
    } else {
      final ByteData _soundData =
          await rootBundle.load(aDefaultNotificationsSound);
      _selectedNotificationsSoundId =
          await _userNotificationsSoundPool.load(_soundData);
    }
    // CALL SOUND SETUP
    final ByteData _soundData = await rootBundle.load(aDefaultCallingSound);
    mezDbgPrint(
      "[👨🏻][👨🏻][👨🏻][👨🏻][👨🏻][👨🏻][👨🏻][👨🏻][👨🏻] CALLING SOUND DATA =====> $_soundData",
    );
    _selectedCallingSoundId = await _userCallingSoundPool.load(_soundData);
    mezDbgPrint(
      "[👨🏻][👨🏻][👨🏻][👨🏻][👨🏻][👨🏻][👨🏻][👨🏻][👨🏻] _selectedCallingSoundId =====> $_selectedCallingSoundId",
    );

    // start Listening on Internet Connectivity !
    // startListeningForConnectivity();
    super.onInit();
  }

  Future playNotificationSound({int? soundId}) async {
    if (_selectedNotificationsSoundId != null)
      await _userNotificationsSoundPool.play(_selectedNotificationsSoundId!);
  }

  /// This returns [StreamId], Useful it in case you play it repeatedly through param: [autoRepeat=false],
  ///
  /// that way you can call [stopCallingRingtone] using that streamID.
  Future<int?> playCallingRingtone({bool autoRepeat = false}) async {
    mezDbgPrint("CallinfSoundId =---> #$_selectedCallingSoundId");
    if (_selectedCallingSoundId != null) {
      return _userCallingSoundPool.play(
        _selectedCallingSoundId!,
        repeat: autoRepeat ? 1 : 0,
      );
    }
    return Future<int?>.value(null);
  }

  Future<void> stopCallingRingtone({required int? streamId}) async {
    if (streamId != null) await _userCallingSoundPool.stop(streamId);
  }

  void startListeningForConnectivity() {
    // actively listen for status updates
    _internetConnectionStatusListener =
        InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        if (status == InternetConnectionStatus.disconnected &&
            !isCurrentRoute(kNoInternetConnectionPage)) {
          Future.delayed(Duration.zero, () {
            Get.toNamed(kNoInternetConnectionPage);
          });
        } else {
          if (isCurrentRoute(kNoInternetConnectionPage)) {
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
    _internetConnectionStatusListener?.cancel();
    _appTheme.dispose();
    _appLanguage.dispose();
    super.dispose();
  }
}
