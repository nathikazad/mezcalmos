import 'package:get/get.dart'; // getX
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Laundry/LaundryOrderView.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Restaurant/RestaurantOrderView.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrdersListScreen/CurrentOrdersListScreen.dart';
import 'package:mezcalmos/DeliveryApp/pages/DeliveryWrapper.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrderDetails/OrderDetailsScreen.dart';
import 'package:mezcalmos/DeliveryApp/pages/PastOrders/PastOrdersView.dart';
import 'package:mezcalmos/Shared/routes/sharedRouter.dart';

const String kCurrentOrdersListRoute = '/orders';
const String kLaundryOrderView = '/laundryOrders/:orderId';
const String kRestaurantOrderView = '/restaurantOrders/:orderId';
const String kOrderDetailsView = "/orderDetails/:orderId";
const String kPastOrdersView = "/pastOrders";
String getLaundryOrderRoute(String orderId) {
  return kLaundryOrderView.replaceFirst(":orderId", orderId);
}

String getRestaurantOrderRoute(String orderId) {
  return kRestaurantOrderView.replaceFirst(":orderId", orderId);
}

String getOrderDetailsRoute(String orderId) {
  return kOrderDetailsView.replaceFirst(":orderId", orderId);
}

// GetX based Router (For navigating)
class XRouter {
  static dynamic mainRoutes = [
        GetPage(
            name: kCurrentOrdersListRoute,
            page: () => CurrentOrdersListScreen()),
        GetPage(name: kHomeRoute, page: () => DeliveryWrapper()),
        GetPage(name: kLaundryOrderView, page: () => LaundryOrderView()),
        GetPage(name: kRestaurantOrderView, page: () => RestaurantOrderView()),
        GetPage(name: kOrderDetailsView, page: () => OrderDetailsScreen()),
        GetPage(name: kPastOrdersView, page: () => DriverPastOrdersView()),
      ] +
      SharedRouter.sharedRoutes;
}
