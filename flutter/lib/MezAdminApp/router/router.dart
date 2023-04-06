import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/MezAdminApp/MezAdminWrapper.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/AdminTabsView.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServiceOrdersView/AdminServiceOrdersView.dart';
import 'package:mezcalmos/RestaurantApp/router/router.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class MezAdminRoutes {
  static const String kTabsViewRoute = '/mezAdminHome';
  static const String kServiceOrdersRoute = '/serviceOrders/:serviceProviderId';

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
      RestaurantAppRoutes.sharedWithAdminRoutes +
      LaundryAppRoutes.sharedWithAdminRoutes +
      DeliveryAdminRoutes.sharedWitAdminRoutes +
      SharedServiceProviderRoutes.routes +
      NativeOnlyRoutes.routes;
}
