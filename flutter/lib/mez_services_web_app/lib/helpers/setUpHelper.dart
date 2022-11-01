import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mez_services_web_app/authHooks.dart';
import 'package:mez_services_web_app/controllers/LaundryController.dart';
import 'package:mez_services_web_app/controllers/authController.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:get/get.dart';
import 'package:mez_services_web_app/controllers/restaurantsInfoController.dart';
import 'package:mez_services_web_app/database/FirebaseDb.dart';
import 'package:mez_services_web_app/helpers/GeneralPurposeHelper.dart';
import 'package:mez_services_web_app/services/values/constants.dart';

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;

Future<void> putControllers() async {
  if (!Get.isRegistered<LanguageController>()) {
    await Get.put<LanguageController>(LanguageController())
        .isLamgInitialized
        .stream
        .first;
  }

  if (!Get.isRegistered<AuthController>()) {
    Get.put<AuthController>(
      AuthController(signInCallback, signOutCallback),
      permanent: true,
    );
  }

  if (!Get.isRegistered<RestaurantsInfoController>()) {
    Get.put<RestaurantsInfoController>(
      RestaurantsInfoController(),
      permanent: true,
    );
  }
  // if (!Get.isRegistered<AppLifeCycleController>()) {
  //   Get.put<AppLifeCycleController>(
  //     AppLifeCycleController(logs: true),
  //     permanent: true,
  //   );
  // }
  if (!Get.isRegistered<LaundryController>()) {
    Get.put<LaundryController>(
      LaundryController(),
      permanent: true,
    );
  }
}

Future<bool> setupFirebase(
    {required AppLaunchMode launchMode, Function? func}) async {
  const String _host =
      String.fromEnvironment('HOST', defaultValue: "http://127.0.0.1");
  // final AppLaunchMode _launchMode =
  //     String.fromEnvironment('LMODE', defaultValue: "prod").toLaunchMode();
  print('mode  -> $launchMode');

  late FirebaseApp _app;

  late FirebaseDatabase firebaseDb;
  if (!Get.isRegistered<FirebaseDb>()) {
    if (launchMode == AppLaunchMode.prod) {
      _app = await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: "AIzaSyB9vaAB9ptXhpeRs_JjxODEyuA_eO0tYu0",
          appId: "1:804036698204:web:39b22436cbb4ef633f8699",
          messagingSenderId: "804036698204",
          projectId: "mezcalmos-31f1c",
        ),
      );
      firebaseDb = FirebaseDatabase.instanceFor(
          app: _app,
          databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com");
    } else if (launchMode == AppLaunchMode.dev) {
      print("DEV MODE");
      _app = await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: "AIzaSyAKu4WzLR4iZPk4qnEgYdVh1SWqnRXbS-M",
          appId: "1:606383265109:web:a2050a8335ee6e37d8cbdc",
          messagingSenderId: "606383265109",
          projectId: "mezcalmos-85ff1",
        ),
      );
      firebaseDb =
          FirebaseDatabase.instanceFor(app: _app, databaseURL: _host + dbRoot);
      firebaseDb.setPersistenceEnabled(true);
      firebaseDb.setPersistenceCacheSizeBytes(10000000);
      // await FirebaseAuth.instance.useEmulator(_host + authPort);
      // FirebaseFunctions.instance
      //     .useFunctionsEmulator(_host.replaceAll('http://', ''), functionPort);
    } else if (launchMode == AppLaunchMode.stage) {
      print("[+] Entered Staging check ----.");
      _app = await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: "AIzaSyBRQTIUx_-oMdp5_S5e9F8h4Uc4ViZKM4U",
          appId: "1:606383265109:web:a2050a8335ee6e37d8cbdc",
          messagingSenderId: "606383265109",
          projectId: "mezcalmos-staging",
        ),
      );
      firebaseDb =
          FirebaseDatabase.instanceFor(app: _app, databaseURL: stagingDb);
    } else {
      throw Exception("Invalid Launch Mode");
    }

    Get.put(
        FirebaseDb(
          dbUrl: _host + dbRoot,
          firebaseDatabase: firebaseDb,
          firebaseApp: _app,
        ),
        permanent: true);
  }

  putControllers();
  return Future.delayed(Duration(
    milliseconds: 500,
  )).then((value) {
    if (func != null) {
      func();
    }
    return true;
  });
}
