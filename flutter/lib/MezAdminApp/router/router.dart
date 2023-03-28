import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/MezAdminApp/MezAdminWrapper.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/AdminTabsView.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServiceOrdersView/AdminServiceOrdersView.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class MezAdminRoutes {
  static const String kTabsViewRoute = '/deliveryOpHomeScreen';
  static const String kServiceOrdersRoute = '/serviceOrders/:serviceProviderId';
  static const String kDeliveryCostSetter = "/deliveryCostSetter";

  static final List<QRoute> mainRoutes = <QRoute>[
        QRoute(
          path: kTabsViewRoute,
          name: kTabsViewRoute,
          builder: () => AdminTabsView(),
        ),
        QRoute(
          path: SharedRoutes.kHomeRoute,
          name: SharedRoutes.kHomeRoute,
          builder: () => MezAdminWrapper(),
        ),
        QRoute(
          path: kServiceOrdersRoute,
          name: kServiceOrdersRoute,
          builder: () => AdminServiceOrdersView(),
        ),
      ] +
      SharedRoutes.qRoutes +
      SharedServiceProviderRoutes.routes;
//  +
// NativeOnlyRoutes.routes;
}
