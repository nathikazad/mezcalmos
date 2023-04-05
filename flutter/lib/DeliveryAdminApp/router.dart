import 'package:mezcalmos/DeliveryAdminApp/pages/DvOpTabsView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrderView/DvCompanyOrderView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrdersListViews/DvOpPastOrdersList.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class DeliveryAdminRoutes {
  static const String kDeliveryOpHomeScreenRoute = '/home';
  static const String kDeliveryOpPastOrdersRoute = '/pastOrders';

  static const String kNotAuthorizedOperatorRoute = "/unauthorized";
  static const String kOrderViewRoute = "/deliveryOrders/:orderId";

  static String getDvCompanyOrderRoute(int orderId) {
    return kOrderViewRoute.replaceFirst(":orderId", "$orderId");
  }

  static final List<QRoute> mainRoutes = <QRoute>[
        QRoute(
          path: kDeliveryOpHomeScreenRoute,
          name: kDeliveryOpHomeScreenRoute,
          builder: () => DvOpTabsView(),
        ),
        QRoute(
          path: kDeliveryOpPastOrdersRoute,
          name: kDeliveryOpPastOrdersRoute,
          builder: () => DvOpPastOrdersView(),
        ),
      ] +
      sharedWitAdminRoutes +
      SharedRoutes.qRoutes +
      SharedServiceProviderRoutes.routes +
      NativeOnlyRoutes.routes;
  static final List<QRoute> sharedWitAdminRoutes = [
    QRoute(
      path: kOrderViewRoute,
      name: kOrderViewRoute,
      builder: () => DvCompanyOrderView(),
    ),
  ];
}
