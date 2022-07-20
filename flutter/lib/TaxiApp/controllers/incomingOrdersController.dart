import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/taxiNodes.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/CounterOffer.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/firebaseNodes/ordersNode.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
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
        .ref()
        .child(rootTaxiOpenOrdersNode())
        .onValue
        .listen((event) async {
      mezDbgPrint("Open Orders Node");
      mezDbgPrint(event.snapshot.value);
      List<TaxiOrder> ordersFromSnapshot = <TaxiOrder>[];
      if (event.snapshot.value != null) {
        (event.snapshot.value as dynamic)
            ?.forEach((dynamic key, dynamic value) async {
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
          .ref()
          .child(rootOpenOrderReadNode(orderId, _authController.user!.id))
          .set(true);
      await _databaseHelper.firebaseDatabase
          .ref()
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
          .ref()
          .child(rootOpenOrderReceivedNode(orderId, _authController.user!.id))
          .set(true);
      await _databaseHelper.firebaseDatabase
          .ref()
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
  }

  /// submit counter offer for a particular order
  Future<void> submitCounterOffer(
    String orderId,
    String customerId,
    CounterOffer counterOffer,
  ) async {
    // in customer's node
    await _databaseHelper.firebaseDatabase
        .ref()
        .child(customersCounterOfferNode(
            orderId, customerId, _authController.fireAuthUser!.uid))
        .set(counterOffer.toFirebaseFormattedJson());

    await _databaseHelper.firebaseDatabase
        .ref()
        .child(inNegotationNode(_authController.fireAuthUser!.uid))
        .set({"orderId": orderId, "customerId": customerId});

    unawaited(
      _databaseHelper.firebaseDatabase
          .ref()
          .child('notificationQueue/${_authController.fireAuthUser!.uid}')
          .set(
            CounterOfferNotificationForQueue(
                    driver: _authController.user!.constructUserInfo(),
                    orderId: orderId,
                    customerId: customerId,
                    price: counterOffer.price)
                .toFirebaseFormatJson(),
          ),
    );
  }

  // Commented The event above cuz it won't work in case TaxiDriver got redirected to incommingOrderViewScreeen.
  // insteead we have two approaches :
  // 1 - Send the CounterOffer as parametere from TaxiWrapper, and then we can listen to the event, even in that case,
  // there still risk, cuz while moving the driver to the incommingOrderViewScreeen, the Customer might reject it, which
  // will cause it not get invoked, since it was not changed.
  // 2 - More reliable which is just calling [getCustomerTaxiOrderIfExistsInDatabase] since we have an async timer on the view that works each 1s

  /// this function gets the order with the given [orderId] directly fron the database,
  ///
  /// if it exists then it parse it to a [TaxiOrder] else it returns null.
  ///
  /// this is mainly useful in some cases when we need to check an [orderId] but the Controller hasn't loaded orders yet.
  Future<CounterOffer?> getDriverCountOfferInCustomersNode(
      String orderId, String customerId) async {
    DataSnapshot snap = (await _databaseHelper.firebaseDatabase
            .ref()
            .child(customersCounterOfferNode(
                orderId, customerId, _authController.fireAuthUser!.uid))
            .once())
        .snapshot;
    return snap.value != null
        ? CounterOffer.fromData(snap.value,
            taxiUserInfo:
                UserInfo.fromData((snap.value as dynamic)['driverInfo']))
        : null;
  }

  Stream<CounterOffer?> listenOnCounterOfferChanges(
      String orderId, String customerId) {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(customersCounterOfferNode(
            orderId, customerId, _authController.fireAuthUser!.uid))
        .onValue
        .map<CounterOffer?>((counterOfferEvent) {
      try {
        dynamic snap = counterOfferEvent.snapshot;
        CounterOffer? _cOffer = snap.value != null
            ? CounterOffer.fromData(snap.value,
                taxiUserInfo: UserInfo.fromData(snap.value['driverInfo']))
            : null;
        // if (_cOffer != null && _cOffer.validityTimeDifference() < 0) {
        return _cOffer;
        // }
        // return null;
      } on StateError catch (_) {
        return null;
      }
    });
  }

  /// to remove taxi form counter offer mode
  /// either after customer responds or a timer runs out
  /// if expired is set then the status in db is set to expired as well
  Future<void> removeFromNegotiationMode(String orderId, String customerId,
      {CounterOfferStatus newStatus = CounterOfferStatus.Expired}) async {
    await _databaseHelper.firebaseDatabase
        .ref()
        .child(inNegotationNode(_authController.fireAuthUser!.uid))
        .remove();

    await _databaseHelper.firebaseDatabase
        .ref()
        .child(customersCounterOfferNode(
            orderId, customerId, _authController.fireAuthUser!.uid))
        .child('status')
        .set(newStatus.toFirebaseFormatString());
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
