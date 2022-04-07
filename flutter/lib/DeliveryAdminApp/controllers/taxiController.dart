import 'dart:async';

import 'package:async/async.dart' show StreamGroup;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
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
        .listen((Event event) {
      final List<TaxiOrder> orders = [];

      mezDbgPrint("DATTTAAA ------------------> ${event.snapshot.value}");
      if (event.snapshot.value != null) {
        // mezDbgPrint("Priiiiint ------> bfore for ${event.snapshot.value}");
        for (var orderId in event.snapshot.value.keys) {
          mezDbgPrint("Priiiiint ------> Data ${event.snapshot.value}");
          mezDbgPrint("Priiiiint ------> orderID $orderId");
          final dynamic orderData = event.snapshot.value[orderId];
          orders.add(TaxiOrder.fromData(orderId, orderData));
        }
      }
      openOrders.value = orders;
    });

    inProcessOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(taxiInProcessOrdersNode())
        .onValue
        .listen((Event event) {
      final List<TaxiOrder> orders = [];
      if (event.snapshot.value != null) {
        mezDbgPrint(
            "new data for inprocess orders -----------§§§§§§§§§§§§§§§§§§§§");
        for (var orderId in event.snapshot.value.keys) {
          final dynamic orderData = event.snapshot.value[orderId];
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
        .listen((Event event) {
      pastOrders
          .add(TaxiOrder.fromData(event.snapshot.key, event.snapshot.value));
    });

    super.onInit();
  }

  @override
  void onClose() async {
    mezDbgPrint("[+] OrderController::dispose ---------> Was invoked !");
    await inProcessOrdersListener?.cancel();
    await _pastOrdersListener?.cancel();
    await _openOrdersListener?.cancel();
    pastOrders.clear();
    inProcessOrders.clear();
    openOrders.clear();
    super.onClose();
  }

  TaxiOrder? getOrder(String orderId) {
    try {
      return openOrders.firstWhere((TaxiOrder order) {
        return order.orderId == orderId;
      },
          orElse: () => inProcessOrders.firstWhere((TaxiOrder order) {
                return order.orderId == orderId;
              },
                  orElse: () => pastOrders.firstWhere((TaxiOrder order) {
                        return order.orderId == orderId;
                      })));
    } on StateError {
      return null;
    }
  }

  bool isPast(TaxiOrder order) {
    return pastOrders.contains(order);
  }

  bool orderHaveNewMessageNotifications(String orderId) {
    return _fbNotificationsController
        .notifications()
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.orderId == orderId)
        .isNotEmpty;
  }

  Stream<TaxiOrder?> getOpenOrderStream(String orderId) {
    return openOrders.stream.map<TaxiOrder?>((_) {
      try {
        return openOrders.firstWhere(
          (TaxiOrder currentOrder) => currentOrder.orderId == orderId,
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
          (TaxiOrder currentOrder) => currentOrder.orderId == orderId,
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
          (TaxiOrder currentOrder) => currentOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        return null;
      }
    });
  }

// NEW STREAMS
  Stream<TaxiOrder?> getOrderStream(String orderId) {
    return StreamGroup.merge(<Stream<TaxiOrder?>>[
      _getOpenOrderStream(orderId),
      _getInProcessOrderStream(orderId),
      _getPastOrderStrem(orderId)
    ]);
  }

  Stream<TaxiOrder?> _getOpenOrderStream(String orderId) {
    return openOrders.stream.map<TaxiOrder?>((_) {
      try {
        return openOrders.firstWhere(
          (TaxiOrder currentOrder) => currentOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        // return null;
      }
      return null;
    });
  }

  Stream<TaxiOrder?> _getInProcessOrderStream(String orderId) {
    return inProcessOrders.stream.map<TaxiOrder?>((_) {
      try {
        return inProcessOrders.firstWhere(
          (TaxiOrder currentOrder) => currentOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        // return null;
      }
      return null;
    });
  }

  Stream<TaxiOrder?> _getPastOrderStrem(String orderId) {
    return pastOrders.stream.map<TaxiOrder?>((_) {
      try {
        return pastOrders.firstWhere(
          (TaxiOrder currentOrder) => currentOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        // return null;
      }
      return null;
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
    final HttpsCallable dropOrderFunction =
        FirebaseFunctions.instance.httpsCallable('taxi-$functionName');
    try {
      final HttpsCallableResult response = await dropOrderFunction
          .call({"orderId": orderId, ...optionalParams ?? {}});
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
}
