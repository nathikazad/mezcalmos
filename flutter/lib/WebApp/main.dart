import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/WebApp/routes/AppRoutes.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/webAppTheme.dart';
import 'package:mezcalmos/WebApp/webHelpers/setUpHelper.dart';
import 'dart:js' as js;
import 'dart:html' as html;

import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //prod stage
  js.context["my_dart_var"] = typeMode;
  html.document.dispatchEvent(html.CustomEvent("dart_loaded"));
  runMainGuarded(() => runApp(Sizer(builder: (
        BuildContext context,
        Orientation orientation,
        DeviceType deviceType,
      ) {
        return MyApp();
      })));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppLaunchMode _launchMode;
  @override
  void initState() {
    String _tmpLmode = typeMode;
    _launchMode = _tmpLmode.toLaunchMode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appRoutes = AppRoutes();
    appRoutes.setup();
    // return GetMaterialApp(
    //   unknownRoute: GetPage(name: '/notfound', page: () => UnfoundPageScreen()),
    //   initialRoute: restaurants,
    //   theme: WebAppTheme.lightTheme,
    //   getPages: AppRoutes.getRoutes,
    // );
    return MaterialApp.router(
      // Add the [QRouteInformationParser]
      routeInformationParser: QRouteInformationParser(),
      // Add the [QRouterDelegate] with your routes
      routerDelegate: QRouterDelegate(
        appRoutes.routes,
        observers: [
          // Add your observers to the main navigator
          // to watch for all routes in all navigators use [QR.observer]
        ],
      ),
      theme: WebAppTheme.lightTheme,
    );
  }
}
