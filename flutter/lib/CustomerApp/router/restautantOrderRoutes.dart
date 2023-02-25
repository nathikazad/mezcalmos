import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/CustRestaurantOrderView.dart'
    deferred as restaurantOrder;
import 'package:qlevar_router/qlevar_router.dart';

class RestaurantOrderRoutes {
  static const String restaurantOrders = '/restaurantOrders';

  String getRestaurantOrderRoute(int orderId) => '/restaurantOrders/$orderId';

  final routes = QRoute(
      path: restaurantOrders,
      name: restaurantOrders,
      builder: () => restaurantOrder.ViewRestaurantOrderScreen());
}
