import 'package:mezcalmos/CustomerApp/pages/CustOrderListView/CustomerOrdersListView.dart'
    deferred as customerOrders;
import 'package:qlevar_router/qlevar_router.dart';

class OrdersRoutes {
  static const String customerOrder = '/orders';

  final routes = QRoute(
      path: customerOrder,
      name: customerOrder,
      builder: () => customerOrders.CustomerOrdersListView());
}
