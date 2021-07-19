import 'dart:async';
import 'dart:io' show Platform;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:mezcalmos/CustomerApp/main.dart';
import 'package:mezcalmos/DeliveryApp/main.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/ImageCropper.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/TaxiApp/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/TaxiApp/pages/SplashScreen.dart';

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

  // commented this try-catch block cuz it shouldn't be here cuz i forgot the emulator case

  // try {
  //   if ((Platform.isAndroid || Platform.isIOS) && _host == localhost) {
  //     throw new Exception(
  //         "[!] Error > When building for Android/IOS , Please make sure to pass Your Firebase host Machine's IP !");
  //   }
  // } catch (e) {
  //   print(e);
  // }

  switch (startPoint) {
    case 'delivery':
      return runApp(SPoint(DeliveryApp(), _host, _db, _launch_mode));

    case 'customer':
      return runApp(SPoint(CustomerApp(), _host, _db, _launch_mode));

    default:
      return runApp(SPoint(TaxiApp(), _host, _db, _launch_mode));
  }
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

  late SettingsController _settingsController;

  initializeSetup() async {
    try {
      FirebaseApp _app = await Firebase.initializeApp();

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
        await GetStorage()
            .write(getxGmapBottomPaddingKey, Platform.isAndroid ? 38.0 : 63.0);

        // first original user marker loading

        // await GetStorage().write(
        //     'user_descriptor',
        //     await BitmapDescriptorLoader(user_icon_marker_asset, 170, 180,
        //         isBytes: true));

        // second method

        await GetStorage().write(
            'user_descriptor',
            (isByte, imgUrl) async => await BitmapDescriptorLoader(
                isByte == true
                    ? await cropRonded(
                        (await http.get(Uri.parse(imgUrl))).bodyBytes)
                    : user_icon_marker_asset,
                100,
                100,
                isBytes: isByte));

        // await GetStorage().write(
        //     'user_descriptor',
        //     (isByte, imgUrl) async => isByte == false
        //         ? await BitmapDescriptorLoader(user_icon_marker_asset, 170, 180,
        //             isBytes: isByte)
        //         : await ImageCropper().resizeAndCircle(imgUrl, 20));

        await GetStorage().write('taxi_descriptor',
            await BitmapDescriptorLoader(taxi_driver_marker_asset, 90, 90));

        await GetStorage().write(
            'destination_descriptor',
            await BitmapDescriptorLoader(
                purple_destination_marker_asset, 90, 90));

        // Loading map asset !
        await rootBundle.loadString(map_style_asset).then((jsonString) =>
            GetStorage().write(getxMapStyleJsonKey, jsonString));
      } else
        print("[ GET STORAGE ] FAILED TO INITIALIZE !");

      setState(() {
        _initialized = true;
      });
    } catch (e) {
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

    // Show a CircularIndicator until setup is full done and initialized !
    if (!_initialized) {
      return SplashScreen();
    }

    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<NotificationsController>(NotificationsController(),
        permanent: true);
    _settingsController =
        Get.put<SettingsController>(SettingsController(), permanent: true);

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
