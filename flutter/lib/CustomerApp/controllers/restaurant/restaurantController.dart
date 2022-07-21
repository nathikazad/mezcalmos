import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/rootNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class RestaurantController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();

  StreamSubscription<dynamic>? _cartListener;
  Restaurant? associatedRestaurant;
  Rx<Cart> cart = Cart().obs;
  RxInt shippingPrice = 50.obs;

  @override
  void onInit() {
    super.onInit();
    mezDbgPrint(
        "--------------------> RestaurantsCartController Initialized !");
    if (_authController.fireAuthUser != null) {
      getShippingPrice().then((int value) => shippingPrice.value = value);

      _cartListener?.cancel();
      _cartListener = _databaseHelper.firebaseDatabase
          .ref()
          .child(customerCart(_authController.fireAuthUser!.uid))
          .onValue
          .listen((DatabaseEvent event) async {
        final dynamic cartData = event.snapshot.value;
        // check if cart has data
        if (cartData != null) {
          // assign the shipping price

          // check if cart data is for restaurant
          if (cartData["orderType"] ==
              OrderType.Restaurant.toFirebaseFormatString()) {
            // check if already associated restaurant with cart is the same as current restaurant,
            // if not clear the old associated restaurant
            if (associatedRestaurant != null) {
              if (cartData["serviceProviderId"] !=
                  associatedRestaurant?.info.id) {
                associatedRestaurant = null;
              }
            }

            // if no associated restaurant data is saved, then fetch it from database
            if (associatedRestaurant == null) {
              associatedRestaurant =
                  await getAssociatedRestaurant(cartData["serviceProviderId"]);
            }
            if (cartData == null) {
              cart.value = Cart();
            }

            cart.value = Cart.fromCartData(
                cartData, associatedRestaurant!, shippingPrice.value);
          }
        } else {
          cart.value = Cart();
          associatedRestaurant = null;
        }
      });
    }
  }

  Future<Restaurant> getAssociatedRestaurant(String restaurantId) async {
    final DataSnapshot snapshot = (await _databaseHelper.firebaseDatabase
            .ref()
            .child('restaurants/info/$restaurantId')
            .once())
        .snapshot;
    return Restaurant.fromRestaurantData(
        restaurantId: restaurantId, restaurantData: snapshot.value);
  }

  Future<int> getShippingPrice() async {
    final DataSnapshot snapshot = (await _databaseHelper.firebaseDatabase
            .ref()
            .child(baseShippingPriceNode())
            .once())
        .snapshot;
    mezDbgPrint(
        "Gettting shipping cost ==================================>>>>>> ${snapshot.value}");
    return snapshot.value as int;
  }

  Future<void> saveCart() async {
    await _databaseHelper.firebaseDatabase
        .ref()
        .child(customerCart(_authController.fireAuthUser!.uid))
        .set(cart.value.toFirebaseFormattedJson());
  }

  Future<void> addItem(CartItem cartItem) async {
    final String restaurantId = cartItem.restaurantId;
    if (associatedRestaurant == null) {
      mezDbgPrint(
          "@@saadf@@ restaurantController::addItem ---> associatedRestaurant == null !");
      associatedRestaurant = await getAssociatedRestaurant(restaurantId);
      cart.value = Cart(restaurant: associatedRestaurant!);
    } else if (associatedRestaurant!.info.id != restaurantId) {
      mezDbgPrint(
          "@@saadf@@ restaurantController::addItem ---> associatedRestaurant!.id != restaurantId!");

      // In future, throw items from another restaurant in cart error
      // for now clear cart and associate new restaurant
      associatedRestaurant = await getAssociatedRestaurant(restaurantId);
      cart.value = Cart(restaurant: associatedRestaurant!);
    }

    mezDbgPrint(
      "@@saadf@@ restaurantController::addItem ---> addingItem and saving card !",
    );

    cart.value.addItem(cartItem);
    await saveCart();
  }

  void incrementItem(String itemId, int quantity) {
    cart.value.incrementItem(itemId, quantity);
    saveCart();
  }

  void deleteItem(String itemId) {
    cart.value.deleteItem(itemId);
    saveCart();
  }

  void clearCart() {
    _databaseHelper.firebaseDatabase
        .ref()
        .child(customerCart(_authController.user!.id))
        .remove()
        .then((_) {
      mezDbgPrint("============= /// :your cart is deleted \\\ ============= ");
      cart.value = Cart(restaurant: associatedRestaurant);
    });
    Get.appUpdate();
  }

  Future<ServerResponse> checkout({String? stripePaymentId}) async {
    final HttpsCallable checkoutRestaurantCart =
        FirebaseFunctions.instance.httpsCallable("restaurant-checkoutCart");
    try {
      final HttpsCallableResult<dynamic> response = await checkoutRestaurantCart
          .call({
        ...cart.value.toFirebaseFormattedJson(),
        "stripePaymentId": stripePaymentId
      });
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      mezDbgPrint("error function");
      mezDbgPrint(e);
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> cancelOrder(String orderId) async {
    final HttpsCallable cancelOrder = FirebaseFunctions.instance
        .httpsCallable('restaurant-cancelOrderFromCustomer');
    try {
      final HttpsCallableResult<dynamic> response =
          await cancelOrder.call(<String, String>{"orderId": orderId});
      mezDbgPrint(response.toString());
      print(response.data);
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  @override
  void onClose() {
    print("[+] RestaurantCartController::onClose ---------> Was invoked !");
    _cartListener?.cancel();
    _cartListener = null;
    super.onClose();
  }
}
