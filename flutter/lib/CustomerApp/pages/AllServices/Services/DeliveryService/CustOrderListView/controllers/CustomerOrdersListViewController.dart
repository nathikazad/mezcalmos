import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';

class CustomerOrdersListViewController {
  // instances //
  AuthController _authController = Get.find<AuthController>();
  CustomerOrderController orderController = Get.find<CustomerOrderController>();

  // state variables //
  List<MinimalOrder> get currentOrders => orderController.currentOrders.value;
  List<MinimalOrder> get pastOrders => orderController.pastOrders.value;

  // getters //
  bool get hasOrders =>
      orderController.currentOrders.length + orderController.pastOrders.length >
      0;

  // methods //
  Future<void> init() async {
    await orderController.fetchPastOrders();
  }

  void dispose() {}
}
