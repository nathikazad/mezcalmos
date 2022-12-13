import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/rootNodes.dart';
import 'package:mezcalmos/Shared/graphql/customer/cart/hsCart.dart' as hsCart;
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class RestaurantController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();

  StreamSubscription? _cartListener;
  String? _subscriptionId;
  Restaurant? associatedRestaurant;
  Rx<Cart> cart = Cart().obs;
  RxnNum minShiipingPrice = RxnNum();
  RxnNum perKmPrice = RxnNum();
  RxnNum baseShippingPrice = RxnNum();
  RxBool isShippingSet = RxBool(false);
  num _orderDistanceInKm = 0;
  HasuraDb _hasuraDb = Get.find<HasuraDb>();

  num get getOrderDistance => _orderDistanceInKm;

  @override
  Future<void> onInit() async {
    super.onInit();

    mezDbgPrint(
        "--------------------> RestaurantsCartController Initialized !");

    if (_authController.fireAuthUser != null && _authController.user != null) {
      //  getShippingPrice().then((num value) => shippingPrice.value = value);
      baseShippingPrice.value = await getShippingPrice();
      minShiipingPrice.value = await getMinShippingPrice();
      perKmPrice.value = await getPerKmShippingPrice();
      // ignore: unawaited_futures
      hsCart
          .getCustomerCart(
        customerId: Get.find<AuthController>().user!.hasuraId,
      )
          .then((Cart? value) {
        mezDbgPrint(
            "[cc] Cart Controller ===> ${value?.toFirebaseFormattedJson()}");
        cart.value = value ?? Cart();
        associatedRestaurant = value?.restaurant;
        cart.refresh();
      });
    }
    if (Get.find<AuthController>().user?.hasuraId != null) {
      // _hasuraDb.createSubscription(start: () {
      //   _cartListener = hsCart
      //       .listen_on_customer_cart(
      //           customer_id: Get.find<AuthController>().user!.hasuraId)
      //       .listen((Cart? event) {
      //     if (event != null) {
      //       cart.value = event;
      //       if (event.restaurant != null)
      //         associatedRestaurant = event.restaurant;
      //     }
      //     cart.refresh();
      //   });
      // }, cancel: () {
      //   if (_subscriptionId != null)
      //     _hasuraDb.cancelSubscription(_subscriptionId!);
      //   _cartListener?.cancel();
      //   _cartListener = null;
      // });
    }
    // check for old special items and remove them
    checkCartPeriod();
  }

  Future<Restaurant?> getAssociatedRestaurant(int restaurantId) async {
    return get_restaurant_by_id(id: restaurantId);
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

  void checkCartPeriod() {
    if (cart.value.cartPeriod != null &&
        cart.value.cartPeriod!.end
            .toLocal()
            .isBefore(DateTime.now().toLocal())) {
      final List<CartItem> specialITems = cart.value.cartItems
          .where((CartItem element) => element.isSpecial)
          .toList();
      specialITems.forEach((CartItem element) {
        if (element.item.endsAt!.toLocal().isBefore(DateTime.now().toLocal())) {
          cart.value.cartItems.remove(element);
        }
      });
    }
  }

  Future<bool> updateShippingPrice() async {
    isShippingSet.value = false;
    final LocModel.Location? loc = cart.value.toLocation;
    mezDbgPrint(
        "[tt] Called updateShippingPrice :: to _ loc _ address :: ${loc?.address} ");
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
      mezDbgPrint(
          "[tt] Got route Info :: distanceStringInKm :: ${routeInfo?.distance.distanceStringInKm} ");

      if (routeInfo != null) {
        _orderDistanceInKm = routeInfo.distance.distanceInMeters / 1000;
        mezDbgPrint(
            "[[+]] Shipping Distance in km ========>>>>>>>$_orderDistanceInKm");
        mezDbgPrint("[[+]] MinShippingPrice ===> ${minShiipingPrice.value}");
        mezDbgPrint("[[+]] perKmPrice ===> ${perKmPrice.value}");
        if (_orderDistanceInKm <= 15) {
          final num shippingCost = perKmPrice.value! * (_orderDistanceInKm);
          mezDbgPrint(
              "[[+]] Calculated final ShippingCost  ========>>>>>>>$shippingCost");
          if (shippingCost < minShiipingPrice.value!) {
            mezDbgPrint(
                "LESS THAN MINIMUM COST ===================== $shippingCost << ${minShiipingPrice.value}");
            cart.value.shippingCost = minShiipingPrice.value!.ceil();
          } else {
            cart.value.shippingCost = shippingCost.ceil();
          }
          cart.value.setRouteInformation = MapHelper.RouteInformation(
            polyline: routeInfo.encodedPolyLine,
            distance: routeInfo.distance,
            duration: routeInfo.duration,
          );

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
        // await saveCart();
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
    return true;
    // TODO : Hasura-ch
    // cart.value.toLocation != null &&
    //     _orderDistanceInKm <= 10 &&
    //     isShippingSet.isTrue &&
    //     validTime &&
    //     cart.value.shippingCost != null &&
    //     (associatedRestaurant?.isOpen() ?? false);
  }

  Future<void> saveCart() async {
    if (_authController.user?.hasuraId != null) {
      final Cart? _cart = await hsCart.update_cart(
        customer_id: _authController.user!.hasuraId,
        restaurant_id: associatedRestaurant!.info.hasuraId,
        items: cart.value.cartItems,
      );
      if (_cart != null) {
        cart.value = _cart;
        mezDbgPrint(
            "😛 Cart items after calling save cart ======>${_cart.cartItems.length}");
      }
    }
    cart.refresh();
  }

  Future<void> addItem(CartItem cartItem) async {
    mezDbgPrint(
        "@m66are adding this to cart ==========>${cartItem.toFirebaseFunctionFormattedJson()}");
    final int restaurantId = cartItem.restaurantId;
    if (associatedRestaurant == null) {
      mezDbgPrint(
          "@@saadf@@ restaurantController::addItem ---> associatedRestaurant == null !");
      associatedRestaurant = await getAssociatedRestaurant(restaurantId);
      cart.value = Cart(restaurant: associatedRestaurant!);
    } else if (associatedRestaurant!.info.hasuraId.toString().toString() !=
        restaurantId) {
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

  CartItem? incrementItem(int itemId, int quantity) {
    final CartItem? _item = cart.value.incrementItem(itemId, quantity);
    mezDbgPrint("[bb] Item -==> $_item");
    if (_item != null) {
      hsCart.update_item_quantity(
        quantity: quantity,
        customer_id: _authController.user!.hasuraId,
        item_id: _item.idInCart!,
      );
    }
    saveCart();
    return _item;
  }

  void deleteItem(int itemId) {
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
                ?.acceptedPayments[PaymentType.Card] ==
            true ||
        cart.value.restaurant?.paymentInfo
                ?.acceptedPayments[PaymentType.BankTransfer] ==
            true;
  }

  bool get showFees {
    return cart.value.paymentType == PaymentType.Card &&
        (cart.value.restaurant?.paymentInfo?.stripe?.chargeFeesOnCustomer ??
            true);
  }

  void clearCart() {
    cart.value = Cart();
    if (Get.find<AuthController>().user?.hasuraId != null) {
      hsCart.clear_customer_cart(
          customer_id: Get.find<AuthController>().user!.hasuraId);
    }
    Get.appUpdate();
  }

  Future<ServerResponse> checkout({String? stripePaymentId}) async {
    final HttpsCallable checkoutRestaurantCart =
        FirebaseFunctions.instance.httpsCallable("restaurant-checkoutCart");
    try {
      final Map<String, dynamic> payload = <String, dynamic>{
        // "customerId": _authController.user!.hasuraId,
        // "checkoutRequest": <String, dynamic>{
        "customerAppType": "customer_mobile",
        "customerLocation": cart.value.toLocation?.toFirebaseFormattedJson() ??
            LocModel.Location(
              "Test _ Location ",
              LocationData.fromMap(
                {
                  "latitude": 15.872451864887513,
                  "longitude": -97.0771243663329
                },
              ),
            ).toFirebaseFormattedJson(),
        "deliveryCost": 20,
        "paymentType": cart.value.paymentType.toFirebaseFormatString(),
        "notes": cart.value.notes,
        "restaurantId": cart.value.restaurant!.info.hasuraId,
        "restaurantOrderType": "pickup",
        "tripDistance":
            0, // cart.value.getRouteInfo?.distance.distanceInMeters,
        "tripDuration": 0, // cart.value.getRouteInfo?.duration.seconds,
        "tripPolyline": '' //cart.value.getRouteInfo?.polyline,
        // }
      };

      mezDbgPrint("[+] -> payload :: $payload");
      final HttpsCallableResult<dynamic> response =
          await checkoutRestaurantCart.call(payload);
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      mezDbgPrint("error function");
      mezDbgPrint(e);
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> cancelOrder(int orderId) async {
    final HttpsCallable cancelOrder = FirebaseFunctions.instance
        .httpsCallable('restaurant-cancelOrderFromCustomer');
    try {
      final HttpsCallableResult<dynamic> response =
          await cancelOrder.call(<String, dynamic>{"orderId": orderId});
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
    if (_subscriptionId != null) _hasuraDb.cancelSubscription(_subscriptionId!);
    _cartListener?.cancel();
    _cartListener = null;
    super.onClose();
  }
}
