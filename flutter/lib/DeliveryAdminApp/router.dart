import 'package:get/get.dart'; // getX
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/AdminWrapper.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Restaurants/ListRestaurantsScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Restaurants/ViewRestaurantScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ListOrdersScreen.dart';

// Routes Keys.
const String kOrdersRoute = '/orders';
const String kRestaurantOrderRoute = '/orders/:orderId';
const String kRestaurantsRoute = '/restaurants';
const String kRestaurantRoute = '/restaurants/:restaurantId';

getRestaurantRoute(String restaurantId) {
  return kRestaurantRoute.replaceFirst(":restaurantId", restaurantId);
}

getRestaurantOrderRoute(String orderId) {
  return kRestaurantOrderRoute.replaceFirst(":orderId", orderId);
}

// GetX based Router (For navigating)
class XRouter {
  static List<GetPage<dynamic>> mainRoutes = [
        GetPage(name: kHomeRoute, page: () => AdminWrapper()),
        GetPage(name: kOrdersRoute, page: () => ListOrdersScreen()),
        GetPage(
            name: kRestaurantOrderRoute,
            page: () => ViewRestaurantOrderScreen()),
        GetPage(name: kRestaurantsRoute, page: () => ListRestaurantsScreen()),
        GetPage(name: kRestaurantRoute, page: () => ViewRestaurantScreen()),
      ] +
      SharedRouter.sharedRoutes;
}
