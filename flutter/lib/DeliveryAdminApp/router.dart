// GetX based Router (For navigating)
import 'package:get/route_manager.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/DeliveryAdminWrapper.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/CurrentDeliveryOrdersList.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/PastDeliveryOrdersList.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewOrderScreen/ViewRestaurantOrderScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Unauthorized.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

const String kCurrentOrdersList = "/currentDeliveryOrders";
const String kCurrentDeliveryOrderInfoRoute = '/currentDeliveryOrders/:orderId';
const String kPastOrdersList = "/pastDeliveryOrders";
const String kPastDeliveryOrderInfoRoute = '/pastDeliveryOrders/:orderId';

const String kNotAuthorizedOperator = "/unauthorized";

class XRouter {
  static List<GetPage<dynamic>> mainRoutes = [
        GetPage(
          name: kHomeRoute,
          page: () => DeliveryAdminWrapper(),
        ),
        GetPage(
          name: kCurrentOrdersList,
          page: () => CurrentDeliveryOrdersListView(),
        ),
        GetPage(
          name: kPastOrdersList,
          page: () => PastDeliveryOrdersList(),
        ),
        GetPage(
          name: kCurrentDeliveryOrderInfoRoute,
          page: () => ViewRestaurantOrderScreen(),
        ),
        GetPage(
          name: kPastDeliveryOrderInfoRoute,
          page: () => ViewRestaurantOrderScreen(),
        ),
        GetPage(
          name: kNotAuthorizedOperator,
          page: () => UnauthorizedDeliveryOperator(),
        )
      ] +
      SharedRouter.sharedRoutes;
}

String currentDeliveryOrderInfoRoute(int orderId) {
  return kCurrentDeliveryOrderInfoRoute.replaceFirst(
      ":orderId", orderId.toString());
}

String pastDeliveryOrderInfoRoute(int orderId) {
  return kPastDeliveryOrderInfoRoute.replaceFirst(
      ":orderId", orderId.toString());
}
