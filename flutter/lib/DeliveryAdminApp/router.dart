// GetX based Router (For navigating)
import 'package:get/route_manager.dart';
import 'package:mezcalmos/DeliveryAdminApp/DeliveryAdminWrapper.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Drivers/DeliveryDriversList.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/HomeScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/PastDeliveryOrdersList.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Unauthorized.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryDriverType.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

// const String kCurrentOrdersList = "/currentDeliveryOrders";
const String kDeliveryOpHomeScreen = '/deliveryOpHomeScreen';
const String kCurrentDeliveryOrderInfoRoute = '/currentDeliveryOrders/:orderId';
const String kPastOrdersList = "/pastDeliveryOrders";
const String kPastDeliveryOrderInfoRoute = '/pastDeliveryOrders/:orderId';
const String kDeliveryDriversList = '/deliveryDriversList/:orderId';
const String kNotAuthorizedOperator = "/unauthorized";
// const String kCompanyDriversScreen = "/companyDriversScreen";
// const String kServiceProfileScreen = "/serviceProfileScreen";

class XRouter {
  static List<GetPage<dynamic>> mainRoutes = [
        // GetPage(
        //   name: kServiceProfileScreen,
        //   page: () => ServiceProfileScreen(),
        // ),
        GetPage(name: kDeliveryOpHomeScreen, page: () => HomeScreen()),
        GetPage(
          name: kHomeRoute,
          page: () => DeliveryAdminWrapper(),
        ),
        // GetPage(
        //   name: kCurrentOrdersList,
        //   page: () => ListDeliveryOrdersTabView(),
        // ),
        GetPage(
          name: kPastOrdersList,
          page: () => PastDeliveryOrdersList(),
        ),
        // GetPage(
        //   name: kCurrentDeliveryOrderInfoRoute,
        //   page: () => ViewRestaurantOrderScreen(),
        // ),
        // GetPage(
        //   name: kPastDeliveryOrderInfoRoute,
        //   page: () => ViewRestaurantOrderScreen(),
        // ),
        GetPage(
          name: kNotAuthorizedOperator,
          page: () => UnauthorizedDeliveryOperator(),
        ),
        GetPage(name: kDeliveryDriversList, page: () => DeliveryDriversList()),

        // GetPage(name: kCompanyDriversScreen, page: () => CompanyDriversScreen())
      ] +
      SharedRouter.sharedRoutes;
}

String getDeliveryCostScreenRoute(
    int? providerId, DeliveryServiceType? providerType) {
  String _rt = kDeliveryCostSettingScreen;
  if (providerId != null) {
    _rt = kDeliveryCostSettingScreen.replaceFirst(
        ':providerId', providerId.toString());
    if (providerType != null)
      _rt = _rt.replaceFirst(':providerType', providerType.toHasuraString());
  }
  return _rt;
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
