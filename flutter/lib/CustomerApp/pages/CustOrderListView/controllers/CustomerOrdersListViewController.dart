import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/customer/hsCustomer.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

class CustomerOrdersListViewController {
  // instances //
  AuthController _authController = Get.find<AuthController>();

  // state variables //
  RxList<RestaurantOrder> currentOrders = RxList.empty();
  RxList<RestaurantOrder> pastOrders = RxList.empty();
  RxList<MinimalOrder> inProcessOrder = RxList.empty();

  // getters //
  bool get hasOrders =>
      currentOrders.length + pastOrders.length + inProcessOrder.length > 0;

  // methods //
  Future<void> init() async {
    inProcessOrder.clear();

    List<MinimalOrder> laundryOrders = await get_customer_laundry_orders(
            customerId: _authController.hasuraUserId!) ??
        [];
    List<MinimalOrder> restaurantOrders = await get_customer_rest_orders(
            customerId: _authController.hasuraUserId!) ??
        [];
    inProcessOrder.value.addAll(restaurantOrders + laundryOrders);
    inProcessOrder.refresh();
  }

  void dispose() {}
}
