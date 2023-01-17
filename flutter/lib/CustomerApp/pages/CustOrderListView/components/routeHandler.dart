import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

void handleRouting(Order order) {
  switch (order.orderType) {
    case OrderType.Restaurant:
      Get.toNamed(getRestaurantOrderRoute(order.orderId));

      break;
    case OrderType.Laundry:
      Get.toNamed(getLaundryOrderRoute(order.orderId));

      break;
    case OrderType.Taxi:
      Get.toNamed(getTaxiOrderRoute(order.orderId));

      break;
    default:
  }
}
