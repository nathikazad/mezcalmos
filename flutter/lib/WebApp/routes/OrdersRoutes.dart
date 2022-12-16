import 'package:mezcalmos/WebApp/routes/Deferred_loader.dart';
import 'package:mezcalmos/WebApp/screens/ordersScreen/orderViewScreen/OrderViewScreen.dart'
    deferred as orderViewScreen;
import 'package:mezcalmos/WebApp/screens/ordersScreen/OrdersScreen.dart'
    deferred as OrdersList;
import 'package:qlevar_router/qlevar_router.dart';

class OrdersRoutes {
  static const String orders = "orders";
  static const String orderById = "orderId";
  final routes = QRoute(
      path: "/orders",
      name: orders,
      middleware: [DefferedLoader(OrdersList.loadLibrary)],
      builder: () => OrdersList.OrdersScreen(),
      children: [
        QRoute(
          path: "/:orderId",
          name: orderById,
          middleware: [DefferedLoader(orderViewScreen.loadLibrary)],
          builder: () => orderViewScreen.OrderViewScreen(),
        )
      ]);
}
