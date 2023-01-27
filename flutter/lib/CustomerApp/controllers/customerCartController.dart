import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart'
    as cloudFunctionModels;
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/customer/cart/hsCart.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class CustomerCartController extends GetxController {
// instances //
  HasuraDb _hasuraDb = Get.find<HasuraDb>();
  AuthController _auth = Get.find<AuthController>();
  Rxn<Cart> cart = Rxn<Cart>();
  // streams //
  StreamSubscription<Cart?>? cartStream;
  String? subscriptionId;
  @override
  Future<void> onInit() async {
    if (_auth.hasuraUserId != null) {
      await _initCart();
    }
    super.onInit();
  }

  Future<void> _initCart() async {
    await fetchCart();
    await _handlerRestaurantId();
    subscriptionId = _hasuraDb.createSubscription(start: () {
      cartStream = listen_on_customer_cart(customer_id: _auth.hasuraUserId!)
          .listen((Cart? event) {
        if (event != null) {
          mezDbgPrint(
              "Stream triggred from cart controller ${_auth.hasuraUserId!} ✅✅✅✅✅✅✅✅✅ =====> ${event.restaurant?.paymentInfo?.acceptedPayments.entries}");
          cart.value = event;
          cart.value?.restaurant = event.restaurant;
          _handlerRestaurantId();
          cart.refresh();
        } else {
          cart.value = null;
          cart.refresh();
        }
      });
    }, cancel: () {
      cartStream?.cancel();
      cartStream = null;
    });
  }

  Future<void> _handlerRestaurantId() async {
    if (cart.value != null &&
        cart.value?.restaurant == null &&
        cart.value!.cartItems.isNotEmpty) {
      await setCartRestaurantId(cart.value!.cartItems.first.restaurantId);
    }
  }

  @override
  void onClose() {
    if (subscriptionId != null) _hasuraDb.cancelSubscription(subscriptionId!);
    super.onClose();
  }

  Future<void> fetchCart() async {
    if (_auth.hasuraUserId != null) {
      final Cart? value = await get_customer_cart(
        customerId: _auth.hasuraUserId!,
      );
      mezDbgPrint(
          "Fetching cart with ===================>${_auth.hasuraUserId!}========>${value?.toFirebaseFormattedJson()}");
      if (value != null) {
        cart.value = value;
        cart.value?.restaurant = value.restaurant;
      }
    }
  }

  Future<void> clearCart() async {
    if (_auth.user?.hasuraId != null) {
      try {
        await clear_customer_cart(
            customer_id: Get.find<AuthController>().hasuraUserId!);
      } catch (e, stk) {
        mezDbgPrint(e);
        mezDbgPrint(stk);
      }
    }
  }

  Future<bool> updateCartItem(CartItem cartItem) async {
    await update_cart_item(cartItem: cartItem, id: cartItem.idInCart!);
    return true;
  }

  Future<bool> deleteCartItem(int cartItemId) async {
    final CartItem? cartItem = cart.value!.cartItems
        .firstWhereOrNull((CartItem element) => element.idInCart == cartItemId);
    if (cartItem != null) {
      await delete_cart_item(item_id: cartItemId);
      return true;
    } else
      return false;
  }

  Future<int?> addCartItem(CartItem cartItem) async {
    if (cart.value != null &&
        cart.value!.cartItems.isNotEmpty &&
        cart.value!.restaurant?.restaurantId != cartItem.restaurantId) {
      await clearCart();
      await setCartRestaurantId(cartItem.restaurantId);
    }
    try {
      final int res = await add_item_to_cart(
        cartItem: cartItem,
      );
      return res;
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    return null;
  }

  Future<int?> setCartRestaurantId(int restaurantId) async {
    try {
      final int res = await set_cart_restaurant_id(
        customer_id: _auth.hasuraUserId!,
        restaurant_id: restaurantId,
      );
      return res;
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    return null;
  }

  Future<ServerResponse> checkout({String? stripePaymentId}) async {
    try {
      final Map<String, dynamic> payload = <String, dynamic>{
        // "customerId": _authController.user!.hasuraId,
        // "checkoutRequest": <String, dynamic>{
        "stripePaymentId": stripePaymentId,
        "stripeFees": cart.value?.stripeFees,
        "customerAppType": "customer",

        "customerLocation": cart.value?.toLocation?.toFirebaseFormattedJson() ??
            LocModel.Location(
              "Test _ Location ",
              LocationData.fromMap(
                {
                  "latitude": 15.872451864887513,
                  "longitude": -97.0771243663329
                },
              ),
            ).toFirebaseFormattedJson(),
        "deliveryCost": cart.value?.shippingCost ?? 0,
        "itemsCost": cart.value?.itemsCost(),
        "scheduledTime": cart.value?.deliveryTime?.toUtc().toString(),
        "paymentType": cart.value?.paymentType.toFirebaseFormatString(),
        "notes": cart.value?.notes,
        "restaurantId": cart.value?.restaurant!.info.hasuraId,

        "restaurantOrderType": "pickup",
      };

      mezDbgPrint("[+] -> payload :: $payload");
      final ServerResponse res = await CloudFunctions.restaurant2_checkoutCart(
          customerAppType: cloudFunctionModels.AppType.Customer,
          customerLocation: cloudFunctionModels.Location(
              cart.value?.toLocation!.latitude,
              cart.value?.toLocation!.longitude,
              cart.value?.toLocation!.address),
          deliveryCost: cart.value!.shippingCost!,
          paymentType: cart.value!.paymentType.toFirebaseFormatEnum(),
          notes: cart.value?.notes,
          restaurantId: cart.value!.restaurant!.info.hasuraId,
          tripDistance: cart.value!.getRouteInfo!.distance.distanceInMeters,
          tripDuration: cart.value!.getRouteInfo!.duration.seconds,
          tripPolyline: cart.value!.getRouteInfo!.polyline,
          deliveryType: cloudFunctionModels.DeliveryType.Delivery,
          scheduledTime: cart.value?.deliveryTime?.toUtc().toString(),
          stripePaymentId: stripePaymentId,
          stripeFees: cart.value?.stripeFees);

      return res;
    } catch (e) {
      mezDbgPrint("error function");
      mezDbgPrint(e);
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
}
