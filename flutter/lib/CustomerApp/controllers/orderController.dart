import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/customer/hsCustomer.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class CustomerOrderController extends GetxController {
  AuthController _authController = Get.find<AuthController>();
  // ForegroundNotificationsController _fbNotificationsController =
  //     Get.find<ForegroundNotificationsController>();
  RxList<Order> currentOrders = <Order>[].obs;
  RxList<Order> pastOrders = <Order>[].obs;

  @override
  void onInit() {
    super.onInit();
    mezDbgPrint(
        "--------------------> OrderController Initialized ! and the user uid is ${_authController.fireAuthUser?.uid} ");
    if (_authController.fireAuthUser?.uid != null) {
      fetchCustomerOrders();
    } else {
      mezDbgPrint("User is not signed it to init order controller");
    }
  }

  Future<void> fetchCustomerOrders() async {
    final List<RestaurantOrder> _orders =
        await get_customer_orders(customer_id: _authController.user!.hasuraId);
    currentOrders.value = _orders
        .where((RestaurantOrder element) => element.inProcess())
        .toList();
    pastOrders.value = _orders
        .where((RestaurantOrder element) => !element.inProcess())
        .toList();
  }

  Future<ServerResponse> addReview({
    required int orderId,
    required int serviceId,
    required String comment,
    required OrderType orderType,
    required num rate,
  }) async {
    final HttpsCallable cancelOrder =
        FirebaseFunctions.instance.httpsCallable('restaurant-addReview');
    try {
      final HttpsCallableResult<dynamic> response =
          await cancelOrder.call(<String, dynamic>{
        "orderId": orderId,
        "serviceProviderId": serviceId,
        "rating": rate,
        "comment": comment,
        "orderType": orderType.toFirebaseFormatString(),
      });
      mezDbgPrint(response.toString());
      print(response.data);
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  @override
  Future<void> onClose() async {
    print("[+] OrderController::onClose ---------> Was invoked !");
    currentOrders.close();
    pastOrders.close();

    super.onClose();
  }
}
