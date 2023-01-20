// GetX based Router (For navigating)
import 'package:get/route_manager.dart';
import 'package:mezcalmos/MezAdminApp/pages/DeliveryCostSetter.dart';
import 'package:mezcalmos/MezAdminApp/pages/HomeScreen.dart';
import 'package:mezcalmos/MezAdminApp/pages/MezAdminWrapper.dart';
import 'package:mezcalmos/MezAdminApp/pages/Orders/PastDeliveryOrdersList.dart';
import 'package:mezcalmos/MezAdminApp/pages/Orders/ViewOrderScreen/ViewRestaurantOrderScreen.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServiceProvidersListScreen.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

// const String kCurrentOrdersList = "/currentDeliveryOrders";
const String kDeliveryOpHomeScreen = '/deliveryOpHomeScreen';
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
        GetPage(name: kDeliveryOpHomeScreen, page: () => HomeScreen()),
        GetPage(
          name: kHomeRoute,
          page: () => MezAdminWrapper(),
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
          name: kServiceProvidersListScreen,
          page: () => ServiceProvidersListScreen(),
        ),
        GetPage(
          name: kDeliveryCostSetter,
          page: () => DeliveryCostSetter(),
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
