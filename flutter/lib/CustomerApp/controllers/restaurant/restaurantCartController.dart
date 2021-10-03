import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/CustomerApp/models/cart.dart';
import 'package:mezcalmos/CustomerApp/models/restaurant.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'dart:async';

class RestaurantCartController extends GetxController {
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();
    print("--------------------> RestaurantsCartController Initialized !");
    if (_authController.user != null) {
      _databaseHelper.firebaseDatabase
          .reference()
          .child("/users/${_authController.user!.uid}/cart")
          .onValue
          .listen((event) {
        print(event.snapshot.value.toString());
      });
    }
  }

  Future<void> addItem(CartItem cartItem) async {
    HttpsCallable addRestaurantItemToCart =
        FirebaseFunctions.instance.httpsCallable('addRestaurantItemToCart');
    try {
      // _waitingResponse.value = true;
      HttpsCallableResult response = await addRestaurantItemToCart
          .call(cartItem.toFirebaseFunctionFormattedJson());
      print(response.data);
    } catch (e) {}
  }
}
