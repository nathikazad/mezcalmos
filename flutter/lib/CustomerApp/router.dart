import 'package:get/get.dart'; // getX
import 'package:mezcalmos/CustomerApp/pages/MapViews/PickLocationView.dart';
import 'package:mezcalmos/CustomerApp/pages/Orders/ListOrdersScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCurrentOrderScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/CustomerApp/pages/CustomerWrapper.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen.dart';

// Routes Keys.
const String kWrapperRoute = '/wrapper';
const String kTaxisRoute = '/taxi';
const String kOrdersRoute = '/orders';
const String kRestaurantsRoute = '/restaurants';
const String kRestaurantRoute = '/restaurants/:restaurantId';
const String kViewRestaurantItemRoute = '/items/:restaurantId/:itemId';
const String kCurrentRestaurantOrderRoute = '/currentRestaurantOrders/:orderId';
const String kPastRestaurantOrderRoute = '/pastRestaurantOrders/:orderId';
const String kCartRoute = '/cart';
const String kCartItemRoute = '/cart/:cartItemId';
const String kPickLocationRoute = '/pickLocationFromMap';

String getRestaurantRoute(String restaurantId) {
  return kRestaurantRoute.replaceFirst(":restaurantId", restaurantId);
}

String getItemRoute(String restaurantId, String itemId) {
  return kViewRestaurantItemRoute
      .replaceFirst(":restaurantId", restaurantId)
      .replaceFirst(":itemId", itemId);
}

String editCartItemRoute(String cartItemId) {
  return kCartItemRoute.replaceFirst(":cartItemId", cartItemId);
}

String getCurrentRestaurantOrderRoute(String orderId) {
  return kCurrentRestaurantOrderRoute.replaceFirst(":orderId", orderId);
}

String getPastRestaurantOrderRoute(String orderId) {
  return kPastRestaurantOrderRoute.replaceFirst(":orderId", orderId);
}

String getRestaurantMessagesRoute(
  String orderId,
) {
  return kMessagesRoute.replaceFirst(":orderId", orderId) +
      "?recipientType=${ParticipantType.Restaurant.toFirebaseFormattedString()}";
}

// GetX based Router (For navigating)
class XRouter {
  static dynamic mainRoutes = [
        GetPage(name: kHomeRoute, page: () => CustomerWrapper()),
        GetPage(name: kOrdersRoute, page: () => ListOrdersScreen()),
        GetPage(name: kRestaurantsRoute, page: () => ListRestaurantsScreen()),
        GetPage(name: kRestaurantRoute, page: () => ViewRestaurantScreen()),
        GetPage(
            name: kViewRestaurantItemRoute,
            page: () => ViewItemScreen(ViewItemScreenMode.AddItemMode)),
        GetPage(
            name: kCartItemRoute,
            page: () => ViewItemScreen(ViewItemScreenMode.EditItemMode)),
        GetPage(
            name: kCartRoute,
            page: () => ViewCartScreen(),
            transitionDuration: Duration(seconds: 1),
            transition: Transition.rightToLeft),
        GetPage(
            name: kCurrentRestaurantOrderRoute,
            page: () => ViewCurrentRestaurantOrderScreen()),
        GetPage(name: kPickLocationRoute, page: () => PickLocationView())
      ] +
      SharedRouter.sharedRoutes;
}
