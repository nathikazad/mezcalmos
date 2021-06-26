import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/helpers/databaseHelper.dart';
import 'package:mezcalmos/TaxiApp/models/Order.dart';

class CurrentOrderController extends GetxController {
  Rxn<Order> _model = Rxn<Order>();
  TaxiAuthController _taxiAuthController =
      Get.find<TaxiAuthController>(); // since it's already injected .
  DatabaseHelper _databaseHelper =
      Get.find<DatabaseHelper>(); // Already Injected in main function

  Order? get value => _model.value;
  String get id => _model.value?.id ?? "None";
  late StreamSubscription<Event> _currentOrderListener;

  @override
  void onInit() async {
    super.onInit();
    print("--------------------> CurrentOrderController Initialized !");

    if (_taxiAuthController.currentOrderId != null) {
      _currentOrderListener = _databaseHelper.firebaseDatabase
          .reference()
          .child(orderId(_taxiAuthController.currentOrderId))
          .onValue
          .listen((event) {
        print(event.snapshot.value);
        _model.value = Order.fromJson(event.snapshot.key, event.snapshot.value);
      });
    }
  }

  void cancelTaxi(String reason) async {
    HttpsCallable cancelTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('cancelTaxiFromDriver');
    try {
      HttpsCallableResult response =
          await cancelTaxiFunction.call(<String, dynamic>{'reason': reason});
      print("Cancel Taxi Response");
      print(response.data);
    } catch (e) {
      // ...
    }
  }

  void startRide() async {
    HttpsCallable startRideFunction =
        FirebaseFunctions.instance.httpsCallable('startTaxiRide');
    try {
      HttpsCallableResult response = await startRideFunction.call();
      print("Start Taxi Response");
      print(response.data);
    } catch (e) {
      // ...
    }
  }

  void finishRide() async {
    HttpsCallable finishRideFunction =
        FirebaseFunctions.instance.httpsCallable('finishTaxiRide');
    try {
      HttpsCallableResult response = await finishRideFunction.call();
      print("Finish Taxi Response");
      print(response.data);
    } catch (e) {
      // ...
    }
  }

  void detachListeners() {
    _currentOrderListener
        .cancel()
        .then((value) => print(
            "A listener was disposed on currentOrderController::detachListeners !"))
        .catchError((err) => print(
            "Error happend while trying to dispose currentOrderController::detachListeners !"));
  }

  @override
  void dispose() {
    detachListeners();
    super.dispose();
    print("--------------------> OrderController Auto Disposed !");
  }
}
