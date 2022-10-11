import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/rootNodes.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class RestaurantController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();

  StreamSubscription<dynamic>? _cartListener;
  Restaurant? associatedRestaurant;
  Rx<Cart> cart = Cart().obs;
  RxnNum minShiipingPrice = RxnNum();
  RxnNum perKmPrice = RxnNum();
  RxnNum baseShippingPrice = RxnNum();
  RxBool isShippingSet = RxBool(false);
  num _orderDistanceInKm = 0;

  num get getOrderDistance => _orderDistanceInKm;

  @override
  Future<void> onInit() async {
    super.onInit();
    mezDbgPrint(
        "--------------------> RestaurantsCartController Initialized !");

    if (_authController.fireAuthUser != null) {
      //  getShippingPrice().then((num value) => shippingPrice.value = value);
      baseShippingPrice.value = await getShippingPrice();
      minShiipingPrice.value = await getMinShippingPrice();
      perKmPrice.value = await getPerKmShippingPrice();
      await _cartListener?.cancel();
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
              cartData,
              associatedRestaurant!,
            );
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

  Future<num?> getShippingPrice() async {
    final DataSnapshot snapshot = (await _databaseHelper.firebaseDatabase
            .ref()
            .child(baseShippingPriceNode())
            .once())
        .snapshot;

    return snapshot.value as num;
  }

  Future<num?> getMinShippingPrice() async {
    final DataSnapshot snapshot = (await _databaseHelper.firebaseDatabase
            .ref()
            .child(minShippingPriceNode())
            .once())
        .snapshot;
    mezDbgPrint("Min price =======>>>>>>${snapshot.value}");
    return snapshot.value as num;
  }

  Future<num?> getPerKmShippingPrice() async {
    final DataSnapshot snapshot = (await _databaseHelper.firebaseDatabase
            .ref()
            .child(perKmShippingPriceNode())
            .once())
        .snapshot;
    mezDbgPrint("Per km price =======>>>>>>${snapshot.value}");

    return snapshot.value as num;
  }

  Future<bool> updateShippingPrice() async {
    isShippingSet.value = false;
    final Location? loc = cart.value.toLocation;
    minShiipingPrice.value =
        minShiipingPrice.value ?? await getMinShippingPrice();
    perKmPrice.value = perKmPrice.value ?? await getPerKmShippingPrice();
    baseShippingPrice.value =
        baseShippingPrice.value ?? await getShippingPrice();
    if (loc != null) {
      final MapHelper.Route? routeInfo = await MapHelper.getDurationAndDistance(
        cart.value.restaurant!.info.location,
        loc,
      );
      if (routeInfo != null) {
        _orderDistanceInKm = routeInfo.distance.distanceInMeters / 1000;
        mezDbgPrint(
            "ORDER DISTANCE VARIABLEEEE ========>>>>>>>$_orderDistanceInKm");
        mezDbgPrint(
            "place :::: $loc distance from controller :::::::===> ${(routeInfo.distance.distanceInMeters / 1000)}");
        if ((routeInfo.distance.distanceInMeters / 1000) <= 10) {
          final num shippingCost =
              perKmPrice.value! * (routeInfo.distance.distanceInMeters / 1000);
          if (shippingCost < minShiipingPrice.value!) {
            mezDbgPrint(
                "LESS THAN MINIMUM COST ===================== $shippingCost << ${minShiipingPrice.value}");
            cart.value.shippingCost = minShiipingPrice.value!.ceil();
          } else {
            cart.value.shippingCost = shippingCost.ceil();
          }

          mezDbgPrint(
              "SHIPPPPPING COOOOST =========>>>>>>>>>>>${cart.value.shippingCost}");
          await saveCart();
          isShippingSet.value = true;

          return true;
        } else {
          cart.value.shippingCost = null;
          await saveCart();
          isShippingSet.value = true;

          return true;
        }
      } else {
        cart.value.shippingCost = null;
        await saveCart();
        isShippingSet.value = false;
        return false;
      }
    } else {
      cart.value.shippingCost = null;
      await saveCart();
      isShippingSet.value = true;

      return true;
    }
  }

  bool get validTime {
    if (cart.value.deliveryTime != null) {
      return cart.value.deliveryTime!
          .toLocal()
          .isAfter(DateTime.now().toLocal());
    } else {
      return true;
    }
  }

  bool get canOrder {
    return cart.value.toLocation != null &&
        _orderDistanceInKm <= 10 &&
        isShippingSet.isTrue &&
        validTime &&
        cart.value.shippingCost != null &&
        (associatedRestaurant?.isOpen() ?? false);
  }

  Future<void> saveCart() async {
    await _databaseHelper.firebaseDatabase
        .ref()
        .child(customerCart(_authController.fireAuthUser!.uid))
        .set(cart.value.toFirebaseFormattedJson());
  }

  Future<void> addItem(CartItem cartItem) async {
    mezDbgPrint(
        "@m66are adding this to cart ==========>${cartItem.toFirebaseFunctionFormattedJson()}");
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

  void switchPaymentMedthod(
      {required PaymentType paymentType, CreditCard? card}) {
    mezDbgPrint(
        "Switching on restControlller =========>>>>>${paymentType.toNormalString()}");
    cart.value.paymentType = paymentType;

    saveCart();
  }

  bool get showItemsImages {
    mezDbgPrint(
        "TEEEEEST IMAGE ====>${cart.value.cartItems.firstWhereOrNull((CartItem element) => element.item.image != null)}");
    return cart.value.cartItems.firstWhereOrNull(
            (CartItem element) => element.item.image != null) !=
        null;
  }

  bool get showPaymentPicker {
    return cart.value.restaurant?.paymentInfo
                .acceptedPayments[PaymentType.Card] ==
            true ||
        cart.value.restaurant?.paymentInfo
                .acceptedPayments[PaymentType.BankTransfer] ==
            true;
  }

  bool get showFees {
    return cart.value.paymentType == PaymentType.Card &&
        (cart.value.restaurant?.paymentInfo.stripe?.chargeFeesOnCustomer ??
            true);
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

  Future<ServerResponse> addReview({
    required String orderId,
    required String restaurantId,
    required String comment,
    required num rate,
  }) async {
    final HttpsCallable cancelOrder =
        FirebaseFunctions.instance.httpsCallable('restaurant-addReview');
    try {
      final HttpsCallableResult<dynamic> response =
          await cancelOrder.call(<String, dynamic>{
        "orderId": orderId,
        "serviceProviderId": restaurantId,
        "rating": rate,
        "comment": comment,
        "orderType": OrderType.Restaurant.toFirebaseFormatString(),
      });
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
