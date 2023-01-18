import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerCartController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/models/CustStripeInfo.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/customer/hsCustomer.dart';
import 'package:mezcalmos/Shared/graphql/delivery_cost/hsDeliveryCost.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as loc;
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

// controller class //
class CustCartViewController {
  // instances //
  CustomerAuthController customerAuthController =
      Get.find<CustomerAuthController>();

  CustomerCartController cartController = Get.find<CustomerCartController>();

  // Obs variables //
  Rxn<CustStripeInfo> custStripeInfo = Rxn();
  List<CreditCard>? get customerCards => custStripeInfo.value?.cards;
  RxList<PaymentOption> options = RxList<PaymentOption>();
  Rxn<loc.Location> orderToLocation = Rxn();

  CardChoice cartPaymentChoice = CardChoice.ApplePay;
  CreditCard? savedCardChoice;
  // dropdown value
  Rxn<PaymentOption> pickerChoice = Rxn<PaymentOption>();
  PaymentOption cash = {PickerChoice.Cash: null};
  // Payment Card //
  Rxn<CreditCard> card = Rxn();

  final RxBool clickedCheckout = false.obs;
  // texts
  TextEditingController noteText = TextEditingController();
  // getters //
  CardChoice get getCardChoice {
    return pickerChoice.value!.entries.first.key.toCardChoice();
  }

  Rxn<DeliveryCost> _mezDeliveryCost = Rxn<DeliveryCost>();
  DeliveryCost? get mezeliveryCost => _mezDeliveryCost.value;
  DeliveryCost? get deliveryCost {
    return cart.restaurant?.deliveryCost ?? mezeliveryCost;
  }

  RxBool isShippingSet = RxBool(false);
  num _orderDistanceInKm = 0;

  Cart get cart => cartController.cart.value!;
  Rxn<Cart> get _cartRxn => cartController.cart;
  num get getOrderDistance => _orderDistanceInKm;
  // init //
  Future<void> init() async {
    unawaited(get_delivery_cost(serviceProviderId: 1, withCache: false)
        .then((DeliveryCost? value) => _mezDeliveryCost.value = value));

    if (customerAuthController.customer?.stripeInfo?.cards.isNotEmpty == true)
      savedCardChoice =
          customerAuthController.customer?.stripeInfo?.cards.first;
    orderToLocation.value =
        customerAuthController.customer?.defaultLocation?.location;
    if (orderToLocation.value != null) {
      cart.toLocation = orderToLocation.value;
    }

    if (cart.cartPeriod != null) {
      cart.deliveryTime = cart.cartPeriod?.start;
    }
    //
    await _setDefaultOptions();
    await getCustomerCards();
    await _addingValusToOptions();
    pickerChoice.value = options.first;
  }

  Future<void> _setDefaultOptions() async {
    options.add({PickerChoice.Cash: null});
    if (await isApplePaySupported()) {
      options.add({PickerChoice.ApplePay: null});
    }
    if (await isGooglePaySupported()) {
      options.add({PickerChoice.GooglePay: null});
    }
  }

  Future<void> _addingValusToOptions() async {
    if (cart.restaurant?.acceptPayment(PaymentType.BankTransfer) == true) {
      options.add({PickerChoice.BankTransfer: null});
    }

    customerCards?.forEach((CreditCard element) {
      options.add({PickerChoice.SavedCard: element});
    });
    options.add({PickerChoice.NewCard: null});
  }

  Future<void> getCustomerCards() async {
    // TODO: hasura-ch
    final CustStripeInfo? data = await get_customer_stripe_info(
        userId: Get.find<AuthController>().hasuraUserId!, withCache: false);
    mezDbgPrint("Data from controller ==========>>> 😛${data?.toJson()}");
    if (data != null) {
      custStripeInfo.value = data;
      custStripeInfo.value?.cards = data.cards;
    }

    // cardsListener = Get.find<CustomerAuthController>()
    //     .customer
    //     .stream
    //     .listen((Customer? event) {
    //   if (event != null) {
    //     customerCards.clear();
    //     customerCards.value.addAll(event.savedCards);
    if (custStripeInfo.value?.cards.isEmpty == true) {
      options.removeWhere((PaymentOption element) =>
          element.entries.first.key == PickerChoice.SavedCard);
    }
    if (pickerChoice.value?.entries.first.key == PickerChoice.SavedCard &&
        custStripeInfo.value?.cards.isEmpty == true) {
      pickerChoice.value = options.first;
    }
    //   }
    // });
  }

  void _updateListWithNewCard() {
    options.removeWhere((PaymentOption element) =>
        element.entries.first.key == PickerChoice.SavedCard);

    customerCards?.forEach((CreditCard element) {
      options.add({PickerChoice.SavedCard: element});
    });

    options.refresh();
  }

  bool get shoudSchedule {
    return (cart.restaurant?.isOpen() == false || cart.isSpecial);
  }

  void switchPaymentMedthod(
      {required PaymentType paymentType, CreditCard? card}) {
    mezDbgPrint(
        "Switching on restControlller =========>>>>>${paymentType.toNormalString()}");
    _cartRxn.value?.paymentType = paymentType;
    _cartRxn.refresh();
  }

  // methods
  Future<void> switchPicker(PaymentOption value) async {
    if (value.keys.first == PickerChoice.Cash) {
      switchPaymentMedthod(paymentType: PaymentType.Cash);
    } else if (value.keys.first == PickerChoice.BankTransfer) {
      switchPaymentMedthod(paymentType: PaymentType.BankTransfer);
    } else {
      switchPaymentMedthod(paymentType: PaymentType.Card);
      await handlePaymentChoice(value);
    }
  }

  Future<void> handlePaymentChoice(PaymentOption newValue) async {
    switch (newValue.entries.first.key) {
      case PickerChoice.SavedCard:
        card.value = newValue.entries.first.value;
        pickerChoice.value = newValue;
        break;

      case PickerChoice.NewCard:
        final String? newCardId = await addCardSheet();
        if (newCardId != null) {
          await getCustomerCards();
          _updateListWithNewCard();
          mezDbgPrint(
              "Before first wheeeeereeee =========>${customerCards?.length}");
          final CreditCard? newCard = customerCards
              ?.firstWhere((CreditCard element) => element.id == newCardId);

          if (newCard != null) {
            card.value = newCard;
            // options
            //     .insert(options.length - 1, {PickerChoice.SavedCard: newCard});
            pickerChoice.value = options.firstWhere((PaymentOption element) =>
                element.entries.first.value?.id == newCard.id);
          }
        } else {
          switchPaymentMedthod(paymentType: PaymentType.Cash);
          pickerChoice.value = options.first;

          pickerChoice.refresh();
        }

        break;

      default:
        pickerChoice.value = newValue;
    }
  }

  Future<void> checkoutActionButton() async {
    cart.notes = noteText.text;
    try {
      final String? stripePaymentId =
          await acceptPaymentByCardChoice(getCardChoice);
      mezDbgPrint(
          "✅ Stripe payment id ====================>>>$stripePaymentId");
      final ServerResponse _serverResponse =
          await cartController.checkout(stripePaymentId: stripePaymentId);

      mezDbgPrint("datatatatataat => ${_serverResponse.data}");

      if (_serverResponse.success) {
        popEverythingAndNavigateTo(
          getRestaurantOrderRoute(
            _serverResponse.data["orderId"],
          ),
        );
      } else {
        print(_serverResponse);
        if (_serverResponse.errorCode == "serverError") {
          // do something
        } else if (_serverResponse.errorCode == "inMoreThanThreeOrders") {
          // do something
        } else if (_serverResponse.errorCode == "restaurantClosed") {
          // do something
        } else {
          // do something
        }
      }

      mezDbgPrint("success funish checkout");
    } catch (e, s) {
      mezDbgPrint(
        "Error happened during generating order's routeInfos / Stripe payment ===> #$e\n\nStackTrace ==> #$s",
      );
    }
  }

  /// returns stripePaymentId
  Future<String?> acceptPaymentByCardChoice(CardChoice choice) async {
    String? stripePaymentId;

    //viewCartController.getCardChoice
    if (cart.paymentType == PaymentType.Card) {
      switch (choice) {
        case CardChoice.ApplePay:
          final ServerResponse paymentIntentResponse = await getPaymentIntent(
              customerId: Get.find<AuthController>().user!.hasuraId.toString(),
              serviceProviderId:
                  cart.restaurant!.info.hasuraId.toString().toString(),
              orderType: OrderType.Restaurant,
              paymentAmount: cart.totalCost);
          stripePaymentId = extractPaymentIdFromIntent(
              paymentIntentResponse.data['paymentIntent'].toString());
          await acceptPaymentWithApplePay(
              paymentAmount: cart.totalCost,
              paymentIntentData: paymentIntentResponse.data,
              merchantName: cart.restaurant!.info.name);
          break;
        case CardChoice.GooglePay:
          final ServerResponse paymentIntentResponse = await getPaymentIntent(
              customerId: Get.find<AuthController>().user!.hasuraId.toString(),
              serviceProviderId:
                  cart.restaurant!.info.hasuraId.toString().toString(),
              orderType: OrderType.Restaurant,
              paymentAmount: cart.totalCost);
          stripePaymentId = extractPaymentIdFromIntent(
              paymentIntentResponse.data['paymentIntent'].toString());
          await acceptPaymentWithGooglePay(
              paymentAmount: cart.totalCost,
              paymentIntentData: paymentIntentResponse.data,
              merchantName: cart.restaurant!.info.name);
          break;
        case CardChoice.SavedCard:
          stripePaymentId = await acceptPaymentWithSavedCard(
              serviceProviderId:
                  cart.restaurant!.info.hasuraId.toString().toString(),
              paymentAmount: cart.totalCost,
              card: card.value!);
          break;
      }
    }
    return stripePaymentId;
  }

  void dispose() {
    noteText.dispose();
  }

  bool get showItemsImages {
    return cart.cartItems.firstWhereOrNull(
            (CartItem element) => element.item.image != null) !=
        null;
  }

  bool get showPaymentPicker {
    return cart.restaurant?.paymentInfo?.acceptedPayments[PaymentType.Card] ==
            true ||
        cart.restaurant?.paymentInfo
                    ?.acceptedPayments[PaymentType.BankTransfer] ==
                true &&
            custStripeInfo.value != null;
  }

  bool get showFees {
    mezDbgPrint("payment tyyype =====>${cart.paymentType.name}");
    mezDbgPrint(
        "payment tyyype =====>${cart.restaurant?.paymentInfo?.stripe?.chargeFeesOnCustomer}");
    return cart.paymentType == PaymentType.Card &&
        (cart.restaurant?.paymentInfo?.stripe?.chargeFeesOnCustomer ?? true);
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
  Future<void> deleteItem(int itemId) async {
    await cartController.deleteCartItem(itemId);
  }

  Future<bool> updateShippingPrice() async {
    isShippingSet.value = false;
    final LocModel.Location? loc = cart.toLocation;

    if (loc != null && cart.restaurant != null) {
      final MapHelper.Route? routeInfo = await MapHelper.getDurationAndDistance(
        cart.restaurant!.info.location,
        loc,
      );

      if (routeInfo != null) {
        _orderDistanceInKm = routeInfo.distance.distanceInMeters / 1000;
        mezDbgPrint("🤣  ${routeInfo.distance.distanceInMeters}");
        if (_orderDistanceInKm <= 15) {
          final num shippingCost =
              deliveryCost!.costPerKm * (_orderDistanceInKm);
          mezDbgPrint(
              "[[+]] Calculated final ShippingCost  ========>>>>>>>$shippingCost");
          if (shippingCost < deliveryCost!.minimumCost) {
            mezDbgPrint(
                "LESS THAN MINIMUM COST ===================== $shippingCost << ${deliveryCost!.minimumCost}");
            cart.shippingCost = deliveryCost!.minimumCost.ceil();
            _cartRxn.refresh();
          } else {
            cart.shippingCost = shippingCost.ceil();
          }
          cart.setRouteInformation = MapHelper.RouteInformation(
            polyline: routeInfo.encodedPolyLine,
            distance: routeInfo.distance,
            duration: routeInfo.duration,
          );

          // await saveCart();
          isShippingSet.value = true;

          return true;
        } else {
          cart.shippingCost = null;
          // await saveCart();
          isShippingSet.value = true;

          return true;
        }
      } else {
        cart.shippingCost = null;
        // await saveCart();
        isShippingSet.value = false;
        return false;
      }
    } else {
      cart.shippingCost = null;
      //   await saveCart();
      isShippingSet.value = true;

      return true;
    }
  }

  CartItem? incrementItem(
      {required int itemId, required int quantity, bool saveToDb = false}) {
    final CartItem? _item = cart.incrementItem(itemId, quantity);
    mezDbgPrint("[bb] Item -==> $_item");
    if (_item != null && saveToDb == true) {
      cartController.updateCartItem(_item);
      return _item;
    }

    return null;
  }

  bool get validTime {
    if (cart.deliveryTime != null) {
      return cart.deliveryTime!.toLocal().isAfter(DateTime.now().toLocal());
    } else {
      return true;
    }
  }
}

// helpers //

enum PickerChoice {
  SavedCard,
  GooglePay,
  ApplePay,
  Cash,
  NewCard,
  BankTransfer
}

enum CardChoice { SavedCard, GooglePay, ApplePay }

typedef PaymentOption = Map<PickerChoice, CreditCard?>;

extension pickerHelper on PickerChoice {
  String toNormalString() {
    final String str = toString().split('.').last.toLowerCase();

    return str.toLowerCase();
  }

  CardChoice toCardChoice() {
    switch (this) {
      case PickerChoice.ApplePay:
        return CardChoice.ApplePay;
      case PickerChoice.GooglePay:
        return CardChoice.GooglePay;
      case PickerChoice.SavedCard:
        return CardChoice.SavedCard;

      default:
        return CardChoice.SavedCard;
    }
  }
}
