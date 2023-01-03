import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/WebApp/controllers/mezWebSideBarController.dart';
import 'package:mezcalmos/WebApp/routes/AuthRoutes.dart';
import 'package:mezcalmos/WebApp/routes/LaundryRoutes.dart';
import 'package:mezcalmos/WebApp/routes/MessagesScreen.dart';
import 'package:mezcalmos/WebApp/routes/OrdersRoutes.dart';
import 'package:mezcalmos/WebApp/routes/RestaurantRouts.dart';
import 'package:mezcalmos/WebApp/routes/deferred_loader.dart';
import 'package:mezcalmos/WebApp/routes/notifsRoutes.dart';
import 'package:mezcalmos/WebApp/routes/userProfileRoute.dart';
import 'package:mezcalmos/WebApp/screens/cartScreen/CartViewScreen.dart';
import 'package:mezcalmos/WebApp/screens/test.dart' deferred as test;
import 'package:mezcalmos/WebApp/screens/test2.dart' deferred as test2;
import 'package:mezcalmos/WebApp/screens/unFoundPage.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/webHelpers/setUpHelper.dart';
import 'package:mezcalmos/WebApp/widgets/mezLoaderWidget.dart';

import 'package:qlevar_router/qlevar_router.dart';

class AppRoutes {
  void setup() {
    // enable debug logging for all routes
    QR.settings.enableDebugLog = true;

    // you can set your own logger
    // QR.settings.logger = (String message) {
    //   print(message);
    // };

    // Set up the not found route in your app.
    // this route (path and view) will be used when the user navigates to a
    // route that does not exist.
    QR.settings.notFoundPage = QRoute(
      path: '/404',
      builder: () => UnfoundPageScreen(),
    );
    QR.settings.initPage = const Material(child: MezLoaderWidget());

    // add observers to the app
    // this observer will be called when the user navigates to new route
    QR.observer.onNavigate.add((path, route) async {
      print('Observer: Navigating to $path');
    });

    // this observer will be called when the popped out from a route
    QR.observer.onPop.add((path, route) async {
      ;
      print(
          'Observer: popping out from $path ${Get.find<MezWebSideBarController>().drawerKey.toString()}');
      mezDbgPrint("Observer: popping out from $path and route is $route");
    });

    // create initial route that will be used when the app is started
    // or when route is waiting for response
    //QR.settings.iniPage = InitPage();

    // Change the page transition for all routes in your app.
    QR.settings.pagesType = QFadePage();
  }

  final routes = <QRoute>[
    //routes for restaurants screens
    RestaurantRouters().routes,
    //routes for laundries screen
    LaundryRoutes().routes,

    // routes for auths
    AuthRoutes().routes,
    // user profile routes
    UserProfileRoute().routes,
    OrdersRoutes().routes,
    MessagesRoutes().routes,
    NotificationsRoutes().routes,
    QRoute(
      path: "/cart",
      name: "cart",
      builder: () => CartViewScreen(),
    ),
  ];
}

class Test extends QMiddleware {
  @override
  Future onEnter() async {
    // print("============ this is a test");
    await setupFirebase(launchMode: typeMode.toLaunchMode());
    // return true;
  }

  // void setUpProject() {
  //   print("============ this is a test");
  // }
}
