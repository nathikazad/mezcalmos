import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/models/Restaurant.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'dart:async';

class RestaurantOrderController extends GetxController {
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();

  Restaurant? associatedRestaurant;
  Rxn<Cart> cart = Rxn();
  @override
  void onInit() {
    super.onInit();
    print("--------------------> RestaurantsCartController Initialized !");
    if (_authController.user != null) {
      _databaseHelper.firebaseDatabase
          .reference()
          .child("/users/${_authController.user!.uid}/cart")
          .onValue
          .listen((event) async {
        dynamic cartData = event.snapshot.value;
        // check if cart has data
        if (cartData != null) {
          // check if cart data is for restaurant
          if (cartData["orderType"] == "restaurant") {
            // check if already associated restaurant with cart is the same as current restaurant,
            // if not clear the old associated restaurant
            if (associatedRestaurant != null) {
              if (cartData["serviceProviderId"] != associatedRestaurant!.id) {
                associatedRestaurant = null;
              }
            }
            // if no associated restaurant data is saved, then fetch it from database
            if (associatedRestaurant == null) {
              associatedRestaurant =
                  await getAssociatedRestaurant(cartData["serviceProviderId"]);
            }
            cart.value = Cart.fromCartData(cartData, associatedRestaurant!);
          }
        } else {
          cart.value = null;
        }
      });
    }
  }

  Future<Restaurant> getAssociatedRestaurant(String restaurantId) async {
    DataSnapshot snapshot = await _databaseHelper.firebaseDatabase
        .reference()
        .child('restaurants/info/${restaurantId}')
        .once();
    return Restaurant.fromRestaurantData(snapshot.value, id: restaurantId);
  }

  void addItem(CartItem cartItem, String restaurantId) async {
    if (associatedRestaurant == null) {
      associatedRestaurant = await getAssociatedRestaurant(restaurantId);
    } else if (associatedRestaurant!.id != restaurantId) {
      // In future, throw items from another restaurant in cart error
      // for now clear cart and associate new restaurant
      cart.value = Cart(associatedRestaurant!);
      associatedRestaurant = await getAssociatedRestaurant(restaurantId);
    }
    if (cart.value == null) {
      cart.value = Cart(associatedRestaurant!);
    }
    cart.value?.addItem(cartItem);
    _databaseHelper.firebaseDatabase
        .reference()
        .child("/users/${_authController.user!.uid}/cart")
        .set(cart.value?.toFirebaseFormattedJson());
  }

  void clearCart() {
    _databaseHelper.firebaseDatabase
        .reference()
        .child("/users/${_authController.user!.uid}/cart")
        .remove();
  }

  void changeQuantityOfItem(
    String itemId,
    int quantity,
  ) {
    cart.value?.incrementItem(itemId, quantity);
  }

  Future<void> checkout() async {
    HttpsCallable checkoutRestaurantCart =
        FirebaseFunctions.instance.httpsCallable('checkoutRestaurantCart');
    try {
      HttpsCallableResult response = await checkoutRestaurantCart
          .call({"from": "home", "paymentType": "cash"});
      print(response.data);
      // handle restaurantClosed error
    } catch (e) {}
  }
}
