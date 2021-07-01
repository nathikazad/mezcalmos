import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/helpers/databaseHelper.dart';
import 'package:mezcalmos/TaxiApp/models/Order.dart';
import 'package:mezcalmos/TaxiApp/routes/SimpleRouter.dart';

class IncomingOrdersController extends GetxController {
 
  RxList<Order> orders            =  <Order>[].obs; // this is observable which will be constaintly changing in realtime .
  AuthController _authController  = Get.find<AuthController>(); // since it's already injected .
  DatabaseHelper _databaseHelper  = Get.find<DatabaseHelper>(); // Already Injected in main function
  RxBool _waitingResponse         = RxBool(false);
  Rx<Order?> _selectedIncommingOrder = Order.empty().obs;

  // Storing all the needed Listeners here
  List<StreamSubscription<Event>> _listeners = <StreamSubscription<Event>>[]; 
  
  dynamic get waitingResponse => _waitingResponse.value;


  Order? get selectedIncommingOrder => _selectedIncommingOrder.value;
  void set selectedIncommingOrder(Order? selectedOrder) =>  _selectedIncommingOrder.value = selectedOrder;


  
  @override
  void onInit() async {
    // _selectedIncommingOrder.value = null;

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
        .listen((event) async
          {
            // This is why GetX guys XD!
            if(event.snapshot.key == _selectedIncommingOrder.value?.id)
            {
              _selectedIncommingOrder.value = null;
              if (Get.currentRoute == kSelectedIcommingOrder) await MezcalmosSharedWidgets.mezcalmosDialog(55 , Get.height , Get.width);
              Get.back(closeOverlays: true);
            }
            
            orders.removeWhere((element) => element.id == event.snapshot.key);
          }
        ),

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

  Future<void> acceptTaxi(String orderId) async {

    HttpsCallable acceptTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('acceptTaxiOrder');
    try {
      _waitingResponse.value = true;
      HttpsCallableResult response =
          await acceptTaxiFunction.call(<String, dynamic>{'orderId': orderId});
          _waitingResponse.value = false;
          _selectedIncommingOrder.value = new Order.empty();
      print("Accept Taxi Response");
      print(response.data);
    } catch (e) {
    _waitingResponse.value = false;
      mezcalmosSnackBar( "Notice ~" , "Failed to accept the taxi order :( ");
      print("Exception happend in acceptTaxi : $e");
    }
  }

  @override
  void dispose()  {
    super.dispose();
    print("--------------------> OrderController Auto");
  }
}
