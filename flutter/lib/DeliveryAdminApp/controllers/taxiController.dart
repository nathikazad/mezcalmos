import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';

class TaxiOrderController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  ForegroundNotificationsController _fbNotificationsController =
      Get.find<ForegroundNotificationsController>();
  RxList<TaxiOrder> inProcessOrders = <TaxiOrder>[].obs;
  RxList<TaxiOrder> pastOrders = <TaxiOrder>[].obs;
  RxList<TaxiOrder> openOrders = <TaxiOrder>[].obs;
  StreamSubscription? inProcessOrdersListener;
  StreamSubscription? _pastOrdersListener;
  StreamSubscription? _openOrdersListener;

  @override
  void onInit() {
    mezDbgPrint("--------------------> TaxisOrderController Initialized !");

    _openOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(taxiOpenOrdersNode())
        .onValue
        .listen((event) {
      List<TaxiOrder> orders = [];
      if (event.snapshot.value != null) {
        for (var orderId in event.snapshot.value.keys) {
          dynamic orderData = event.snapshot.value[orderId];
          orders.add(TaxiOrder.fromData(orderId, orderData));
        }
      }
      openOrders.value = orders;
    });

    inProcessOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(taxiInProcessOrdersNode())
        .onValue
        .listen((event) {
      List<TaxiOrder> orders = [];
      if (event.snapshot.value != null) {
        for (var orderId in event.snapshot.value.keys) {
          dynamic orderData = event.snapshot.value[orderId];
          orders.add(TaxiOrder.fromData(orderId, orderData));
        }
      }
      inProcessOrders.value = orders;
    });

    _pastOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(taxiPastOrdersNode())
        .orderByChild('orderTime')
        .limitToLast(5)
        .onChildAdded
        .listen((event) {
      pastOrders
          .add(TaxiOrder.fromData(event.snapshot.key, event.snapshot.value));
    });

    super.onInit();
  }

  @override
  void onClose() async {
    mezDbgPrint("[+] OrderController::dispose ---------> Was invoked !");
    inProcessOrdersListener?.cancel();
    _pastOrdersListener?.cancel();
    _openOrdersListener?.cancel();
    pastOrders.clear();
    inProcessOrders.clear();
    openOrders.clear();
    super.onClose();
  }

  TaxiOrder? getOrder(String orderId) {
    try {
      return openOrders.firstWhere((order) {
        return order.orderId == orderId;
      },
          orElse: () => inProcessOrders.firstWhere((order) {
                return order.orderId == orderId;
              },
                  orElse: () => pastOrders.firstWhere((order) {
                        return order.orderId == orderId;
                      })));
    } on StateError {
      return null;
    }
  }

  bool isPast(TaxiOrder order) {
    return pastOrders.contains(order);
  }

  Stream<TaxiOrder?> getOpenOrderStream(String orderId) {
    return openOrders.stream.map<TaxiOrder?>((_) {
      try {
        return openOrders.firstWhere(
          (currentOrder) => currentOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        return null;
      }
    });
  }

  Stream<TaxiOrder?> getInProcessOrderStream(String orderId) {
    return inProcessOrders.stream.map<TaxiOrder?>((_) {
      try {
        return inProcessOrders.firstWhere(
          (currentOrder) => currentOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        return null;
      }
    });
  }

  Stream<TaxiOrder?> getPastOrderStrem(String orderId) {
    return pastOrders.stream.map<TaxiOrder?>((_) {
      try {
        return pastOrders.firstWhere(
          (currentOrder) => currentOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        return null;
      }
    });
  }

  Future<ServerResponse> forwardToLocalCompany(String orderId) async {
    mezDbgPrint('Function called');

    return _callTaxiCloudFunction("forwardToLocalCompany", orderId);
  }

  Future<ServerResponse> submitForwardResult(
      {required String orderId,
      required bool forwardSuccessful,
      String? taxiNumber}) async {
    return _callTaxiCloudFunction("submitForwardResult", orderId,
        optionalParams: <String, dynamic>{
          "forwardSuccessful": forwardSuccessful,
          "taxiNumber": taxiNumber
        });
  }

  Future<ServerResponse> _callTaxiCloudFunction(
      String functionName, String orderId,
      {Map<String, dynamic>? optionalParams}) async {
    mezDbgPrint('Function called');
    HttpsCallable dropOrderFunction =
        FirebaseFunctions.instance.httpsCallable('taxi-$functionName');
    try {
      HttpsCallableResult response = await dropOrderFunction
          .call({"orderId": orderId, ...optionalParams ?? {}});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
}
