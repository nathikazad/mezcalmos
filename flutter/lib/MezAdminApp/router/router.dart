import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/MezAdminApp/MezAdminWrapper.dart'
    deferred as mezAdminWrapper;
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/AdminTabsView.dart'
    deferred as adminTabsView;
import 'package:mezcalmos/MezAdminApp/pages/ServiceOrdersView/AdminServiceOrdersView.dart'
    deferred as adminServiceOrdersView;
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
            builder: () => adminTabsView.AdminTabsView(),
            middleware: <QMiddleware>[
              DefferedLoader(adminTabsView.loadLibrary)
            ]),
        // GetPage(name: kTabsView, page: () => AdminTabsView()),
        QRoute(
            path: SharedRoutes.kHomeRoute,
            name: SharedRoutes.kHomeRoute,
            builder: () => mezAdminWrapper.MezAdminWrapper(),
            middleware: <QMiddleware>[
              DefferedLoader(mezAdminWrapper.loadLibrary)
            ]),

        QRoute(
            path: kServiceOrdersRoute,
            name: kServiceOrdersRoute,
            builder: () => adminServiceOrdersView.AdminServiceOrdersView(),
            middleware: <QMiddleware>[
              DefferedLoader(adminServiceOrdersView.loadLibrary)
            ]),
      ] +
      SharedRoutes.qRoutes +
      SharedServiceProviderRoutes.routes;
//  +
// NativeOnlyRoutes.routes;
}
