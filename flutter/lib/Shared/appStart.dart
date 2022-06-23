// WARNING : ===================

// DO NOT TOUCH OR IMPORT ANYTHING IN THIS MAIN PLEASE.

// =============================

// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/rootNodes.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/pages/SplashScreen.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
// import 'package:package_info/package_info.dart';
//import 'package:package_info_plus/package_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sizer/sizer.dart' as Sizer;

final ThemeData _defaultAppTheme = ThemeData(
  primaryColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

class StartingPoint extends StatefulWidget {
  final AppType appType;
  final ThemeData? appTheme;
  final Function signInCallback;
  final Function signOutCallback;
  final List<GetPage<dynamic>> routes;
  final List<SideMenuItem>? sideMenuItems;
  final LocationPermissionType locationPermissionType;

  ThemeData get appThemeGetter => appTheme ?? _defaultAppTheme;

  //  Sideminu
  const StartingPoint({
    required this.appType,
    this.appTheme = null,
    required this.signInCallback,
    required this.signOutCallback,
    required this.routes,
    this.sideMenuItems,
    this.locationPermissionType = LocationPermissionType.Null,
  });

  @override
  _StartingPointState createState() => _StartingPointState();
}

class _StartingPointState extends State<StartingPoint> {
  _StartingPointState();
  late final AppLaunchMode _launchMode;

  /// _initialized
  bool _initialized = false;

  /// _error
  bool _error = false;

  @override
  void initState() {
    super.initState();

    WidgetsFlutterBinding.ensureInitialized();
    const String _tmpLmode =
        String.fromEnvironment('LMODE', defaultValue: "prod");
    _launchMode = _tmpLmode.toLaunchMode();

    /// initializeSetup
    initializeSetup();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    if (_error) {
      MezSnackbar("Error", "Server connection failed !");
      return Sizer.Sizer(
        builder: (
          BuildContext context,
          Orientation orientation,
          Sizer.DeviceType deviceType,
        ) =>
            GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Center(
              child: Icon(
                Icons.signal_wifi_bad,
                color: Colors.red.shade200,
                size: getSizeRelativeToScreen(50, Get.height, Get.width),
              ),
            ),
          ),
        ),
      );
    }
    if (!_initialized) {
      return Sizer.Sizer(
        builder: (BuildContext context, Orientation orientation,
                Sizer.DeviceType deviceType) =>
            SplashScreen(),
      );
    } else {
      mezDbgPrint(
        "====> PreviewMode ===> ${GetStorage().read<bool?>('previewMode')}",
      );
      return Sizer.Sizer(
        builder: (
          BuildContext context,
          Orientation orientation,
          Sizer.DeviceType deviceType,
        ) =>
            mainApp(
          appType: widget.appType,
          appTheme: widget.appThemeGetter,
          routes: widget.routes,
        ),
      );
    }
  }

  Future<void> initializeSetup() async {
    try {
      await setupFirebase();
      mezDbgPrint("Done : setupFirebase");
      await setGlobalVariables();
      mezDbgPrint("Done : setGlobalVariables");

      await putControllers();
      mezDbgPrint("Done : putControllers");

      await waitForInitialization();
      mezDbgPrint("Done : waitForInitialization");

      hookOnFlutterErrorsStdout();
      mezDbgPrint("Done : hookOnFlutterErrorsStdout");

      setState(() => _initialized = true);
      mezDbgPrint("_initialized Set to : $_initialized");
    } catch (e) {
      mezDbgPrint("[+] Error Happend =======> $e");
      setState(() {
        _error = true;
      });
      rethrow;
    }
  }

  Future<void> setupFirebase() async {
    const String _host =
        String.fromEnvironment('HOST', defaultValue: "http://127.0.0.1");
    // final AppLaunchMode _launchMode =
    //     String.fromEnvironment('LMODE', defaultValue: "prod").toLaunchMode();
    mezDbgPrint('mode  -> $_launchMode');
    mezDbgPrint('host  -> $_host');

    final FirebaseApp _app = await Firebase.initializeApp();
    mezDbgPrint("[+] App Initialized under Name ${_app.name} .");
    late FirebaseDatabase firebaseDb;

    if (_launchMode == AppLaunchMode.prod) {
      firebaseDb = FirebaseDatabase.instanceFor(app: _app);
    } else if (_launchMode == AppLaunchMode.dev) {
      mezDbgPrint("DEV MODE");
      firebaseDb =
          FirebaseDatabase.instanceFor(app: _app, databaseURL: _host + dbRoot);
      firebaseDb.setPersistenceEnabled(true);
      firebaseDb.setPersistenceCacheSizeBytes(10000000);
      await FirebaseAuth.instance.useEmulator(_host + authPort);
      FirebaseFunctions.instance
          .useFunctionsEmulator(_host.replaceAll('http://', ''), functionPort);
    } else if (_launchMode == AppLaunchMode.stage) {
      mezDbgPrint("[+] Entered Staging check ----.");
      firebaseDb = FirebaseDatabase(app: _app, databaseURL: stagingDb);
    } else {
      throw Exception("Invalid Launch Mode");
    }

    Get.put(
      FirebaseDb(
        dbUrl: _host + dbRoot,
        firebaseDatabase: firebaseDb,
        firebaseApp: _app,
      ),
    );
  }

  Future<void> setGlobalVariables() async {
    if (await GetStorage.init()) {
      mezDbgPrint("[ GET STORAGE ] INITIALIZED !");
      await GetStorage().write(getxLmodeKey, _launchMode.toShortString());
      // previewMode
      const bool _isPreviewMode = bool.hasEnvironment('PREVIEW');
      await GetStorage().write('previewMode', _isPreviewMode);
      mezDbgPrint('previewMode  -> $_isPreviewMode');
      mezDbgPrint(
          "previewModeString  -> ${String.fromEnvironment('PREVIEW', defaultValue: 'NONE')}");

      // Get the VersionNumber
      final PackageInfo pInfos = await PackageInfo.fromPlatform();
      mezDbgPrint("[ GET STORAGE ] version number ${pInfos.version}");
      await GetStorage().write(getxPackageName, pInfos.packageName);
      await GetStorage().write(getxAppName, pInfos.appName);
      // We need appStoreId only in prod mode and ios platforms.
      if (Platform.isIOS && _launchMode == AppLaunchMode.prod) {
        await setupIosAppStoreId(pInfos.appName);
      }
      await GetStorage().write(getxAppVersion, pInfos.version);
      await GetStorage().write(
        getxGmapBottomPaddingKey,
        // Platform.isAndroid ? 38.0.sp : Get.height / 35,
        10.0,
      );
    } else
      mezDbgPrint("[ GET STORAGE ] FAILED TO INITIALIZE !");
  }

  Future<void> putControllers() async {
    final bool? isPreviewModeEnabled = GetStorage().read<bool?>('previewMode');
    final LanguageController lc =
        Get.put<LanguageController>(LanguageController());
    await lc.isLamgInitialized.stream.first;
    if (isPreviewModeEnabled == false) {
      await initializeDateFormatting(lc.userLanguageKey.name.toLowerCase());
    }
    Get.put<AuthController>(
      AuthController(widget.signInCallback, widget.signOutCallback),
      permanent: true,
    );
    Get.put<AppLifeCycleController>(
      AppLifeCycleController(logs: true),
      permanent: true,
    );
    Get.put<SettingsController>(
      SettingsController(widget.appType, widget.locationPermissionType,
          sideMenuItems: widget.sideMenuItems ?? []),
      permanent: true,
    );
  }

  Future<void> waitForInitialization() async {
    await Get.find<AuthController>().authStateStream.first;
    return;
  }

  void hookOnFlutterErrorsStdout() {
    FlutterError.onError = (FlutterErrorDetails details) {
      for (String item in details.toString().split('\n')) {
        mezDbgPrint(item);
      }
    };
  }

  Future<void> setRightPrivacyPolicyLink(AppType type) async {
    switch (type) {
      case AppType.CustomerApp:
        await GetStorage()
            .write(getxPrivacyPolicyLink, sPrivacyPolicyCustomerApp);
        break;
      case AppType.TaxiApp:
        await GetStorage().write(getxPrivacyPolicyLink, sPrivacyPolicyTaxiApp);
        break;
      default:
        await GetStorage()
            .write(getxPrivacyPolicyLink, sPrivacyPolicyCustomerApp);
    }
  }

  Future<void> setupIosAppStoreId(String appName) async {
    final String? res = (await Get.find<FirebaseDb>()
            .firebaseDatabase
            .ref()
            .child(appStoreIdNode(appName))
            .once())
        .snapshot
        .value
        .toString();
    mezDbgPrint("Got setupIosAppStoreId @ ==> $res");
    await GetStorage().write(getxAppStoreId, res ?? "");
  }

  Widget mainApp({
    required AppType appType,
    required ThemeData appTheme,
    required List<GetPage<dynamic>> routes,
  }) {
    Future<void> _initializeConfig() async {
      // We will use this to Initialize anything at MaterialApp root init of app
      final BitmapDescriptor desc = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(), 'assets/images/shared/purpleCircle.png');

      await GetStorage().write('markerCircle', desc);
      await setRightPrivacyPolicyLink(appType);
      print("[+] InitializedConfig -- the ${appType.toShortString()} !");
    }

    final bool? isPreviewModeEnabled = GetStorage().read<bool?>('previewMode');

    return DevicePreview(
      enabled: isPreviewModeEnabled == true ? true : false,
      builder: (BuildContext context) => GetMaterialApp(
        useInheritedMediaQuery: true,
        locale:
            isPreviewModeEnabled == true ? DevicePreview.locale(context) : null,
        builder: isPreviewModeEnabled == true ? DevicePreview.appBuilder : null,
        debugShowCheckedModeBanner: false,
        onInit: () async => _initializeConfig(),
        title: appType.toShortString(),
        theme: appTheme,
        color: Colors.white,
        enableLog: true,
        getPages: routes,
        initialRoute: kWrapperRoute,
      ),
    );
  }
}
