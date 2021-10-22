import 'package:get/get.dart'; // getX
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewOrderScreen.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/AdminWrapper.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Restaurants/ListRestaurantsScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Restaurants/ViewRestaurantScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ListOrdersScreen.dart';

// Routes Keys.
const String kOrdersRoute = '/orders';
const String kOrderRoute = '/orders/:orderId';
const String kRestaurantsRoute = '/restaurants';
const String kRestaurantRoute = '/restaurants/:restaurantId';

getRestaurantRoute(String restaurantId) {
  return kRestaurantRoute.replaceFirst(":restaurantId", restaurantId);
}

getOrderRoute(String orderId) {
  return kOrderRoute.replaceFirst(":orderId", orderId);
}

// GetX based Router (For navigating)
class XRouter {
  static List<GetPage<dynamic>> mainRoutes = [
        GetPage(name: kHomeRoute, page: () => CustomerWrapper()),
        GetPage(name: kOrdersRoute, page: () => ListOrdersScreen()),
        GetPage(name: kOrderRoute, page: () => ViewOrderScreen()),
        GetPage(name: kRestaurantsRoute, page: () => ListRestaurantsScreen()),
        GetPage(name: kRestaurantRoute, page: () => ViewRestaurantScreen()),
      ] +
      SharedRouter.sharedRoutes;
}
