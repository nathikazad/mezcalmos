import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/TaxiApp/models/Order.dart';
import 'package:mezcalmos/TaxiApp/services/database.dart';


class OrderController extends GetxController {

  RxList<Order> orders            =  <Order>[].obs; // this is observable which will be constaintly changing in realtime .
  AuthController _authController  = Get.find<AuthController>(); // since it's already injected .
  DatabaseHelper _databaseHelper  = Get.find<DatabaseHelper>(); // Already Injected in main function


  // testing Function
  void _InitialFill()
  { 
      print("------------------------ INIT -----------------");
    _databaseHelper.firebaseDatabase.reference().child('users').once().then((DataSnapshot snapshot) {
        Map<dynamic, dynamic> values = snapshot.value;
        values.forEach((key, value) {
          print( "Key[${key}] = ${value.toString()}");
        });
    });

  }

  @override
  void onInit() {
    super.onInit();

    // testing ... still
    _InitialFill();


    // uhm .. well let's just attach some listeners..

    // Added Order!
    _databaseHelper.firebaseDatabase.reference().child('openOrders/taxi').onChildAdded.listen((event) {
      orders.add(Order.fromSnapshot(event.snapshot));
    });

    // Removed Order
    _databaseHelper.firebaseDatabase.reference().child('openOrders/taxi').onChildRemoved.listen((event) {
      orders.removeWhere((element) => element.id == event.snapshot.key);
    });

    //changed Order
    _databaseHelper.firebaseDatabase.reference().child('openOrders/taxi').onChildChanged.listen((event) {
      Order _orderChanged = orders.singleWhere((element) => element.id == event.snapshot.key);
      orders[orders.indexOf(_orderChanged)] = Order.fromSnapshot(event.snapshot);
    });

  }


}
