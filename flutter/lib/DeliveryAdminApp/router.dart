import 'package:get/get.dart'; // getX
import 'package:mezcalmos/DeliveryAdminApp/pages/AdminWrapper.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/DriversListView/DriverListScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryListView/LaundryListView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryOrder/LaundryOrderScreen.dart.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ListOrdersScreen/ListOrdersScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/TaxiOrderView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/ViewRestaurantOrderScreen.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

// Routes Keys.
const String kOrdersRoute = '/orders';
const String kRestaurantOrderRoute = '/orders/restaurant/:orderId';
const String kLaundryOrderRoute = '/orders/laundry/:orderId';
const String kTaxiOrderRoute = '/orders/taxi/:orderId';

const String kRestaurantsRoute = '/restaurants';
const String kRestaurantRoute = '/restaurants/:restaurantId';
const String kDriversListRoute = '/drivers';
const String kLaundriesListRoute = '/laundries';

String getRestaurantRoute(String restaurantId) {
  return kRestaurantRoute.replaceFirst(":restaurantId", restaurantId);
}

String getRestaurantOrderRoute(String orderId) {
  return kRestaurantOrderRoute.replaceFirst(":orderId", orderId);
}

String getLaundryOrderRoute(String orderId) {
  return kLaundryOrderRoute.replaceFirst(":orderId", orderId);
}

String getTaxiOrderRoute(String orderId) {
  return kTaxiOrderRoute.replaceFirst(":orderId", orderId);
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
        GetPage(name: kTaxiOrderRoute, page: () => TaxiOrderView()),
        GetPage(name: kDriversListRoute, page: () => DriversListScreen()),
        GetPage(name: kLaundriesListRoute, page: () => LaundriesListView())
      ] +
      SharedRouter.sharedRoutes;
}
