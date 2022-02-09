import 'dart:async';
import 'dart:collection';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/firebaseNodes/ordersNode.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;

class IncomingOrdersController extends GetxController {
  RxList<TaxiOrder> orders = <TaxiOrder>[]
      .obs; // this is observable which will be constaintly changing in realtime .
  AuthController _authController =
      Get.find<AuthController>(); // since it's already injected .
  TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();

  FirebaseDb _databaseHelper =
      Get.find<FirebaseDb>(); // Already Injected in main function

  // Storing all the needed Listeners here
  Worker? _updateOrderDistanceToClient;
  StreamSubscription? _incomingOrdersListener;

  @override
  void onInit() async {
    // _selectedIncommingOrder.value = null;
    super.onInit();
    mezDbgPrint("IncomingOrdersController init");

      // Added TaxiOrder!
    mezDbgPrint("Gonna start listen on : ${rootTaxiOpenOrdersNode()} !!");
    _incomingOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(rootTaxiOpenOrdersNode())
        .onValue
        .listen((event) async {
      mezDbgPrint("Open Orders Node");
      mezDbgPrint(event.snapshot.value);
      List<TaxiOrder> ordersFromSnapshot = <TaxiOrder>[];
      if (event.snapshot.value != null) {
        mezDbgPrint("s@s:Ordeeeeer ==> ${event.snapshot.value}");
        event.snapshot.value?.forEach((dynamic key, dynamic value) async {
          // this is made to avoid 1 key being in the event.snapshot
          // happening becasause.
          if (value.keys.length > 1) {
            TaxiOrder order = TaxiOrder.fromData(key, value);
            order.distanceToClient = MapHelper.calculateDistance(
                order.from.position, _taxiAuthController.currentLocation);
            ordersFromSnapshot.add(order);
            try {
              await markOrderAsReceived(key, order.customer.id);
            } on PlatformException catch (_) {
              // do nothing
            }
          }
        });

        ordersFromSnapshot
            .sort((a, b) => a.distanceToClient.compareTo(b.distanceToClient));
        orders.value = ordersFromSnapshot;
        mezDbgPrint(orders);
      } else {
        orders.value = [];
      }
    });
    _updateOrderDistanceToClient?.dispose();
    _updateOrderDistanceToClient =
        ever(_taxiAuthController.currentLocationRx, (userLocation) {
      // mezDbgPrint("Updating distances");
      orders.forEach((order) {
        order.distanceToClient = MapHelper.calculateDistance(
            order.from.position, userLocation as LocationData);
      });
      orders.sort((a, b) => a.distanceToClient.compareTo(b.distanceToClient));
    });
    

    // _appLifeCycleController.attachCallback(AppLifecycleState.resumed, () {
    //   mezDbgPrint("[+] Callback executed :: app resumed !");
    //   orders.forEach((element) {
    //     _databaseHelper.firebaseDatabase
    //         .reference()
    //         .child(notificationStatusReadNode(
    //             element.orderId, _authController.user!.uid))
    //         .set(true);
    //   });
    // });
  }

  TaxiOrder? getOrder(String orderId) {
    try {
      return orders.firstWhere((order) {
        return order.orderId == orderId;
      });
    } on StateError {
      return null;
    }
  }

  Future<void> markOrderAsRead(String orderId, String customerId) async {
    TaxiOrder? tmpOrderCheck;
    try {
      tmpOrderCheck = orders.firstWhere((order) => order.orderId == orderId);
    } on StateError catch (_) {
      tmpOrderCheck = null;
    }
    if (tmpOrderCheck != null) {
      await _databaseHelper.firebaseDatabase
          .reference()
          .child(rootOpenOrderReadNode(orderId, _authController.user!.id))
          .set(true);
      await _databaseHelper.firebaseDatabase
          .reference()
          .child(customerInProcessOrderReadNode(
              orderId, customerId, _authController.user!.id))
          .set(true);
    }
  }

  Future<void> markOrderAsReceived(String orderId, String customerId) async {
    TaxiOrder? tmpOrderCheck;
    try {
      tmpOrderCheck = orders.firstWhere((order) => order.orderId == orderId);
    } on StateError catch (_) {
      tmpOrderCheck = null;
    }
    if (tmpOrderCheck != null) {
      await _databaseHelper.firebaseDatabase
          .reference()
          .child(rootOpenOrderReceivedNode(orderId, _authController.user!.id))
          .set(true);
      await _databaseHelper.firebaseDatabase
          .reference()
          .child(customerInProcessOrderReceivedNode(
              orderId, customerId, _authController.user!.id))
          .set(true);
    }
  }

  Stream<TaxiOrder?> getIncomingOrderStream(String orderId) {
    return orders.stream.map<TaxiOrder?>((_) {
      try {
        return orders.firstWhere(
          (incomingOrder) => incomingOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        return null;
      }
    });
  }

  // I added this to avoid possible dangling pointers ...
  void detachListeners() {
    _incomingOrdersListener?.cancel();
    _updateOrderDistanceToClient?.dispose();
    // _appLifeCycleController.cleanAllCallbacks();
  }

  Future<ServerResponse> acceptTaxi(String orderId) async {
    mezDbgPrint("Accept Taxi Called");
    HttpsCallable acceptTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('taxi-acceptRide');
    try {
      HttpsCallableResult response =
          await acceptTaxiFunction.call(<String, dynamic>{'orderId': orderId});
      mezDbgPrint(response.data.toString());
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      mezDbgPrint(e.toString());
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  @override
  void onClose() {
    mezDbgPrint(
        "Incoming ORDER CONTROLLER :: ::: :: :: : :   : :::::: DISPOSE ! ${this.hashCode}");
    detachListeners();
    super.onClose();
  }
}
