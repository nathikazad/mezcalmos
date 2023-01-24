// GetX based Router (For navigating)
import 'package:get/route_manager.dart';
import 'package:mezcalmos/MezAdminApp/MezAdminWrapper.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/AdminTabsView.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

// const String kCurrentOrdersList = "/currentDeliveryOrders";
const String kTabsView = '/deliveryOpHomeScreen';
const String kCurrentDeliveryOrderInfoRoute = '/currentDeliveryOrders/:orderId';
const String kPastOrdersList = "/pastDeliveryOrders";
const String kPastDeliveryOrderInfoRoute = '/pastDeliveryOrders/:orderId';
const String kServiceProvidersListScreen = '/serviceProvidersListScreen';
const String kNotAuthorizedAdmin = "/unauthorized";
const String kDeliveryCostSetter = "/deliveryCostSetter";
// const String kCompanyDriversScreen = "/companyDriversScreen";
// const String kServiceProfileScreen = "/serviceProfileScreen";

class XRouter {
  static List<GetPage<dynamic>> mainRoutes = [
        GetPage(name: kTabsView, page: () => AdminTabsView()),
        GetPage(
          name: kHomeRoute,
          page: () => MezAdminWrapper(),
        ),
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
  return kServiceProvidersListScreen.replaceFirst(
      ':orderId', orderId.toString());
}

// String specificServicePastOrderRoute() {}
