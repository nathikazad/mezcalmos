import 'package:get/get.dart';
import 'package:mez_services_web_app/helpers/GeneralPurposeHelper.dart';
import 'package:mez_services_web_app/helpers/setUpHelper.dart';
import 'package:mez_services_web_app/screens/viewRestaurantsScreen/restaurnatsItemsView.dart';
import 'package:mez_services_web_app/screens/resturentListView/restaurantsListView.dart';
import 'package:mez_services_web_app/screens/unFoundPage.dart';
import 'package:mez_services_web_app/screens/viewRestaurantsScreenInfo/viewRestaurnatsScreenInfo.dart';
import 'package:mez_services_web_app/services/values/constants.dart';
import 'package:qlevar_router/qlevar_router.dart';

class AppRoutes {
  // static const String root = 'root';
  // static const String login = 'login';
  static const String restaurants = "restaurants";
  static const String restaurantitems = "items";
  static const String restaurants_id = "restaurants_id";
  static const String restaurant_info = "info";

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

    // add observers to the app
    // this observer will be called when the user navigates to new route
    QR.observer.onNavigate.add((path, route) async {
      print('Observer: Navigating to $path');
    });

    // this observer will be called when the popped out from a route
    QR.observer.onPop.add((path, route) async {
      print('Observer: popping out from $path');
    });

    // create initial route that will be used when the app is started
    // or when route is waiting for response
    //QR.settings.iniPage = InitPage();

    // Change the page transition for all routes in your app.
    QR.settings.pagesType = QFadePage();
  }

  final routes = <QRoute>[
    QRoute(
        // this will define how to find this route with [QR.to]
        path: '/restaurants',
        // this will define how to find this route with [QR.toName]
        name: restaurants,
        // The page to show when this route is called
        builder: () => RestaurantsListView(),
        children: [
          QRoute(
              path: '/:id',
              name: restaurants_id,
              middleware: [],
              builder: () => RestaurantsItemsView(),
              children: [
                QRoute(
                  path: '/info',
                  name: restaurant_info,
                  middleware: [],
                  builder: () => ViewRestaurantsScrennInfo(),
                )
              ]),
        ]),
    QRoute(
      path: '/items',
      name: restaurantitems,
      // What action to perform when this route is called
      // can be defined with classed extends [QMiddleware]
      // or define new one with [QMiddlewareBuilder]
      middleware: [
        Test()
        // QMiddlewareBuilder(
        //   redirectGuardFunc: (_) async {
        //     // if user is already logged in, redirect to dashboard
        //     if (Get.find<AuthService>().isAuth) {
        //       return '/dashboard';
        //     }
        //     return null;
        //   },
        // )
      ],
      builder: () => RestaurantsItemsView(),
    ),
    // Split your routes definitions into groups and call them here
    // StoreRoutes().route, // Add the store routes
    // DashboardRoutes().route, // Add the dashboard routes
    // MobileRoutes().route, // Add the mobile routes
    // MiddlewareRoutes().route, // Add the middleware routes
    // EditableRoutes().route, // Add the editable routes
    // Add declarative routes
    // QRoute.declarative(
    //   path: '/declarative',
    //   declarativeBuilder: (k) => DeclarativePage(k),
    // ),
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
