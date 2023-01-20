// GetX based Router (For navigating)
import 'package:get/route_manager.dart';
import 'package:mezcalmos/DeliveryAdminApp/DeliveryAdminWrapper.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/HomeScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/SingleOrderxxx/DvCompanyOrderView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Unauthorized.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

// const String kCurrentOrdersList = "/currentDeliveryOrders";
const String kDeliveryOpHomeScreen = '/home';

const String kNotAuthorizedOperator = "/unauthorized";
const String kDeliveryOrderRoute = "/:orderId";

String getDvCompanyOrderRoute(int orderId) {
  return kDeliveryOrderRoute.replaceFirst(":orderId", "$orderId");
}
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

        GetPage(name: kDeliveryOrderRoute, page: () => DvCompanyOrderView()),
      ] +
      SharedRouter.sharedRoutes;
}
