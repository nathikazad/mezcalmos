import 'package:get/get.dart'; // getX
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/OrderViewScreen/OrderViewScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingListScreen/IncomingListScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/IncomingOrderViewScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/TaxiWrapper.dart';

// Routes Keys.
// const String kTaxiWrapperRoute = '/taxi_wrapper';
const String kIncomingOrdersListRoute = '/incomingOrders';
const String kIncomingOrdersViewRoute = '/incomingOrders/:orderId';
const String kTaxiOrderRoute = '/taxiOrders/:orderId';
const String kPastOrdersListRoute = '/pastOrders';

String getIncomingOrderRoute(String orderId) {
  return kIncomingOrdersViewRoute.replaceFirst(":orderId", orderId);
}

String getTaxiOrderRoute(String orderId) {
  return kTaxiOrderRoute.replaceFirst(":orderId", orderId);
}

// GetX based Router (For navigating)
class XRouter {
  static dynamic mainRoutes = [
        GetPage(name: kTaxiOrderRoute, page: () => CurrentOrderScreen()),
        GetPage(
          name: kIncomingOrdersListRoute,
          page: () => IncomingOrdersScreen(),
        ),
        GetPage(name: kHomeRoute, page: () => TaxiWrapper()),
        GetPage(
          name: kIncomingOrdersViewRoute,
          page: () => IncomingOrderViewScreen(),
        ),
      ] +
      SharedRouter.sharedRoutes;
}
