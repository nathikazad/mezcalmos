// GetX based Router (For navigating)
import 'package:get/route_manager.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/DeliveryAdminWrapper.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/DeliveryCostSetter.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Drivers/DeliveryDriversList.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Drivers/CompanyDriversScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/CurrentDeliveryOrdersList.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/PastDeliveryOrdersList.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewOrderScreen/ViewRestaurantOrderScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/ServiceProfile/ServiceProfile.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Unauthorized.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

const String kCurrentOrdersList = "/currentDeliveryOrders";
const String kCurrentDeliveryOrderInfoRoute = '/currentDeliveryOrders/:orderId';
const String kPastOrdersList = "/pastDeliveryOrders";
const String kPastDeliveryOrderInfoRoute = '/pastDeliveryOrders/:orderId';
const String kDeliveryDriversList = '/deliveryDriversList/:orderId';
const String kNotAuthorizedOperator = "/unauthorized";
const String kDeliveryCostSetter = "/deliveryCostSetter";
const String kCompanyDriversScreen = "/companyDriversScreen";
const String kServiceProfileScreen = "/serviceProfileScreen";

class XRouter {
  static List<GetPage<dynamic>> mainRoutes = [
        GetPage(
          name: kServiceProfileScreen,
          page: () => ServiceProfileScreen(),
        ),
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
        ),
        GetPage(name: kDeliveryDriversList, page: () => DeliveryDriversList()),
        GetPage(name: kDeliveryCostSetter, page: () => DeliveryCostSetter()),
        GetPage(name: kCompanyDriversScreen, page: () => CompanyDriversScreen())
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

String pickDriverForOrderRoute(int orderId) {
  return kDeliveryDriversList.replaceFirst(':orderId', orderId.toString());
}
