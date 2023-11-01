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
  // static dynamic mainRoutes = [
  //       GetPage(name: kPastOrdersListRoute, page: () => PastOrderList()),
  //       GetPage(name: kTaxiOrderRoute, page: () => CurrentOrderScreen()),
  //       GetPage(
  //         name: kIncomingOrdersListRoute,
  //         page: () => IncomingOrdersScreen(),
  //       ),
  //       GetPage(name: kHomeRoute, page: () => TaxiWrapper()),
  //       GetPage(
  //         name: kIncomingOrdersViewRoute,
  //         page: () => IncomingOrderViewScreen(),
  //       ),
  //     ] +
  //     SharedRouter.sharedRoutes;
}
