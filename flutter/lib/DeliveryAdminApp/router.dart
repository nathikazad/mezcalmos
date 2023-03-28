import 'package:mezcalmos/DeliveryAdminApp/pages/DvOpTabsView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrderView/DvCompanyOrderView.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class DeliveryAdminRoutes {
  static const String kDeliveryOpHomeScreenRoute = '/home';

  static const String kNotAuthorizedOperatorRoute = "/unauthorized";
  static const String kOrderViewRoute = "/orders/:orderId";

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
          path: kOrderViewRoute,
          name: kOrderViewRoute,
          builder: () => DvCompanyOrderView(),
        ),
      ] +
      SharedRoutes.qRoutes +
      SharedServiceProviderRoutes.routes +
      NativeOnlyRoutes.routes;
}
