import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
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
  void onInit() {
    if (_auth.hasuraUserId != null) {
      _initCart();
    }
    super.onInit();
  }

  Future<void> _initCart() async {
    await fetchCart();

    subscriptionId = _hasuraDb.createSubscription(start: () {
      cartStream = listen_on_customer_cart(customer_id: _auth.hasuraUserId!)
          .listen((Cart? event) {
        if (event != null) {
          mezDbgPrint(
              "Stream triggred from cart controller ✅✅✅✅✅✅✅✅✅ =====> ${event.toFirebaseFormattedJson()}");
          cart.value = event;
          cart.value?.restaurant = event.restaurant;
          cart.refresh();
        }
      });
    }, cancel: () {
      cartStream?.cancel();
      cartStream = null;
    });
  }

  @override
  void onClose() {
    if (subscriptionId != null) _hasuraDb.cancelSubscription(subscriptionId!);
    super.onClose();
  }

  Future<void> fetchCart() async {
    if (_auth.hasuraUserId != null) {
      final Cart? value = await get_customer_cart(
        customerId: _auth.user!.hasuraId,
      );
      cart.value = value ?? Cart();
      cart.value?.restaurant = value?.restaurant;
    }
  }

  Future<void> clearCart() async {
    if (_auth.user?.hasuraId != null) {
      try {
        await clear_customer_cart(
            customer_id: Get.find<AuthController>().user!.hasuraId);
      } catch (e, stk) {
        mezDbgPrint(e);
        mezDbgPrint(stk);
      }
    }
  }

  Future<bool> updateCartItem(int cartItemId) async {
    final CartItem? cartItem = cart.value!.cartItems
        .firstWhereOrNull((CartItem element) => element.idInCart == cartItemId);
    if (cartItem != null) {
      await update_cart_item(cartItem: cartItem, id: cartItemId);
      return true;
    } else
      return false;
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

  Future<int> addCartItem(CartItem cartItem) async {
    if (cart.value != null &&
        cart.value!.cartItems.isNotEmpty &&
        cart.value!.restaurant?.restaurantId != cartItem.restaurantId) {
      await clearCart();
      await setCartRestaurantId(cartItem.restaurantId);
    }
    final int res = await add_item_to_cart(
      cartItem: cartItem,
    );
    return res;
  }

  Future<int> setCartRestaurantId(int restaurantId) async {
    final int res = await set_cart_restaurant_id(
      customer_id: _auth.hasuraUserId!,
      restaurant_id: restaurantId,
    );
    return res;
  }

  Future<ServerResponse> checkout({String? stripePaymentId}) async {
    final HttpsCallable checkoutRestaurantCart =
        FirebaseFunctions.instance.httpsCallable("restaurant2-checkoutCart");

    try {
      final Map<String, dynamic> payload = <String, dynamic>{
        // "customerId": _authController.user!.hasuraId,
        // "checkoutRequest": <String, dynamic>{
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
        "tripDistance":
            cart.value?.getRouteInfo?.distance.distanceInMeters ?? 0,
        "tripDuration": cart.value?.getRouteInfo?.duration.seconds ??
            0, // cart.value.getRouteInfo?.duration.seconds,
        "tripPolyline": cart.value?.getRouteInfo?.polyline ??
            '' //cart.value.getRouteInfo?.polyline,
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
}
