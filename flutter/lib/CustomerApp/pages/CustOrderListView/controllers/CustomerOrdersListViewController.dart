import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/customer/hsCustomer.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

class CustomerOrdersListViewController {
  // instances //
  AuthController _authController = Get.find<AuthController>();

  // state variables //
  RxList<RestaurantOrder> currentOrders = RxList.empty();
  RxList<RestaurantOrder> pastOrders = RxList.empty();

  // getters //
  bool get hasOrders => currentOrders.length + pastOrders.length > 0;

  // methods //
  Future<void> init() async {
    await get_customer_orders(customer_id: _authController.hasuraUserId!)
        .then((List<RestaurantOrder> value) {
      currentOrders.value = value
          .where((RestaurantOrder element) => element.inProcess() == true)
          .toList();
      pastOrders.value = value
          .where((RestaurantOrder element) => element.inProcess() == false)
          .toList();
    });
  }

  void dispose() {}
}
