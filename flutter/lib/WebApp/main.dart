import 'dart:async';
import 'dart:js' as js;
import 'dart:html' as html;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/theme.dart';

import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/WebApp/controllers/blogController.dart';
import 'package:mezcalmos/WebApp/routes/AppRoutes.dart';
import 'package:mezcalmos/WebApp/views/ErrorViews/unknownRoutePage.dart';
import 'package:sizer/sizer.dart';
import '../Shared/helpers/PrintHelper.dart';
import 'services/values/globals.dart';

void main() async {
  js.context["my_dart_var"] = typeMode;
  html.document.dispatchEvent(html.CustomEvent("dart_loaded"));
  runApp(Sizer(builder: (
    BuildContext context,
    Orientation orientation,
    DeviceType deviceType,
  ) {
    return AppStart();
  }));
}

class AppStart extends StatefulWidget {
  AppStart({Key? key}) : super(key: key);

  @override
  State<AppStart> createState() => _AppStartState();
}

class _AppStartState extends State<AppStart> {
  late final AppLaunchMode _launchMode;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    String _tmpLmode = typeMode;
    _launchMode = _tmpLmode.toLaunchMode();

    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
      initialRoute: "/",
      theme: CustomerAppTheme.lightTheme,
      getPages: AppRoutes.getRoutes,
    );
  }
}

Future<bool> setupFirebase(
    {required AppLaunchMode launchMode, Function? func}) async {
  const String _host =
      String.fromEnvironment('HOST', defaultValue: "http://127.0.0.1");
  // final AppLaunchMode _launchMode =
  //     String.fromEnvironment('LMODE', defaultValue: "prod").toLaunchMode();
  mezDbgPrint('mode  -> $launchMode');

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
      mezDbgPrint("DEV MODE");
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
      await FirebaseAuth.instance.useEmulator(_host + authPort);
      FirebaseFunctions.instance
          .useFunctionsEmulator(_host.replaceAll('http://', ''), functionPort);
    } else if (launchMode == AppLaunchMode.stage) {
      mezDbgPrint("[+] Entered Staging check ----.");
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

Future<void> putControllers() async {
  if (!Get.isRegistered<LanguageController>()) {
    await Get.put<LanguageController>(LanguageController())
        .isLamgInitialized
        .stream
        .first;
  }

  if (!Get.isRegistered<RestaurantsInfoController>()) {
    Get.put<RestaurantsInfoController>(
      RestaurantsInfoController(),
      permanent: true,
    );
  }
  if (!Get.isRegistered<AppLifeCycleController>()) {
    Get.put<AppLifeCycleController>(
      AppLifeCycleController(logs: true),
      permanent: true,
    );
  }
  if (!Get.isRegistered<BolgController>()) {
    Get.put<BolgController>(
      BolgController(),
      permanent: true,
    );
  }
}

void hookOnFlutterErrorsStdout() {
  FlutterError.onError = (FlutterErrorDetails details) {
    for (String item in details.toString().split('\n')) {
      mezDbgPrint(item);
    }
  };
}
