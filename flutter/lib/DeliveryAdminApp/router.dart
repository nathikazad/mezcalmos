// GetX based Router (For navigating)
import 'package:get/route_manager.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/DeliveryAdminWrapper.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/CurrentDeliveryOrdersList.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Unauthorized.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

const String kCurrentOrdersList = "/orders_list_screen";
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
          name: kNotAuthorizedOperator,
          page: () => UnauthorizedDeliveryOperator(),
        )
      ] +
      SharedRouter.sharedRoutes;
}
