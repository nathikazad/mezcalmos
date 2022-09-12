import 'package:mez_services_web_app/helpers/GeneralPurposeHelper.dart';
import 'package:mez_services_web_app/helpers/setUpHelper.dart';
import 'package:mez_services_web_app/screens/Restaurants/restaurantItemView/restaurantItemView.dart';
import 'package:mez_services_web_app/screens/Restaurants/resturentListView/restaurantsListView.dart';
import 'package:mez_services_web_app/screens/Restaurants/viewRestaurantsScreen/restaurnatsItemsView.dart';
import 'package:mez_services_web_app/screens/Restaurants/viewRestaurantsScreenInfo/viewRestaurnatsScreenInfo.dart';
import 'package:mez_services_web_app/services/values/constants.dart';
import 'package:qlevar_router/qlevar_router.dart';

class RestaurantRouters {
  static const String restaurants = "restaurants";
  static const String restaurantitems = "items";
  static const String restaurants_id = "restaurants_id";
  static const String restaurant_info = "info";
  static const String item_id = "item_id";

  final routes = QRoute(
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
              ),
              QRoute(
                path: '/:itemId',
                name: item_id,
                middleware: [],
                builder: () => RestaurantItemView(),
              )
            ]),
      ]);
}

class Test extends QMiddleware {
  @override
  Future onEnter() async {
    // print("============ this is a test");
    await setupFirebase(launchMode: typeMode.toLaunchMode());
    // return true;
  }
}
