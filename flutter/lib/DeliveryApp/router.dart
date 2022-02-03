import 'package:get/get.dart'; // getX
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/CurrentOrderViewScreen.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrdersListScreen/CurrentOrdersListScreen.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/DeliveryApp/pages/DeliveryWrapper.dart';

const String kCurrentOrdersListRoute = '/currentOrders';
const String kCurrentOrderViewRoute = '/currentOrders/:orderId';

String getCurrentOrderRoute(String orderId) {
  return kCurrentOrderViewRoute.replaceFirst(":orderId", orderId);
}

// GetX based Router (For navigating)
class XRouter {
  static dynamic mainRoutes = [
        GetPage(
            name: kCurrentOrdersListRoute,
            page: () => CurrentOrdersListScreen()),
        GetPage(
            name: kCurrentOrderViewRoute,
            page: () => CurrentOrderViewScreen()),
        GetPage(name: kHomeRoute, page: () => DeliveryWrapper()),
      ] +
      SharedRouter.sharedRoutes;
}
