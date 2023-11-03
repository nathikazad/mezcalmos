import 'package:mezcalmos/Shared/routes/SharedDeliveryRoutes.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/TaxiApp/pages/OrdersList/TaxiCurrentOrdersListScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/OrdersList/TaxiPastOrdersView.dart';
import 'package:mezcalmos/TaxiApp/pages/TaxiOrderView/TaxiOrderView.dart';
import 'package:mezcalmos/TaxiApp/pages/TaxiWrapper.dart';
import 'package:qlevar_router/qlevar_router.dart';

class TaxiAppRoutes {
  static const String kCurrentOrdersListRoute = '/taxiCurrentOrders';
  static const String kPastOrdersViewRoute = "/taxiPastOrders";
  static const String kTaxiUnAuthRoute = "/taxiUnauth";
  static const String kOrderView = "/:orderId";

  static final List<QRoute> mainRoutes = <QRoute>[
        QRoute(
          path: kCurrentOrdersListRoute,
          name: kCurrentOrdersListRoute,
          builder: () => TaxiCurrentOrdersListScreen(),
        ),
        QRoute(
          path: kOrderView,
          name: kOrderView,
          builder: () => TaxiOrderView(),
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
