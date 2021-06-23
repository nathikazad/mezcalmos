import 'dart:async';

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
  Future<void> _dettahListeners() async
  {
    _listeners.forEach((sub) async { 
      await sub
      .cancel()
      .whenComplete(() => print("A listener was disposed on orderController::dettahListeners !"))
      .catchError((er) => print("Failed Cancelling a listner on orderController::dettahListeners !"));
    });
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    print("Disposing the OrderController and Revoking all the ::taxiOpenOrdersNode:: Listners !");
    await _dettahListeners();
  }
}
