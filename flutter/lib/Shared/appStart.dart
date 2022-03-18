// WARNING : ===================

// DO NOT TOUCH OR IMPORT ANYTHING IN THIS MAIN PLEASE.

// =============================

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
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/appVersionController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/pages/SplashScreen.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:package_info/package_info.dart';
import 'package:sizer/sizer.dart' as Sizer;

final ThemeData _defaultAppTheme = ThemeData(
    primaryColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity);

class StartingPoint extends StatefulWidget {
  final AppType appType;
  final ThemeData? appTheme;
  final Function signInCallback;
  final Function signOutCallback;
  final List<GetPage<dynamic>> routes;
  final List<SideMenuItem>? sideMenuItems;
  final bool locationOn;

  ThemeData get appThemeGetter => appTheme ?? _defaultAppTheme;

  //  Sideminu
  const StartingPoint(
      {required this.appType,
      this.appTheme = null,
      required this.signInCallback,
      required this.signOutCallback,
      required this.routes,
      this.sideMenuItems,
      this.locationOn = true});

  @override
  _StartingPointState createState() => _StartingPointState();
}

class _StartingPointState extends State<StartingPoint> {
  bool _initialized = false;
  bool _error = false;

  _StartingPointState();

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    initializeSetup();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    if (_error) {
      MezSnackbar("Error", "Server connection failed !");
      return Sizer.Sizer(
          builder: (BuildContext context, Orientation orientation,
                  Sizer.DeviceType deviceType) =>
              GetMaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                  body: Center(
                    child: Icon(Icons.signal_wifi_bad,
                        color: Colors.red.shade200,
                        size:
                            getSizeRelativeToScreen(50, Get.height, Get.width)),
                  ),
                ),
              ));
    }
    if (!_initialized) {
      return Sizer.Sizer(
          builder: (BuildContext context, Orientation orientation,
                  Sizer.DeviceType deviceType) =>
              SplashScreen());
    } else {
      mezDbgPrint(
          "====> PreviewMode ===> ${GetStorage().read<String?>('previewMode')}");
      return Sizer.Sizer(
          builder: (BuildContext context, Orientation orientation,
                  Sizer.DeviceType deviceType) =>
              mainApp(
                  appType: widget.appType,
                  appTheme: widget.appThemeGetter,
                  routes: widget.routes));
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
    const String _launchMode =
        String.fromEnvironment('LMODE', defaultValue: "prod");
    mezDbgPrint('mode  -> $_launchMode');
    mezDbgPrint('host  -> $_host');

    final FirebaseApp _app = await Firebase.initializeApp();
    mezDbgPrint("[+] App Initialized under Name ${_app.name} .");
    late FirebaseDatabase firebaseDb;

    if (_launchMode == "prod") {
      firebaseDb = FirebaseDatabase(app: _app);
    } else if (_launchMode == "dev") {
      mezDbgPrint("DEV MODE");
      firebaseDb = FirebaseDatabase(app: _app, databaseURL: _host + dbRoot);
      await FirebaseDatabase.instance.setPersistenceEnabled(true);
      await FirebaseDatabase.instance.setPersistenceCacheSizeBytes(10000000);
      await FirebaseAuth.instance.useEmulator(_host + authPort);
      FirebaseFunctions.instance
          .useFunctionsEmulator(_host.replaceAll('http://', ''), functionPort);
    } else if (_launchMode == "stage") {
      mezDbgPrint("[+] Entered Staging check ----.");
      firebaseDb = FirebaseDatabase(app: _app, databaseURL: stagingDb);
    } else {
      throw Exception("Invalid Launch Mode");
    }

    Get.put(FirebaseDb(
        dbUrl: _host + dbRoot,
        firebaseDatabase: firebaseDb,
        firebaseApp: _app));
  }

  Future<void> setGlobalVariables() async {
    const String _launchMode =
        String.fromEnvironment('LMODE', defaultValue: "prod");
    if (await GetStorage.init()) {
      mezDbgPrint("[ GET STORAGE ] INITIALIZED !");
      await GetStorage().write(getxLmodeKey, _launchMode);
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
      await GetStorage().write(getxAppVersion, pInfos.version);
      await GetStorage().write(getxGmapBottomPaddingKey,
          Platform.isAndroid ? 38.0.sp : Get.height / 35);
    } else
      mezDbgPrint("[ GET STORAGE ] FAILED TO INITIALIZE !");
  }

  Future<void> putControllers() async {
    await Get.put<LanguageController>(LanguageController())
        .isLamgInitialized
        .stream
        .first;
    Get.put<AuthController>(
        AuthController(widget.signInCallback, widget.signOutCallback),
        permanent: true);
    Get.put<AppLifeCycleController>(AppLifeCycleController(logs: true),
        permanent: true);
    Get.put<SettingsController>(
        SettingsController(
            widget.appType, widget.sideMenuItems, widget.locationOn),
        permanent: true);

    Get.lazyPut(() => AppVersionController(), fenix: true);
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
            .write(getxPrivacyPolicyLink, tPrivacyPolicyCustomerApp);
        break;
      case AppType.TaxiApp:
        await GetStorage().write(getxPrivacyPolicyLink, tPrivacyPolicyTaxiApp);
        break;
      default:
        await GetStorage()
            .write(getxPrivacyPolicyLink, tPrivacyPolicyCustomerApp);
    }
  }

  Widget mainApp(
      {required AppType appType,
      required ThemeData appTheme,
      required List<GetPage<dynamic>> routes}) {
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
