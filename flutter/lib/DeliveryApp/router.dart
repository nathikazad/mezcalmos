import 'package:mezcalmos/DeliveryApp/pages/DeliveryWrapper.dart';
import 'package:mezcalmos/DeliveryApp/pages/DvConvoView/DvConvoView.dart';
// import '../../old/DeliveryApp/OrderDetails/DvOrderDetailsView.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/CurrentOrdersListScreen.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/PastOrdersView.dart';
// import '../../old/DeliveryApp/SingleOrder/DvOrderView.dart';
import 'package:mezcalmos/DeliveryApp/pages/Unauthorized/UnAuthrizedDriverView.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class DeliveryAppRoutes {
  static const String kCurrentOrdersListRoute = '/currentOrders';
  static const String kDvOrderView = '/orders/:orderId';
  static const String kOrderDetailsViewRoute = "/orderDetails/:orderId";
  static const String kPastOrdersViewRoute = "/pastOrders";
  static const String kDriverUnAuthRoute = "/driverUnauth";
  static const String kDriverConvoRoute = "/convo/:phoneNumber";

  static String getDvOrderRoute(int orderId) {
    return kDvOrderView.replaceFirst(":orderId", "$orderId");
  }

  static final List<QRoute> mainRoutes = <QRoute>[
        QRoute(
          path: kCurrentOrdersListRoute,
          name: kCurrentOrdersListRoute,
          builder: () => CurrentOrdersListScreen(),
        ),
        QRoute(
          path: kDriverConvoRoute,
          name: kDriverConvoRoute,
          builder: () => DvConvoView(),
        ),
        QRoute(
          path: SharedRoutes.kHomeRoute,
          name: SharedRoutes.kHomeRoute,
          builder: () => DeliveryWrapper(),
        ),
        // QRoute(
        //   path: kDvOrderView,
        //   name: kDvOrderView,
        //   builder: () => DvOrderView(),
        // ),
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
      NativeOnlyRoutes.routes;
}
