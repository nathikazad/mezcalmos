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
import 'package:mezcalmos/pre-main.dart';
import 'package:package_info/package_info.dart';
import 'package:get/route_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
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

  const _launchMode = bool.hasEnvironment('LMODE')
      ? String.fromEnvironment('LMODE')
      : defaultLaunchMode;

  print('SP -> ${startPoint.toString()}');
  print('host  -> $_host');
  print('db  -> $_db');
  print('mode  -> $_launchMode');

  runApp(
    // DevicePreview(
    //   enabled: true,
    //   plugins: [
    //     const ScreenshotPlugin(),
    //     const FileExplorerPlugin(),
    //     const SharedPreferencesExplorerPlugin(),
    //   ],
    //   builder: (context) =>
    SPoint(new App(), _host, _db, _launchMode),
  );
}

class SPoint extends StatefulWidget {
  final Widget _app;
  final String _host;
  final String _db;
  final String _launchMode;

  SPoint(this._app, this._host, this._db, this._launchMode);

  @override
  _SPointState createState() => _SPointState();
}

class _SPointState extends State<SPoint> {
  bool _initialized = false;
  bool _error = false;
  bool timerDone = false;

  initializeSetup() async {
    try {
      FirebaseApp _app = await Firebase.initializeApp();
      mezDbgPrint("[+] App Initialized under Name ${_app.name} .");
      late FirebaseDatabase firebaseDb;

      if (widget._launchMode == "prod") {
        firebaseDb = FirebaseDatabase(app: _app);
      } else if (widget._launchMode == "dev") {
        // Firebase !
        firebaseDb =
            FirebaseDatabase(app: _app, databaseURL: widget._host + dbRoot);
        await FirebaseAuth.instance.useEmulator(widget._host + authPort);
        FirebaseFunctions.instance
            .useFunctionsEmulator(origin: widget._host + functionPort);
      }
      // staging
      else {
        mezDbgPrint("[+] Entered Staging check ----.");
        firebaseDb = FirebaseDatabase(app: _app, databaseURL: stagingDb);
      }

      // Global Injections !
      Get.put(DatabaseHelper(widget._host + dbRoot, widget._db,
          firebaseDatabase: firebaseDb,
          fapp: _app)); // we can specify after if we have many Databases ..

      // GetStorage
      if (await GetStorage.init()) {
        mezDbgPrint("[ GET STORAGE ] INITIALIZED !");
        await GetStorage().write(getxLmodeKey, widget._launchMode);
        // Get the VersionNumber
        PackageInfo pInfos = await PackageInfo.fromPlatform();
        await GetStorage().write(version, pInfos.version);
      } else
        mezDbgPrint("[ GET STORAGE ] FAILED TO INITIALIZE !");

      Get.put<AuthController>(AuthController(signInCallback, signOutCallback),
          permanent: true);
      mezDbgPrint("Putting Auth Controller");
      Get.put<AppLifeCycleController>(AppLifeCycleController(logs: true),
          permanent: true);
      Get.put<SettingsController>(SettingsController(appName), permanent: true);
      // set to logs=false if you don't need the logs anymore.

      Get.find<AuthController>().authStateChange.first.then((value) {
        setState(() => _initialized = true);
        Timer(
            Duration(seconds: nSplashScreenTimer),
            () => setState(() {
                  timerDone = true;
                }));
      });
    } catch (e) {
      mezDbgPrint("[+] Error Happend =======> $e");
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // INjecting this here cuz we will need it For language / them ... etc
    initializeSetup();
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
    if (!_initialized || !timerDone) {
      return SplashScreen();
    } else {
      return widget._app;
    }
  }
}



class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> _initializeConfig() async {
      // We will use this to Initialize anything at MaterialApp root init of app
      BitmapDescriptor desc = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(), 'assets/images/purple_circle.png');

      await GetStorage().write('markerCircle', desc);
      print("[+] InitializedConfig -- the $appName !");
    }

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        onInit: () async => await _initializeConfig(),
        title: appName,
        theme: ThemeData(
            primaryColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        color: Colors.white,
        getPages: routes,
        initialRoute: kWrapperRoute);
  }
}
