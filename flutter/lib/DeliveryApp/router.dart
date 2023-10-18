import 'package:mezcalmos/DeliveryApp/pages/DeliveryWrapper.dart';
// import '../../old/DeliveryApp/OrderDetails/DvOrderDetailsView.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/CurrentOrdersListScreen.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/PastOrdersView.dart';
// import '../../old/DeliveryApp/SingleOrder/DvOrderView.dart';
import 'package:mezcalmos/DeliveryApp/pages/Unauthorized/UnAuthrizedDriverView.dart';
import 'package:mezcalmos/Shared/routes/SharedDeliveryRoutes.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class DeliveryAppRoutes {
  static const String kCurrentOrdersListRoute = '/currentOrders';
  static const String kOrderDetailsViewRoute = "/orderDetails/:orderId";
  static const String kPastOrdersViewRoute = "/pastOrders";
  static const String kDriverUnAuthRoute = "/driverUnauth";

  static final List<QRoute> mainRoutes = <QRoute>[
        QRoute(
          path: kCurrentOrdersListRoute,
          name: kCurrentOrdersListRoute,
          builder: () => CurrentOrdersListScreen(),
        ),

        QRoute(
          path: SharedRoutes.kHomeRoute,
          name: SharedRoutes.kHomeRoute,
          builder: () => DeliveryWrapper(),
        ),

        // QRoute(
        //   path: kOrderDetailsViewRoute,
        //   name: kOrderDetailsViewRoute,
        //   builder: () => OrderDetailsScreen(),
        // ),
        QRoute(
          path: kPastOrdersViewRoute,
          name: kPastOrdersViewRoute,
          builder: () => DriverPastOrdersView(),
        ),
        QRoute(
          path: kDriverUnAuthRoute,
          name: kDriverUnAuthRoute,
          builder: () => UnAuthorizedDriverView(),
        ),
      ] +
      SharedRoutes.qRoutes +
      SharedDvRoutes.mainRoutes +
      NativeOnlyRoutes.routes;
}
