import 'package:mezcalmos/CustomerApp/pages/CustOrderListView/CustomerOrdersListView.dart'
    deferred as customerOrders;
import 'package:qlevar_router/qlevar_router.dart';

class OrdersRoutes {
  static const String customerOrdersRoute = '/orders';

  final routes = QRoute(
      path: customerOrdersRoute,
      name: customerOrdersRoute,
      builder: () => customerOrders.CustomerOrdersListView());
}
