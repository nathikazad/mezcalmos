import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/customer/hsCustomer.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

class CustomerOrdersListViewController {
  // instances //
  AuthController _authController = Get.find<AuthController>();

  // state variables //
  Rxn<List<RestaurantOrder>> currentOrders = Rxn();
  Rxn<List<RestaurantOrder>> pastOrders = Rxn();

  // getters //
  bool get hasOrders =>
      currentOrders.value!.length + pastOrders.value!.length > 0;
  bool get hasData => currentOrders.value != null && pastOrders.value != null;

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
