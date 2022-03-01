import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/taxiNodes.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/firebaseNodes/ordersNode.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/TaxiApp/models/CounterOffer.dart';

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

  /// submit counter offer for a particular order
  Future<void> submitCounterOffer(
      String orderId, String customerId, CounterOffer counterOffer) async {
    mezDbgPrint("Submiiiiiiit counter offer !");
    await _databaseHelper.firebaseDatabase
        .reference()
        .child(customersCounterOfferNode(
            orderId, customerId, _authController.fireAuthUser!.uid))
        .set(counterOffer.toFirebaseFormattedJson());

    await _databaseHelper.firebaseDatabase
        .reference()
        .child(inNegotationNode(_authController.fireAuthUser!.uid))
        .set(orderId);
  }

  /// the first counter offer event from customer
  /// a listener(or alarm at counter offer expiry time) should be
  /// started after submitting counter offer
  Future<CounterOffer> counterOfferEvent(String orderId, String customerId) {
    return _databaseHelper.firebaseDatabase
        .reference()
        .child(customersCounterOfferNode(
            orderId, customerId, _authController.fireAuthUser!.uid))
        .onChildChanged
        .where((event) {
          CounterOffer counterOffer =
              CounterOffer.fromData(event.snapshot.value);
          return counterOffer.counterOfferStatus !=
              CounterOfferStatus.Submitted;
        })
        .first
        .then((value) => CounterOffer.fromData(value.snapshot));
  }

  /// to remove taxi form counter offer mode
  /// either after customer responds or a timer runs out
  /// if expired is set then the status in db is set to expired as well
  Future<void> removeFromNegotiationMode(String orderId, String customerId,
      {bool expired = false}) async {
    await _databaseHelper.firebaseDatabase
        .reference()
        .child(inNegotationNode(_authController.fireAuthUser!.uid))
        .remove();

    if (expired)
      await _databaseHelper.firebaseDatabase
          .reference()
          .child(customersCounterOfferNode(
              orderId, customerId, _authController.fireAuthUser!.uid))
          .remove();
    // if it's expired why would we keep it ? Any reasons @Nathikos ?
    // .set(CounterOfferStatus.Expired.toFirebaseFormatString());
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
