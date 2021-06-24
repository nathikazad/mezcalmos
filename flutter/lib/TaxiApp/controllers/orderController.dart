import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/helpers/databaseHelper.dart';
import 'package:mezcalmos/TaxiApp/models/Order.dart';


class OrderController extends GetxController {

  RxList<Order> orders            =  <Order>[].obs; // this is observable which will be constaintly changing in realtime .
  AuthController _authController  = Get.find<AuthController>(); // since it's already injected .
  DatabaseHelper _databaseHelper  = Get.find<DatabaseHelper>(); // Already Injected in main function

  // Storing all the needed Listeners here
  List<StreamSubscription<Event>> _listeners = <StreamSubscription<Event>>[]; 
  
  
  @override
  void onInit() async {
    super.onInit();
    print("--------------------> OrderController Initialized !");
    // uhm .. well let's just attach some listeners..
    // READ : it's better to keep them like that , becauce that way we can update orders, which is an observale list.
    
    if (_authController.user != null) {
      
      _listeners.addAll([

        // Added Order!
        _databaseHelper
        .firebaseDatabase
        .reference()
        .child(taxiOpenOrdersNode)
        .onChildAdded
        .listen((event) => orders.add(Order.fromSnapshot(event.snapshot))),

        // Removed Order
        _databaseHelper
        .firebaseDatabase
        .reference()
        .child(taxiOpenOrdersNode)
        .onChildRemoved
        .listen((event) => orders.removeWhere((element) => element.id == event.snapshot.key)),

        //changed Order
        _databaseHelper
        .firebaseDatabase
        .reference()
        .child(taxiOpenOrdersNode)
        .onChildChanged
        .listen((event) {
          orders[
            orders
            .indexOf(
              orders
              .singleWhere(
                (element) => element.id == event.snapshot.key
              )
            )
          ] = Order.fromSnapshot(event.snapshot);
        }),

      ]);

      print("Attached Listeners on taxiOpenOrdersNode : ${_listeners.length}");
    }
  }


  // I added this to avoid possible dangling pointers ...
  void dettahListeners()
  {
    _listeners.forEach((sub) =>
      sub
      .cancel()
      .then((value) => print("A listener was disposed on orderController::dettahListeners !"))
      .catchError((err) => print("Error happend while trying to dispose orderController::dettahListeners !"))
    );
  }

  void acceptTaxi(String orderId) async {
    HttpsCallable acceptTaxiFunction = FirebaseFunctions.instance.httpsCallable('acceptTaxiOrder');
    try {
      HttpsCallableResult response = await acceptTaxiFunction.call(<String, dynamic>{
        'orderId': orderId
      });
      print("Accept Taxi Response");
      print(response.data);
    } catch (e) {
      // ...
    }
  }

  void cancelTaxi(String reason) async {
    HttpsCallable cancelTaxiFunction = FirebaseFunctions.instance.httpsCallable('cancelTaxiFromDriver');
    try {
      HttpsCallableResult response = await cancelTaxiFunction.call(<String, dynamic>{
        'reason': reason
      });
      print("Cancel Taxi Response");
      print(response.data);
    } catch (e) {
      // ...
    }
  }

  void startRide() async {
    HttpsCallable startRideFunction = FirebaseFunctions.instance.httpsCallable('startTaxiRide');
    try {
      HttpsCallableResult response = await startRideFunction.call();
      print("Start Taxi Response");
      print(response.data);
    } catch (e) {
      // ...
    }
  }

  void finishRide() async {
    HttpsCallable finishRideFunction = FirebaseFunctions.instance.httpsCallable('finishTaxiRide');
    try {
      HttpsCallableResult response = await finishRideFunction.call();
      print("Finish Taxi Response");
      print(response.data);
    } catch (e) {
      // ...
    }
  }

  @override
  void dispose()  {
    super.dispose();
    print("--------------------> OrderController Auto Disposed !");
  }
}
