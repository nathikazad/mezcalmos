import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/customer/hsCustomer.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class CustomerOrderController extends GetxController {
  HasuraDb _hasuraDb = Get.find<HasuraDb>();
  AuthController _authController = Get.find<AuthController>();

  RxList<MinimalOrder> currentOrders = <MinimalOrder>[].obs;

  RxList<MinimalOrder> pastOrders = <MinimalOrder>[].obs;

  // streams //
  StreamSubscription<List<MinimalOrder>?>? currentOrdersStream;

  String? subscriptionId;

  @override
  void onInit() {
    super.onInit();
    mezDbgPrint(
        "--------------------> OrderController Initialized ! and the user uid is ${_authController.fireAuthUser?.uid} ");
    if (_authController.fireAuthUser?.uid != null) {
      fetchCurrentOrders();
      _listenOnOrders();
      // _listenOnOrders();
    } else {
      mezDbgPrint("User is not signed it to init order controller");
    }
  }

  Future<void> fetchCurrentOrders() async {
    currentOrders.value = await get_customer_orders(
        customerId: _authController.hasuraUserId!, inProcess: true);
    currentOrders.refresh();
  }

  Future<void> fetchPastOrders() async {
    pastOrders.value = await get_customer_orders(
        customerId: _authController.hasuraUserId!, inProcess: false);
    pastOrders.refresh();
  }

  void _listenOnOrders() {
    subscriptionId = _hasuraDb.createSubscription(start: () {
      currentOrdersStream =
          listen_on_customer_orders(customerId: _authController.hasuraUserId!)
              .listen((List<MinimalOrder>? event) {
        if (event != null) {
          mezDbgPrint(
              "Stream triggred from customer order controller ✅✅✅✅✅✅✅✅✅ =====> $event");

          currentOrders.value = event;
          currentOrders.refresh();
        }
      });
    }, cancel: () {
      currentOrdersStream?.cancel();
      currentOrdersStream = null;
    });
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

  bool get hasOneOrder {
    return currentOrders.length == 1;
  }

  bool get hasManyOrders {
    return currentOrders.length > 1;
  }

  int? firstOrderIdBasedOnType(OrderType type) {
    return currentOrders
        .firstWhereOrNull((MinimalOrder element) => element.orderType == type)
        ?.id;
  }

  int? get hasOneOrderId {
    if (hasOneOrder) {
      return currentOrders.first.id;
    }
    return null;
  }

  OrderType? get hasOneOrderType {
    if (hasOneOrder) {
      return currentOrders.first.orderType;
    }
    return null;
  }

  @override
  void onClose() {
    print("[+] OrderController::onClose ---------> Was invoked !");

    currentOrdersStream?.cancel();
    currentOrders.close();
    pastOrders.close();

    super.onClose();
  }
}
