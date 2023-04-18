import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/OrderViewPage/order_view_page.dart'
    deferred as orderViewPage;

class OrderRoutes {
  static String orderViewRoute = "/orderView";

  final List<QRoute> routes = [
    QRoute(
        name: orderViewRoute,
        path: orderViewRoute,
        builder: () => orderViewPage.OrderViewPage(),
        middleware: <QMiddleware>[
          DefferedLoader(orderViewPage.loadLibrary),
        ]),
  ];
}
