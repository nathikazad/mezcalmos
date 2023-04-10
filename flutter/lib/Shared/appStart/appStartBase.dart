// WARNING : ===================

// DO NOT TOUCH OR IMPORT ANYTHING IN THIS MAIN PLEASE.

// =============================

// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
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
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/helpers/ConnectivityHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/pages/SplashScreen.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/env.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart' as Sizer;

final ThemeData _defaultAppTheme = ThemeData(
  primaryColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

AppType _appType = AppType.Customer;
AppType get appType => _appType;

abstract class StartingPointBase extends StatefulWidget {
  final ThemeData? appTheme;
  final Function signInCallback;
  final Function signOutCallback;
  final List<QRoute> routes;
  final List<SideMenuItem>? sideMenuItems;
  final LocationPermissionType locationPermissionType;
  final AppType appType;
  final bool stripeEnabled;

  ThemeData get appThemeGetter => appTheme ?? _defaultAppTheme;

  //  Sideminu
  StartingPointBase(
      {this.appTheme = null,
      required this.signInCallback,
      required this.signOutCallback,
      required this.routes,
      required this.appType,
      this.sideMenuItems,
      this.locationPermissionType = LocationPermissionType.None,
      this.stripeEnabled = false}) {
    MezEnv.setAppType(appType);
  }

  @override
  StartingPointBaseState createState() => StartingPointBaseState();
}

class StartingPointBaseState extends State<StartingPointBase> {
  /// _initialized
  bool _initialized = false;

  /// _error
  bool _error = false;
  late AppLaunchMode _launchMode;
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    const String _tmpLmode =
        String.fromEnvironment('LMODE', defaultValue: "stage");
    _launchMode = _tmpLmode.toLaunchMode();

    /// initializeSetup
    initializeSetup();
    ConnectivityHelper.instance.startCheckingInternet();
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
        "====> MezEnv.previewMode ===> ${MezEnv.previewMode}",
      );
      return Sizer.Sizer(
        builder: (
          BuildContext context,
          Orientation orientation,
          Sizer.DeviceType deviceType,
        ) =>
            mainApp(
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
      await setGlobalsAndLocalStorage();
      mezDbgPrint("Done : setGlobalVariables");

      await putControllers();
      mezDbgPrint("Done : putControllers");

      await waitForInitialization();
      mezDbgPrint("Done : waitForInitialization");

      hookOnFlutterErrorsStdout();
      mezDbgPrint("Done : hookOnFlutterErrorsStdout");

      initializeThirdParties();

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

  Future<FirebaseApp> getFirebase() {
    return Firebase.initializeApp();
  }

  Future<void> setupFirebase() async {
    mezDbgPrint('mode  -> ${MezEnv.appLaunchMode}');
    mezDbgPrint('host  -> ${MezEnv.host}');

    final FirebaseApp _app = await getFirebase();
    mezDbgPrint("[+] App Initialized under Name ${_app.name} .");
    late FirebaseDatabase firebaseDb;

    if (MezEnv.appLaunchMode == AppLaunchMode.prod) {
      firebaseDb = FirebaseDatabase.instanceFor(app: _app);
    } else if (MezEnv.appLaunchMode == AppLaunchMode.dev) {
      mezDbgPrint("DEV MODE");
      firebaseDb = FirebaseDatabase.instanceFor(
          app: _app, databaseURL: MezEnv.host + dbRoot);
      firebaseDb.setPersistenceEnabled(true);
      firebaseDb.setPersistenceCacheSizeBytes(10000000);
      await FirebaseAuth.instance.useEmulator(MezEnv.host + authPort);
      mezDbgPrint(
          "[+] Cloud Functions - dev - endpoint::${MezEnv.host.replaceAll('http://', '')}:$functionPort");
      FirebaseFunctions.instance.useFunctionsEmulator(
          MezEnv.host.replaceAll('http://', ''), functionPort);
    } else if (MezEnv.appLaunchMode == AppLaunchMode.stage) {
      mezDbgPrint("[+] Entered Staging check ----");
      firebaseDb =
          FirebaseDatabase.instanceFor(app: _app, databaseURL: stagingDb);
    } else {
      throw Exception("Invalid Launch Mode");
    }

    Get.put(
      FirebaseDb(
        dbUrl: MezEnv.host + dbRoot,
        firebaseDatabase: firebaseDb,
        firebaseApp: _app,
      ),
    );

    Get.put<AppLifeCycleController>(
      AppLifeCycleController(),
      permanent: true,
    );

    Get.put(HasuraDb(), permanent: true);
  }

  Future<void> setGlobalsAndLocalStorage() async {
    await GetStorage.init();
  }

  Future<void> putControllers() async {
    final LanguageController lc =
        Get.put<LanguageController>(LanguageController());
    await lc.isLamgInitialized.stream.first;
    if (MezEnv.previewMode == false) {
      await initializeDateFormatting(lc.userLanguageKey.name.toLowerCase());
    }
    Get.put<AuthController>(
      AuthController(widget.signInCallback, widget.signOutCallback),
      permanent: true,
    );
    Get.put<SettingsController>(
      SettingsController(widget.locationPermissionType,
          sideMenuItems: widget.sideMenuItems ?? []),
      permanent: true,
    );
  }

  Future<void> waitForInitialization() async {
    await Get.find<AuthController>().authStateStream.first;
    return;
  }

  void initializeThirdParties() {}

  void hookOnFlutterErrorsStdout() {
    FlutterError.onError = (FlutterErrorDetails details) {
      final List<String> _crashString = [];
      for (String item in details.toString().split('\n')) {
        _crashString.add(item);
        mezDbgPrint(item);
      }
      logCrashes(crashInfos: _crashString.join('\n'));
    };
  }

  Widget mainApp({
    required ThemeData appTheme,
    required List<QRoute> routes,
  }) {
    Future<void> _initializeConfig() async {
      // We will use this to Initialize anything at MaterialApp root init of app
      final BitmapDescriptor desc = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(), 'assets/images/shared/purpleCircle.png');

      print("[+] InitializedConfig -- the ${MezEnv.appType.toShortString()} !");
    }

    _initializeConfig();

    final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
    MezRouter.setupQR();
    return DevicePreview(
      enabled: MezEnv.previewMode == true ? true : false,
      builder: (BuildContext context) => MaterialApp.router(
        routeInformationParser: QRouteInformationParser(),

        // navigatorObservers: [MezRouter()],
        useInheritedMediaQuery: true,
        locale:
            MezEnv.previewMode == true ? DevicePreview.locale(context) : null,
        builder: MezEnv.previewMode == true
            ? DevicePreview.appBuilder
            : BotToastInit(),
        debugShowCheckedModeBanner: false,
        // onInit: () async => _initializeConfig(),
        title: MezEnv.appType.toShortString(),
        theme: appTheme,
        color: Colors.white,

        routerDelegate: QRouterDelegate(
          routes,
          observers: [
            BotToastNavigatorObserver()
            // Add your observers to the main navigator
            // to watch for all routes in all navigators use [QR.observer]
          ],
        ), // enableLog: true,
        // getPages: routes,
        // initialRoute: kWrapperRoute,
      ),
      //     GetMaterialApp(
      //   navigatorObservers: [MezRouter()],
      //   useInheritedMediaQuery: true,
      //   locale:
      //       MezEnv.previewMode == true ? DevicePreview.locale(context) : null,
      //   builder: MezEnv.previewMode == true ? DevicePreview.appBuilder : null,
      //   debugShowCheckedModeBanner: false,
      //   onInit: () async => _initializeConfig(),
      //   title: MezEnv.appType.toShortString(),
      //   theme: appTheme,
      //   color: Colors.white,
      //   enableLog: true,
      //   getPages: routes,
      //   initialRoute: SharedRoutes.kWrapperRoute,
      // ),
    );
  }
}
