// WARNING : ===================

// DO NOT TOUCH OR IMPORT ANYTHING IN THIS MAIN PLEASE.

// =============================

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/pages/SplashScreen.dart';
import 'package:mezcalmos/TaxiApp/helpers/authHooks.dart';
import 'package:mezcalmos/pre-main.dart';
import 'package:package_info/package_info.dart';
////
// import 'package:device_preview/device_preview.dart';
// import 'package:device_preview/plugins.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  const startPoint =
      bool.hasEnvironment('APP_SP') ? String.fromEnvironment('APP_SP') : null;
  const _host =
      bool.hasEnvironment('HOST') ? String.fromEnvironment('HOST') : localhost;
  const _db =
      bool.hasEnvironment('DB') ? String.fromEnvironment('DB') : defaultDb;

  const _launch_mode = bool.hasEnvironment('LMODE')
      ? String.fromEnvironment('LMODE')
      : defaultLaunchMode;

  print('SP -> ${startPoint.toString()}');
  print('host  -> $_host');
  print('db  -> $_db');
  print('mode  -> $_launch_mode');

  runApp(
    // DevicePreview(
    //   enabled: true,
    //   plugins: [
    //     const ScreenshotPlugin(),
    //     const FileExplorerPlugin(),
    //     const SharedPreferencesExplorerPlugin(),
    //   ],
    //   builder: (context) =>
    SPoint(launcherApp, _host, _db, _launch_mode),
  );
}

class SPoint extends StatefulWidget {
  final Widget _app;
  final String _host;
  final String _db;
  final String _launch_mode;

  SPoint(this._app, this._host, this._db, this._launch_mode);

  @override
  _SPointState createState() => _SPointState();
}

class _SPointState extends State<SPoint> {
  bool _initialized = false;
  bool _error = false;
  bool timerDone = false;
  late StreamSubscription<bool> onAuthStateNotifierInvoked;

  initializeSetup() async {
    try {
      FirebaseApp _app = await Firebase.initializeApp();
      print("[+] App Initialized under Name ${_app.name} .");
      late FirebaseDatabase firebaseDb;

      if (widget._launch_mode == "prod") {
        firebaseDb = FirebaseDatabase(app: _app);
      } else if (widget._launch_mode == "dev") {
        // Firebase !
        firebaseDb =
            FirebaseDatabase(app: _app, databaseURL: widget._host + dbRoot);
        await FirebaseAuth.instance.useEmulator(widget._host + authPort);
        FirebaseFunctions.instance
            .useFunctionsEmulator(origin: widget._host + functionPort);
      }
      // staging
      else {
        print("[+] Entered Staging check ----.");
        firebaseDb = FirebaseDatabase(app: _app, databaseURL: stagingDb);
      }

      // Global Injections !
      Get.put(DatabaseHelper(widget._host + dbRoot, widget._db,
          firebaseDatabase: firebaseDb,
          fapp: _app)); // we can specify after if we have many Databases ..

      // GetStorage
      if (await GetStorage.init()) {
        print("[ GET STORAGE ] INITIALIZED !");
        await GetStorage().write(getxLmodeKey, widget._launch_mode);
        // Get the VersionNumber
        PackageInfo pInfos = await PackageInfo.fromPlatform();
        await GetStorage().write(version, pInfos.version);
      } else
        print("[ GET STORAGE ] FAILED TO INITIALIZE !");
      AuthController auCtrl = Get.put<AuthController>(
          AuthController(signInCallback, signOutCallback),
          permanent: true);
      Get.put<SettingsController>(SettingsController(), permanent: true);
      // set to logs=false if you don't need the logs anymore.
      Get.put<AppLifeCycleController>(AppLifeCycleController(logs: true),
          permanent: true);

      // this listenes on authStateNotifierInvoked changes and affect it's value to our _initialized StateVariable and rebuild the state of this Spoint.
      onAuthStateNotifierInvoked = auCtrl.authStateNotifierInvoked
          .listen((value) => setState(() => _initialized = value));
    } catch (e) {
      print("[+] Error Happend =======> $e");
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    // INjecting this here cuz we will need it For language / them ... etc
    initializeSetup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      mezcalmosSnackBar("Error", "Server connection failed !");
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Icon(Icons.signal_wifi_bad,
                color: Colors.red.shade200,
                size: getSizeRelativeToScreen(50, Get.height, Get.width)),
          ),
        ),
      );
    }

    // Show a SplashScreen until setup is full done and initialized!
    if (!_initialized) {
      return SplashScreen();
    } else
      // we don't need to keep this listener there anymore
      onAuthStateNotifierInvoked.cancel();

    Timer(
        Duration(seconds: nSplashScreenTimer),
        () => setState(() {
              timerDone = true;
            }));

    // if there is no errors and Initialization is done , we inject Auth right away to not cause the Delay on the wrapper!
    if (timerDone)
      return widget._app;
    else
      return SplashScreen();
  }
}
