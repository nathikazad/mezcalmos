import 'package:mezcalmos/Shared/routes/SharedDeliveryRoutes.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/TaxiApp/pages/OrdersList/TaxiCurrentOrdersListScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/OrdersList/TaxiPastOrdersView.dart';
import 'package:mezcalmos/TaxiApp/pages/TaxiWrapper.dart';
import 'package:qlevar_router/qlevar_router.dart';

class TaxiAppRoutes {
  static const String kCurrentOrdersListRoute = '/currentOrders';
  static const String kPastOrdersViewRoute = "/pastOrders";
  static const String kTaxiUnAuthRoute = "/taxiUnauth";

  static final List<QRoute> mainRoutes = <QRoute>[
        QRoute(
          path: kCurrentOrdersListRoute,
          name: kCurrentOrdersListRoute,
          builder: () => TaxiCurrentOrdersListScreen(),
        ),

        QRoute(
          path: SharedRoutes.kHomeRoute,
          name: SharedRoutes.kHomeRoute,
          builder: () => TaxiWrapper(),
        ),

        // QRoute(
        //   path: kOrderDetailsViewRoute,
        //   name: kOrderDetailsViewRoute,
        //   builder: () => OrderDetailsScreen(),
        // ),
        QRoute(
          path: kPastOrdersViewRoute,
          name: kPastOrdersViewRoute,
          builder: () => TaxiPastOrdersView(),
        ),
        // QRoute(
        //   path: kDriverUnAuthRoute,
        //   name: kDriverUnAuthRoute,
        //   builder: () => UnAuthorizedDriverView(),
        // ),
      ] +
      SharedRoutes.qRoutes +
      SharedDvRoutes.mainRoutes +
      NativeOnlyRoutes.routes;
}
