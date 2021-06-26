import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/helpers/databaseHelper.dart';
import 'package:mezcalmos/TaxiApp/models/Order.dart';

class IncomingOrdersController extends GetxController {
  RxList<Order> orders = <Order>[]
      .obs; // this is observable which will be constaintly changing in realtime .
  AuthController _authController =
      Get.find<AuthController>(); // since it's already injected .
  DatabaseHelper _databaseHelper =
      Get.find<DatabaseHelper>(); // Already Injected in main function

  // Storing all the needed Listeners here
  late StreamSubscription<Event> _incomingOrderslistener;

  @override
  void onInit() async {
    super.onInit();
    print("--------------------> OrderController Initialized !");
    // uhm .. well let's just attach some listeners..
    // READ : it's better to keep them like that , becauce that way we can update orders, which is an observale list.

    if (_authController.user != null) {
      _incomingOrderslistener = _databaseHelper.firebaseDatabase
          .reference()
          .child(taxiOpenOrdersNode)
          .onValue
          .listen((event) {
        orders.clear();
        event.snapshot.value.forEach((dynamic key, dynamic value) {
          try {
            orders.add(Order.fromJson(key, value));
          } catch (e) {
            print(e);
          }
        });
      });
    }
  }

  void acceptTaxi(String orderId) async {
    HttpsCallable acceptTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('acceptTaxiOrder');
    try {
      HttpsCallableResult response =
          await acceptTaxiFunction.call(<String, dynamic>{'orderId': orderId});
      print("Accept Taxi Response");
      print(response.data);
    } catch (e) {
      // ...
    }
  }

  void detachListeners() {
    _incomingOrderslistener
        .cancel()
        .then((value) => print(
            "A listener was disposed on incomingOrdersController::detachListeners !"))
        .catchError((err) => print(
            "Error happend while trying to dispose incomingOrdersController::detachListeners !"));
  }

  @override
  void dispose() {
    this.detachListeners();
    super.dispose();
    print("--------------------> OrderController Auto Disposed !");
  }
}
