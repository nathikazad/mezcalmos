import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/CustomerApp/constants/databaseNodes.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:mezcalmos/Shared/utilities/Extensions.dart';

class RestaurantCartController extends GetxController with MezDisposable {
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();

  Restaurant? associatedRestaurant;
  Rxn<Cart> cart = Rxn();
  @override
  void onInit() {
    super.onInit();
    print("--------------------> RestaurantsCartController Initialized !");

    _databaseHelper.firebaseDatabase
        .reference()
        .child(customerCart(_authController.fireAuthUser!.uid))
        .onValue
        .listen((event) async {
      dynamic cartData = event.snapshot.value;
      // print(cartData);
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
    }).canceledBy(this);
  }

  Future<Restaurant> getAssociatedRestaurant(String restaurantId) async {
    DataSnapshot snapshot = await _databaseHelper.firebaseDatabase
        .reference()
        .child('restaurants/info/${restaurantId}')
        .once();
    return Restaurant.fromRestaurantData(snapshot.value, id: restaurantId);
  }

  void addItem(CartItem cartItem) async {
    String restaurantId = cartItem.restaurantId;
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
    // print(customerCart(_authController.user!.uid));
    _databaseHelper.firebaseDatabase
        .reference()
        .child(customerCart(_authController.user!.uid))
        .set(cart.value?.toFirebaseFormattedJson());
  }

  void clearCart() {
    _databaseHelper.firebaseDatabase
        .reference()
        .child(customerCart(_authController.user!.uid))
        .remove();
  }

  void changeQuantityOfItem(
    String itemId,
    int quantity,
  ) {
    cart.value?.incrementItem(itemId, quantity);
  }

  Future<dynamic> checkout() async {
    HttpsCallable checkoutRestaurantCart =
        FirebaseFunctions.instance.httpsCallable('checkoutRestaurantCart');
    try {
      HttpsCallableResult response = await checkoutRestaurantCart
          .call({"from": "home", "paymentType": "cash"});

      return response.data;
    } catch (e) {
      return <String, dynamic>{
        "status": "Error",
        "errorMessage": "Server Error",
        "errorCode": "serverError"
      };
    }
  }

  @override
  void onClose() async {
    print("[+] RestaurantCartController::onClose ---------> Was invoked !");
    cancelSubscriptions();
    super.onClose();
  }
}
