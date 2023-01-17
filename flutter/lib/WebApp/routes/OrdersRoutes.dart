import 'package:mezcalmos/WebApp/routes/Deferred_loader.dart';
import 'package:mezcalmos/WebApp/screens/Orders/CustOredrsListView/CustOredrsListView.dart'
    deferred as orderViewScreen;
import 'package:mezcalmos/WebApp/screens/Orders/CustOrderView/CustOrderView.dart'
    deferred as OrdersList;
import 'package:qlevar_router/qlevar_router.dart';

class OrdersRoutes {
  static const String orders = "orders";
  static const String orderById = "orderId";
  final routes = QRoute(
      path: "/orders",
      name: orders,
      middleware: [DefferedLoader(OrdersList.loadLibrary)],
      builder: () => OrdersList.CustOrdersView(),
      children: [
        QRoute(
          path: "/:orderId",
          name: orderById,
          middleware: [DefferedLoader(orderViewScreen.loadLibrary)],
          builder: () => orderViewScreen.CustOredrsListView(),
        )
      ]);
}
