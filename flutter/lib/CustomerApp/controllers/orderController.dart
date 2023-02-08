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
  RxList<MinimalOrder> restOrders = <MinimalOrder>[].obs;
  RxList<MinimalOrder> laundryOrders = <MinimalOrder>[].obs;

  RxList<Order> pastOrders = <Order>[].obs;

  // streams //
  StreamSubscription<List<MinimalOrder>?>? currentRestaurantOrdersStream;
  StreamSubscription<List<MinimalOrder>?>? currentLaundryOrdersStream;
  String? subscriptionId;

  @override
  void onInit() {
    super.onInit();
    mezDbgPrint(
        "--------------------> OrderController Initialized ! and the user uid is ${_authController.fireAuthUser?.uid} ");
    if (_authController.fireAuthUser?.uid != null) {
      fetchOrders();
      // _listenOnOrders();
    } else {
      mezDbgPrint("User is not signed it to init order controller");
    }
  }

  Future<void> fetchOrders() async {
    restOrders.value = await get_customer_rest_orders(
            customerId: _authController.hasuraUserId!) ??
        [];
    laundryOrders.value = await get_customer_laundry_orders(
            customerId: _authController.hasuraUserId!) ??
        [];
    laundryOrders.refresh();
    restOrders.refresh();

    mezDbgPrint(
        "After fetching 👋 ===> \n laundry orders : ${laundryOrders.length} \n rest orders : ${restOrders.length} ");
  }

  void _listenOnOrders() {
    subscriptionId = _hasuraDb.createSubscription(start: () {
      currentRestaurantOrdersStream = listen_on_customer_rest_orders(
              customerId: _authController.hasuraUserId!)
          .listen((List<MinimalOrder>? event) {
        if (event != null) {
          mezDbgPrint(
              "Stream triggred from customer order controller ✅✅✅✅✅✅✅✅✅ =====> $event");
          restOrders.clear();
          restOrders.value = event;
          restOrders.refresh();
          mezDbgPrint("rest orders length ==========>${restOrders.length}");
        }
      });
      currentLaundryOrdersStream = listen_on_customer_laundry_orders(
              customerId: _authController.hasuraUserId!)
          .listen((List<MinimalOrder>? event) {
        if (event != null) {
          mezDbgPrint(
              "Laundry Stream triggred from customer order controller ✅✅✅✅✅✅✅✅✅ =====> $event");
          laundryOrders.clear();
          laundryOrders.value = event;
          laundryOrders.refresh();
          mezDbgPrint(
              "laundry orders length ==========>${laundryOrders.length}");
        }
      });
    }, cancel: () {
      currentRestaurantOrdersStream?.cancel();
      currentRestaurantOrdersStream = null;
      currentLaundryOrdersStream?.cancel();
      currentLaundryOrdersStream = null;
    });
  }

  // Future<void> fetchCustomerOrders() async {
  //   final List<RestaurantOrder> _orders =
  //       await get_customer_orders(customer_id: _authController.user!.hasuraId);
  //   currentOrders.value = _orders
  //       .where((RestaurantOrder element) => element.inProcess())
  //       .toList();
  //   pastOrders.value = _orders
  //       .where((RestaurantOrder element) => !element.inProcess())
  //       .toList();
  // }

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
    return restOrders.length + laundryOrders.length == 1;
  }

  bool get hasManyOrders {
    return restOrders.length > 1 || laundryOrders.length > 1;
  }

  int? get hasOneOrderId {
    if (hasOneOrder) {
      return restOrders.isNotEmpty
          ? restOrders.first.id
          : laundryOrders.first.id;
    }
    return null;
  }

  OrderType? get hasOneOrderType {
    if (hasOneOrder) {
      return restOrders.isNotEmpty
          ? restOrders.first.orderType
          : laundryOrders.first.orderType;
    }
    return null;
  }

  @override
  void onClose() {
    print("[+] OrderController::onClose ---------> Was invoked !");
    currentLaundryOrdersStream?.cancel();
    currentRestaurantOrdersStream?.cancel();
    currentOrders.close();
    pastOrders.close();

    super.onClose();
  }
}
