import 'package:get/get.dart'; // getX
import 'package:mezcalmos/CustomerApp/pages/Orders/ListOrdersScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCurrentOrderScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Wrapper.dart';

import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/CustomerApp/pages/CustomerWrapper.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen.dart';

// Routes Keys.
const String kWrapperRoute = '/wrapper';
const String kCustomerWrapperRoute = '/';
const String kTaxisRoute = '/taxi';
const String kNotificationsRoute = '/notifications';
const String kOrdersRoute = '/orders';
const String kRestaurantsRoute = '/restaurants';
const String kRestaurantRoute = '/restaurants/:restaurantId';
const String kViewRestaurantItemRoute = '/items/:restaurantId/:itemId';
const String kCurrentRestaurantOrderRoute = '/currentRestaurantOrders/:orderId';
const String kPastRestaurantOrderRoute = '/pastRestaurantOrders/:orderId';
const String kCartRoute = '/cart';
const String kCartItemRoute = '/cart/:cartItemId';

getRestaurantRoute(String restaurantId) {
  return kRestaurantRoute.replaceFirst(":restaurantId", restaurantId);
}

getItemRoute(String restaurantId, String itemId) {
  return kViewRestaurantItemRoute
      .replaceFirst(":restaurantId", restaurantId)
      .replaceFirst(":itemId", itemId);
}

editCartItemRoute(String cartItemId) {
  return kCartItemRoute.replaceFirst(":cartItemId", cartItemId);
}

getCurrentRestaurantOrderRoute(String orderId) {
  return kCurrentRestaurantOrderRoute.replaceFirst(":orderId", orderId);
}

getPastRestaurantOrderRoute(String orderId) {
  return kPastRestaurantOrderRoute.replaceFirst(":orderId", orderId);
}

// GetX based Router (For navigating)
class XRouter {
  static dynamic mainRoutes = [
        GetPage(name: kWrapperRoute, page: () => Wrapper()),
        GetPage(name: kCustomerWrapperRoute, page: () => CustomerWrapper()),
        GetPage(name: kOrdersRoute, page: () => ListOrdersScreen()),
        GetPage(name: kRestaurantsRoute, page: () => ListRestaurantsScreen()),
        GetPage(name: kRestaurantRoute, page: () => ViewRestaurantScreen()),
        GetPage(
            name: kViewRestaurantItemRoute,
            page: () => ViewItemScreen(ViewItemScreenMode.AddItemMode)),
        GetPage(
            name: kCartItemRoute,
            page: () => ViewItemScreen(ViewItemScreenMode.EditItemMode)),
        GetPage(name: kCartRoute, page: () => ViewCartScreen()),
        GetPage(
            name: kCurrentRestaurantOrderRoute,
            page: () => ViewCurrentRestaurantOrderScreen())
      ] +
      SharedRouter.sharedRoutes;
}
