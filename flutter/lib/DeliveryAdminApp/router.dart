import 'package:get/get.dart'; // getX
import 'package:mezcalmos/DeliveryAdminApp/pages/AdminWrapper.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/Drivers/DriverListScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryOrder/LaundryOrderScreen.dart.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ListOrdersScreen/ListOrdersScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/ViewRestaurantOrderScreen.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

// Routes Keys.
const String kOrdersRoute = '/orders';
const String kRestaurantOrderRoute = '/orders/:orderId';
const String kLaundryOrderRoute = '/orders/laundry/:orderId';
const String kRestaurantsRoute = '/restaurants';
const String kRestaurantRoute = '/restaurants/:restaurantId';
const String kDriversListRoute = '/drivers';

String getRestaurantRoute(String restaurantId) {
  return kRestaurantRoute.replaceFirst(":restaurantId", restaurantId);
}

String getRestaurantOrderRoute(String orderId) {
  return kRestaurantOrderRoute.replaceFirst(":orderId", orderId);
}

String getLaundryOrderRoute(String orderId) {
  return kLaundryOrderRoute.replaceFirst(":orderId", orderId);
}

// GetX based Router (For navigating)
class XRouter {
  static List<GetPage<dynamic>> mainRoutes = [
        GetPage(name: kHomeRoute, page: () => AdminWrapper()),
        GetPage(name: kOrdersRoute, page: () => ListOrdersScreen()),
        GetPage(
            name: kRestaurantOrderRoute,
            page: () => ViewRestaurantOrderScreen()),
        GetPage(name: kLaundryOrderRoute, page: () => LaundryOrderScreen()),
        GetPage(name: kDriversListRoute, page: () => DriversListScreen())
      ] +
      SharedRouter.sharedRoutes;
}
