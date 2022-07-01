import 'dart:async';
import 'dart:html' as html;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
import 'package:mezcalmos/WebApp/routes/AppRoutes.dart';
import 'package:mezcalmos/WebApp/views/ErrorViews/unknownRoutePage.dart';
import 'package:sizer/sizer.dart';

import '../Shared/helpers/PrintHelper.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(Sizer(builder: (
    BuildContext context,
    Orientation orientation,
    DeviceType deviceType,
  ) {
    return AppStart();
  }));
  html.window.onBeforeUnload.listen((event) async {
    if (Get.currentRoute.startsWith("/restaurant/")) {
      print("i was here ==============>");
      intailizeApp(dotenv.env['LMODE'].toString().toLaunchMode()).then(
          (value) => Get.offAllNamed(
              "/restaurant?device=phone&id=6Hr3Hc2hkkZa7LX7slnFo3zOTdxx&lang=es"));
    }
    mezDbgPrint("heloo bro ${Get.currentRoute}");
  });
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
    String _tmpLmode = dotenv.env['LMODE'].toString();
    _launchMode = _tmpLmode.toLaunchMode();
    intailizeApp(_launchMode);
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
      initialRoute: "/",
      // theme: CustomerAppTheme.lightTheme,
      getPages: AppRoutes.getRoutes,
    );
  }
}

Future<bool> intailizeApp(AppLaunchMode _launchMode) async {
  Completer<bool> completer = Completer();
//setupFirebase(_launchMode);

  mezDbgPrint(Get.locale?.countryCode);
  hookOnFlutterErrorsStdout();

  completer.complete(true);
  return completer.future;
}

Future<bool> setupFirebase(AppLaunchMode _launchMode) async {
  const String _host =
      String.fromEnvironment('HOST', defaultValue: "http://127.0.0.1");
  // final AppLaunchMode _launchMode =
  //     String.fromEnvironment('LMODE', defaultValue: "prod").toLaunchMode();
  mezDbgPrint('mode  -> $_launchMode');
  mezDbgPrint('host  -> $_host');

  final FirebaseApp _app = await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBRQTIUx_-oMdp5_S5e9F8h4Uc4ViZKM4U",
      appId: "1:606383265109:web:a2050a8335ee6e37d8cbdc",
      messagingSenderId: "606383265109",
      projectId: "mezcalmos-staging",
    ),
  );
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
  putControllers();
  return Future.delayed(Duration(
    seconds: 5,
  )).then((value) => true);
}

Future<void> putControllers() async {
  await Get.put<LanguageController>(LanguageController())
      .isLamgInitialized
      .stream
      .first;

  Get.put<RestaurantsInfoController>(
    RestaurantsInfoController(),
    permanent: true,
  );
  Get.put<AppLifeCycleController>(
    AppLifeCycleController(logs: true),
    permanent: true,
  );
}

void hookOnFlutterErrorsStdout() {
  FlutterError.onError = (FlutterErrorDetails details) {
    for (String item in details.toString().split('\n')) {
      mezDbgPrint(item);
    }
  };
}
