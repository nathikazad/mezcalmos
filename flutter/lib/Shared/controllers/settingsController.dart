import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
  RxBool internetCheckerOn = true.obs;
  // for testing purposes
  void switchInternetChecker() =>
      internetCheckerOn.value = !internetCheckerOn.value;

  Soundpool _userNotificationsSoundPool = Soundpool.fromOptions(
      options: SoundpoolOptions(streamType: StreamType.notification));
  int? _selectedNotificationsSoundId;
  // CALLS RINGTONES
  Soundpool _userCallingSoundPool = Soundpool.fromOptions(
      options: SoundpoolOptions(streamType: StreamType.music));

  int? _selectedCallingSoundId;

  final List<SideMenuItem> sideMenuItems;
  final LocationPermissionType locationType;
  AppType appType;
  ThemeController get appTheme => _appTheme;
  LanguageController get appLanguage => _appLanguage;
  SettingsController(this.appType, this.locationType,
      {this.sideMenuItems = const []});

  StreamSubscription<bool>? internetCheckerStream;

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

    final ByteData _soundDataNotif =
        await rootBundle.load(aDefaultNotificationsSound);
    _selectedNotificationsSoundId =
        await _userNotificationsSoundPool.load(_soundDataNotif);
    // CALL SOUND SETUP
    final ByteData _soundDataCall = await rootBundle.load(aDefaultCallingSound);
    _selectedCallingSoundId = await _userCallingSoundPool.load(_soundDataCall);

    internetCheckerStream = checkConnectionStream().listen((bool isInternetOn) {
      if (internetCheckerOn.value) {
        // if No internet
        if (!isInternetOn) {
          if (!isCurrentRoute(kNoInternetConnectionPage)) {
            mezDbgPrint("pushiiiiing => kNoInternetConnectionPage ");
            Future<void>.delayed(
              Duration.zero,
              () => Get.toNamed<void>(kNoInternetConnectionPage),
            );
          }
        } else {
          mezDbgPrint("popping => kNoInternetConnectionPage ");

          if (isCurrentRoute(kNoInternetConnectionPage)) {
            Future<void>.delayed(
              Duration.zero,
              () => Get.back<void>(),
            );
          }
        }
      }
    });

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

  Stream<bool> checkConnectionStream() async* {
    yield* Stream<Future<bool>>.periodic(Duration(milliseconds: 500), (_) {
      return _lookupGoogle();
    }).asyncMap((Future<bool> future) async => await future);
  }

  /// this basically do a DNS look up on google.com if results are None this means that there's no active connection
  Future<bool> _lookupGoogle() async {
    bool _hasInternet = false;
    try {
      final List<InternetAddress> _pong =
          await InternetAddress.lookup('google.com');
      if (_pong.isNotEmpty && _pong[0].rawAddress.isNotEmpty) {
        mezDbgPrint('😁 VALID INTERNET CONNECTION!');

        _hasInternet = true;
      }
    } on SocketException catch (_) {
      mezDbgPrint('🫥 NO INTERNET CONNECTION!');
    }

    return Future<bool>.value(_hasInternet);
  }

  @override
  void dispose() {
    _appTheme.dispose();
    _appLanguage.dispose();
    internetCheckerStream?.cancel();
    internetCheckerStream = null;
    super.dispose();
  }
}
