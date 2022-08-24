import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
  AppType appType;
  ThemeController get appTheme => _appTheme;
  LanguageController get appLanguage => _appLanguage;
  SettingsController(this.appType, this.locationType,
      {this.sideMenuItems = const []});

  StreamSubscription<ConnectivityResult>? _internetConnectionStatusListener;

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

    // start Listening on Internet Connectivity !
    _internetConnectionStatusListener = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        if (await InternetConnectionChecker().hasConnection &&
            await lookUpCheck()) {
          if (isCurrentRoute(kNoInternetConnectionPage))
            Future<void>.delayed(
              Duration.zero,
              () => Get.back<void>(),
            );
        } else {
          if (!isCurrentRoute(kNoInternetConnectionPage)) {
            Future<void>.delayed(
              Duration.zero,
              () => Get.toNamed<void>(kNoInternetConnectionPage),
            );
          }
        }
      } else {
        if (!isCurrentRoute(kNoInternetConnectionPage)) {
          Future<void>.delayed(
            Duration.zero,
            () => Get.toNamed<void>(kNoInternetConnectionPage),
          );
        }
      }
    });

    // ConnectionStatusSingleton.getInstance().initialize();
    // ConnectionStatusSingleton.getInstance()
    //     .connectionChangeController
    //     .stream
    //     .listen((bool event) {
    //   mezDbgPrint("Chaaaaaanged network ===> isConnected : $event");

    //   if (event) {
    //     if (isCurrentRoute(kNoInternetConnectionPage))
    //       Future<void>.delayed(
    //         Duration.zero,
    //         () => Get.back<void>(),
    //       );
    //   } else {
    //     if (!isCurrentRoute(kNoInternetConnectionPage)) {
    //       Future<void>.delayed(
    //         Duration.zero,
    //         () => Get.toNamed<void>(kNoInternetConnectionPage),
    //       );
    //     }
    //   }
    // });
    super.onInit();
  }

  Future<bool> lookUpCheck() async {
    bool _doubleCheck = false;
    try {
      final dynamic result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _doubleCheck = true;
      }
    } on SocketException catch (_) {
      _doubleCheck = false;
    }
    mezDbgPrint("await lookUpCheck() ======> $_doubleCheck");
    return Future<bool>.value(_doubleCheck);
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

  // void _connectivityHandler(ConnectivityResult conResult) async {
  //   final ConnectivityResult _ch = await _connectivity.checkConnectivity();
  //   mezDbgPrint("Chaaaaaanged network connectivity $conResult | $_ch !");

  //   switch (_ch) {
  //     case ConnectivityResult.bluetooth:
  //     case ConnectivityResult.ethernet:
  //     case ConnectivityResult.mobile:
  //     case ConnectivityResult.wifi:
  //       if (isCurrentRoute(kNoInternetConnectionPage))
  //         Future<void>.delayed(
  //           Duration.zero,
  //           () => Get.back<void>(),
  //         );
  //       break;
  //     case ConnectivityResult.none:
  //       if (!isCurrentRoute(kNoInternetConnectionPage)) {
  //         Future<void>.delayed(
  //           Duration.zero,
  //           () => Get.toNamed<void>(kNoInternetConnectionPage),
  //         );
  //       }
  //       break;
  //     default:
  //   }
  // }

  @override
  void dispose() {
    // ConnectionStatusSingleton.getInstance().dispose();
    _internetConnectionStatusListener?.cancel();
    _appTheme.dispose();
    _appLanguage.dispose();
    super.dispose();
  }
}

class ConnectionStatusSingleton {
  //This creates the single instance by calling the `_internal` constructor specified below
  static final ConnectionStatusSingleton _singleton =
      new ConnectionStatusSingleton._internal();
  ConnectionStatusSingleton._internal();

  //This is what's used to retrieve the instance through the app
  static ConnectionStatusSingleton getInstance() => _singleton;

  //This tracks the current connection status
  bool hasConnection = false;

  //This is how we'll allow subscribing to connection changes
  StreamController<bool> connectionChangeController =
      new StreamController<bool>.broadcast();

  //flutter_connectivity
  final Connectivity _connectivity = Connectivity();

  //Hook into flutter_connectivity's Stream to listen for changes
  //And check the connection status out of the gate
  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    checkConnection();
  }

  Stream get connectionChange => connectionChangeController.stream;

  //A clean up method to close our StreamController
  //   Because this is meant to exist through the entire application life cycle this isn't
  //   really an issue
  void dispose() {
    connectionChangeController.close();
  }

  //flutter_connectivity's listener
  void _connectionChange(ConnectivityResult result) {
    checkConnection();
  }

  //The test to actually see if there is a connection
  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }

    //The connection status changed send out an update to all listeners
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }

    return hasConnection;
  }
}
