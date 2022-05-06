import 'package:get/get.dart'; // getX
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Laundry/LaundryOrderView.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Restaurant/RestaurantOrderView.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrdersListScreen/CurrentOrdersListScreen.dart';
import 'package:mezcalmos/DeliveryApp/pages/DeliveryWrapper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

const String kCurrentOrdersListRoute = '/orders';
const String kLaundryOrderView = '/laundryOrders/:orderId';
const String kRestaurantOrderView = '/restaurantOrders/:orderId';

String getLaundryOrderRoute(String orderId) {
  return kLaundryOrderView.replaceFirst(":orderId", orderId);
}

String getRestaurantOrderRoute(String orderId) {
  return kRestaurantOrderView.replaceFirst(":orderId", orderId);
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
      ] +
      SharedRouter.sharedRoutes;
}
