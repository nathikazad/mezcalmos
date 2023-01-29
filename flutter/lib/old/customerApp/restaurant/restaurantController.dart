// import 'dart:async';

// import 'package:cloud_functions/cloud_functions.dart';
// import 'package:get/get.dart';
// import 'package:location/location.dart';
// import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
// import 'package:mezcalmos/CustomerApp/models/Cart.dart';
// import 'package:mezcalmos/CustomerApp/models/Customer.dart';
// import 'package:mezcalmos/Shared/controllers/authController.dart';
// import 'package:mezcalmos/Shared/database/HasuraDb.dart';
// import 'package:mezcalmos/Shared/graphql/customer/cart/hsCart.dart' as hsCart;
// import 'package:mezcalmos/Shared/graphql/delivery_cost/hsDeliveryCost.dart';
// import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
// import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart' as MapHelper;
// import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
// import 'package:mezcalmos/Shared/models/Orders/Order.dart';
// import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
// import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';
// import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;
// import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
// import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

// class RestaurantController extends GetxController {
//   AuthController _authController = Get.find<AuthController>();

//   StreamSubscription? _cartListener;
//   String? _subscriptionId;
//   Restaurant? associatedRestaurant;
//   Rx<Cart> cart = Cart().obs;
//   Rxn<DeliveryCost> _mezDeliveryCost = Rxn<DeliveryCost>();

//   RxBool isShippingSet = RxBool(false);
//   num _orderDistanceInKm = 0;

//   num get getOrderDistance => _orderDistanceInKm;
//   DeliveryCost? get mezeliveryCost => _mezDeliveryCost.value;
//   DeliveryCost? get deliveryCost {
//     return associatedRestaurant?.deliveryCost ?? mezeliveryCost;
//   }

//   @override
//   Future<void> onInit() async {
//     mezDbgPrint(
//         "Before saving first cart 🇹🇳🇹🇳🇹🇳🇹🇳 ${cart.value.cartItems}");
//     super.onInit();

//     mezDbgPrint(
//         "--------------------> RestaurantsCartController Initialized !");
//     try {
//       _mezDeliveryCost.value = await get_delivery_cost(serviceProviderId: 1);
//     } catch (e, stk) {
//       mezDbgPrint(e);
//       mezDbgPrint(stk);
//     }
//     mezDbgPrint("🤣mezDeliveryCost====>$_mezDeliveryCost");

//     if (_authController.fireAuthUser != null && _authController.user != null) {
//       await fetchCart();
//     }
//     if (Get.find<AuthController>().user?.hasuraId != null) {
//       final HasuraDb _hasuraDb = Get.find<HasuraDb>();
//       _hasuraDb.createSubscription(start: () {
//         _cartListener = hsCart
//             .listen_on_customer_cart(
//                 customer_id: Get.find<AuthController>().user!.hasuraId)
//             .listen((Cart? event) {
//           mezDbgPrint(
//               "Cart event stream from front 😍😍😍😍 ${event?.toFirebaseFormattedJson()}");
//           if (event != null) {
//             cart.value = event;
//             if (event.restaurant != null)
//               cart.value.restaurant = event.restaurant;

//             associatedRestaurant = event.restaurant;
//           }
//           cart.refresh();
//         });
//       }, cancel: () {
//         if (_subscriptionId != null)
//           _hasuraDb.cancelSubscription(_subscriptionId!);
//         _cartListener?.cancel();
//         _cartListener = null;
//       });
//     }
//     // check for old special items and remove them
//     checkCartPeriod();
//   }

//   Future<void> fetchCart() async {
//     final Cart? value = await hsCart.getCustomerCart(
//       customerId: Get.find<AuthController>().user!.hasuraId,
//     );
//     cart.value = value ?? Cart();
//     cart.value.restaurant = value?.restaurant;
//     associatedRestaurant = value?.restaurant;
//     cart.refresh();
//   }

//   Future<Restaurant?> getAssociatedRestaurant(int restaurantId) async {
//     return get_restaurant_by_id(id: restaurantId);
//   }

//   void checkCartPeriod() {
//     if (cart.value.cartPeriod != null &&
//         cart.value.cartPeriod!.end
//             .toLocal()
//             .isBefore(DateTime.now().toLocal())) {
//       final List<CartItem> specialITems = cart.value.cartItems
//           .where((CartItem element) => element.isSpecial)
//           .toList();
//       specialITems.forEach((CartItem element) {
//         if (element.item.endsAt!.toLocal().isBefore(DateTime.now().toLocal())) {
//           cart.value.cartItems.remove(element);
//         }
//       });
//     }
//   }

//   Future<bool> updateShippingPrice() async {
//     isShippingSet.value = false;
//     final LocModel.Location? loc = cart.value.toLocation;

//     if (loc != null) {
//       final MapHelper.Route? routeInfo = await MapHelper.getDurationAndDistance(
//         cart.value.restaurant!.info.location,
//         loc,
//       );

//       if (routeInfo != null) {
//         _orderDistanceInKm = routeInfo.distance.distanceInMeters / 1000;
//         mezDbgPrint("🤣  ${routeInfo.distance.distanceInMeters}");
//         if (_orderDistanceInKm <= 15) {
//           final num shippingCost =
//               deliveryCost!.costPerKm * (_orderDistanceInKm);
//           mezDbgPrint(
//               "[[+]] Calculated final ShippingCost  ========>>>>>>>$shippingCost");
//           if (shippingCost < deliveryCost!.minimumCost) {
//             mezDbgPrint(
//                 "LESS THAN MINIMUM COST ===================== $shippingCost << ${deliveryCost!.minimumCost}");
//             cart.value.shippingCost = deliveryCost!.minimumCost.ceil();
//           } else {
//             cart.value.shippingCost = shippingCost.ceil();
//           }
//           cart.value.setRouteInformation = MapHelper.RouteInformation(
//             polyline: routeInfo.encodedPolyLine,
//             distance: routeInfo.distance,
//             duration: routeInfo.duration,
//           );

//           // await saveCart();
//           isShippingSet.value = true;

//           return true;
//         } else {
//           cart.value.shippingCost = null;
//           // await saveCart();
//           isShippingSet.value = true;

//           return true;
//         }
//       } else {
//         cart.value.shippingCost = null;
//         // await saveCart();
//         isShippingSet.value = false;
//         return false;
//       }
//     } else {
//       cart.value.shippingCost = null;
//       //   await saveCart();
//       isShippingSet.value = true;

//       return true;
//     }
//   }

//   bool get validTime {
//     if (cart.value.deliveryTime != null) {
//       return cart.value.deliveryTime!
//           .toLocal()
//           .isAfter(DateTime.now().toLocal());
//     } else {
//       return true;
//     }
//   }

//   bool get canOrder {
//     return true;
//     // TODO : Hasura-ch
//     // cart.value.toLocation != null &&
//     //     _orderDistanceInKm <= 10 &&
//     //     isShippingSet.isTrue &&
//     //     validTime &&
//     //     cart.value.shippingCost != null &&
//     //     (associatedRestaurant?.isOpen() ?? false);
//   }

//   Future<void> saveCart() async {
//     // if (_authController.user?.hasuraId != null) {
//     //   // final Cart? _cart = await hsCart.update_cart(
//     //   //   customer_id: _authController.user!.hasuraId,
//     //   //   restaurant_id: associatedRestaurant!.info.hasuraId,
//     //   //   items: cart.value.cartItems,
//     //   // );
//     //   if (_cart != null) {
//     //     cart.value = _cart;
//     //     mezDbgPrint(
//     //         "😛 Cart items after calling save cart ======>${_cart.cartItems.length}");
//     //   }
//     // }
//     cart.refresh();
//   }

//   Future<void> addItem(CartItem cartItem) async {
//     mezDbgPrint(
//         "@m66are adding this to cart ==========>${cartItem.toFirebaseFunctionFormattedJson()}");
//     final int restaurantId = cartItem.restaurantId;
//     if (associatedRestaurant == null) {
//       mezDbgPrint(
//           "@@saadf@@ restaurantController::addItem ---> associatedRestaurant == null !");
//       associatedRestaurant = await getAssociatedRestaurant(restaurantId);
//       cart.value = Cart(restaurant: associatedRestaurant!);
//     } else if (associatedRestaurant!.info.hasuraId.toString().toString() !=
//         restaurantId) {
//       mezDbgPrint(
//           "@@saadf@@ restaurantController::addItem ---> associatedRestaurant!.id != restaurantId!");

//       // In future, throw items from another restaurant in cart error
//       // for now clear cart and associate new restaurant
//       associatedRestaurant = await getAssociatedRestaurant(restaurantId);
//       cart.value = Cart(restaurant: associatedRestaurant!);
//     }

//     mezDbgPrint(
//       "@@saadf@@ restaurantController::addItem ---> addingItem and saving card !",
//     );

//     cart.value.addItem(cartItem);
//     await saveCart();
//   }

//   CartItem? incrementItem(int itemId, int quantity) {
//     final CartItem? _item = cart.value.incrementItem(itemId, quantity);
//     mezDbgPrint("[bb] Item -==> $_item");
//     if (_item != null) {
//       hsCart.update_item_quantity(
//         quantity: quantity,
//         customer_id: _authController.user!.hasuraId,
//         item_id: _item.idInCart!,
//       );
//     }
//     saveCart();
//     return _item;
//   }

//   void deleteItem(int itemId) {
//     cart.value.deleteItem(itemId);
//     saveCart();
//   }

//   void switchPaymentMedthod(
//       {required PaymentType paymentType, CreditCard? card}) {
//     mezDbgPrint(
//         "Switching on restControlller =========>>>>>${paymentType.toNormalString()}");
//     cart.value.paymentType = paymentType;

//     saveCart();
//   }

//   bool get showItemsImages {
//     mezDbgPrint(
//         "TEEEEEST IMAGE ====>${cart.value.cartItems.firstWhereOrNull((CartItem element) => element.item.image != null)}");
//     return cart.value.cartItems.firstWhereOrNull(
//             (CartItem element) => element.item.image != null) !=
//         null;
//   }

//   bool get showPaymentPicker {
//     return cart.value.restaurant?.paymentInfo
//                 ?.acceptedPayments[PaymentType.Card] ==
//             true ||
//         cart.value.restaurant?.paymentInfo
//                 ?.acceptedPayments[PaymentType.BankTransfer] ==
//             true;
//   }

//   bool get showFees {
//     return cart.value.paymentType == PaymentType.Card &&
//         (cart.value.restaurant?.paymentInfo?.stripe?.chargeFeesOnCustomer ??
//             true);
//   }

//   Future<void> clearCart() async {
//     cart.value = Cart();
//     if (Get.find<AuthController>().user?.hasuraId != null) {
//       await hsCart.clear_customer_cart(
//           customer_id: Get.find<AuthController>().user!.hasuraId);
//     }
//     Get.appUpdate();
//   }

//   Future<ServerResponse> checkout({String? stripePaymentId}) async {
//     final HttpsCallable checkoutRestaurantCart =
//         FirebaseFunctions.instance.httpsCallable("restaurant2-checkoutCart");

//     try {
//       mezDbgPrint("[+]Delivery time ===> ${cart.value.getRouteInfo}");
//       final Map<String, dynamic> payload = <String, dynamic>{
//         // "customerId": _authController.user!.hasuraId,
//         // "checkoutRequest": <String, dynamic>{
//         "customerAppType": "customer",

//         "customerLocation": cart.value.toLocation?.toFirebaseFormattedJson() ??
//             LocModel.Location(
//               "Test _ Location ",
//               LocationData.fromMap(
//                 {
//                   "latitude": 15.872451864887513,
//                   "longitude": -97.0771243663329
//                 },
//               ),
//             ).toFirebaseFormattedJson(),
//         "deliveryCost": cart.value.shippingCost ?? 0,
//         "itemsCost": cart.value.itemsCost(),
//         "scheduledTime": cart.value.deliveryTime?.toUtc().toString(),
//         "paymentType": cart.value.paymentType.toFirebaseFormatString(),
//         "notes": cart.value.notes,
//         "restaurantId": cart.value.restaurant!.info.hasuraId,
//         "restaurantOrderType": "pickup",
//         "tripDistance": cart.value.getRouteInfo?.distance.distanceInMeters ??
//             0, // cart.value.getRouteInfo?.distance.distanceInMeters,
//         "tripDuration": cart.value.getRouteInfo?.duration.seconds ??
//             0, // cart.value.getRouteInfo?.duration.seconds,
//         "tripPolyline": cart.value.getRouteInfo?.polyline ??
//             '' //cart.value.getRouteInfo?.polyline,
//         // }
//       };

//       mezDbgPrint("[+] -> payload :: $payload");
//       final HttpsCallableResult<dynamic> response =
//           await checkoutRestaurantCart.call(payload);
//       return ServerResponse.fromJson(response.data);
//     } catch (e) {
//       mezDbgPrint("error function");
//       mezDbgPrint(e);
//       return ServerResponse(ResponseStatus.Error,
//           errorMessage: "Server Error", errorCode: "serverError");
//     }
//   }

//   Future<ServerResponse> cancelOrder(int orderId) async {
//     final HttpsCallable cancelOrder = FirebaseFunctions.instance
//         .httpsCallable('restaurant2-cancelOrderFromCustomer');
//     try {
//       final HttpsCallableResult<dynamic> response =
//           await cancelOrder.call(<String, dynamic>{"orderId": orderId});
//       mezDbgPrint(response.toString());
//       print(response.data);

//       final ServerResponse res = ServerResponse.fromJson(response.data);
//       if (res.success) {
//         await fetchCart();
//         await Get.find<OrderController>().fetchCustomerOrders();
//       }
//       return res;
//     } catch (e) {
//       return ServerResponse(ResponseStatus.Error,
//           errorMessage: "Server Error", errorCode: "serverError");
//     }
//   }

//   Future<ServerResponse> addReview({
//     required String orderId,
//     required String restaurantId,
//     required String comment,
//     required num rate,
//   }) async {
//     final HttpsCallable cancelOrder =
//         FirebaseFunctions.instance.httpsCallable('restaurant-addReview');
//     try {
//       final HttpsCallableResult<dynamic> response =
//           await cancelOrder.call(<String, dynamic>{
//         "orderId": orderId,
//         "serviceProviderId": restaurantId,
//         "rating": rate,
//         "comment": comment,
//         "orderType": OrderType.Restaurant.toFirebaseFormatString(),
//       });
//       mezDbgPrint(response.toString());
//       print(response.data);
//       return ServerResponse.fromJson(response.data);
//     } catch (e) {
//       return ServerResponse(ResponseStatus.Error,
//           errorMessage: "Server Error", errorCode: "serverError");
//     }
//   }

//   @override
//   void onClose() {
//     print("[+] RestaurantCartController::onClose ---------> Was invoked !");
//     if (_subscriptionId != null)
//       Get.find<HasuraDb>().cancelSubscription(_subscriptionId!);
//     _cartListener?.cancel();
//     _cartListener = null;
//     super.onClose();
//   }
// }
