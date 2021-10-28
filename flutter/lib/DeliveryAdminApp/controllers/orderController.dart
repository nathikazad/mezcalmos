import 'package:mezcalmos/DeliveryAdminApp/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class OrderController extends GetxController {
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();
  late Stream<List<Order>> ordersStream;
  List<Order> inProcessOrders = [];
  @override
  void onInit() {
    print("--------------------> RestaurantsOrderController Initialized !");
    ordersStream = _databaseHelper.firebaseDatabase
        .reference()
        .child(inProcessOrdersNode())
        .onValue
        .map<List<Order>>((event) {
      List<Order> orders = [];
      if (event.snapshot.value != null) {
        event.snapshot.value.forEach((dynamic orderId, dynamic orderData) {
          orders.add(RestaurantOrder.fromData(orderId, orderData));
        });
      }
      inProcessOrders = orders;
      return orders;
    });
    super.onInit();
  }

  Stream<Order> getCurrentOrder(String orderId) {
    return ordersStream.map<Order>((orders) {
      return orders
          .firstWhere((currentOrder) => currentOrder.orderId == orderId);
    });
  }

  Future<ServerResponse> cancelOrder(String orderId) async {
    HttpsCallable cancelOrder =
        FirebaseFunctions.instance.httpsCallable('cancelOrderFromAdmin');
    try {
      HttpsCallableResult response =
          await cancelOrder.call({"orderId": orderId});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> prepareOrder(String orderId) async {
    mezDbgPrint("prepare order");
    HttpsCallable prepareOrderFunction =
        FirebaseFunctions.instance.httpsCallable('prepareOrder');
    try {
      HttpsCallableResult response =
          await prepareOrderFunction.call({"orderId": orderId});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> readyForPickupOrder(String orderId) async {
    HttpsCallable readyForPickupOrderFunction =
        FirebaseFunctions.instance.httpsCallable('readyForPickupOrder');
    try {
      HttpsCallableResult response =
          await readyForPickupOrderFunction.call({"orderId": orderId});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> deliverOrder(String orderId) async {
    HttpsCallable deliverOrderFunction =
        FirebaseFunctions.instance.httpsCallable('deliverOrder');
    try {
      HttpsCallableResult response =
          await deliverOrderFunction.call({"orderId": orderId});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> dropOrder(String orderId) async {
    HttpsCallable dropOrderFunction =
        FirebaseFunctions.instance.httpsCallable('dropOrder');
    try {
      HttpsCallableResult response =
          await dropOrderFunction.call({"orderId": orderId});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
}
