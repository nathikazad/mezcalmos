// GetX based Router (For navigating)
import 'package:get/route_manager.dart';
import 'package:mezcalmos/DeliveryAdminApp/DeliveryAdminWrapper.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/DvOpTabsView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrderView/DvCompanyOrderView.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

// const String kCurrentOrdersList = "/currentDeliveryOrders";
const String kDeliveryOpHomeScreen = '/home';

const String kNotAuthorizedOperator = "/unauthorized";
const String kOrderView = "/orders/:orderId";

String getDvCompanyOrderRoute(int orderId) {
  return kOrderView.replaceFirst(":orderId", "$orderId");
}

class XRouter {
  static List<GetPage<dynamic>> mainRoutes = [
        GetPage(name: kDeliveryOpHomeScreen, page: () => DvOpTabsView()),
        GetPage(
          name: kHomeRoute,
          page: () => DeliveryAdminWrapper(),
        ),
        GetPage(
          name: kOrderView,
          page: () => DvCompanyOrderView(),
        ),
      ] +
      SharedRouter.sharedRoutes;
}
