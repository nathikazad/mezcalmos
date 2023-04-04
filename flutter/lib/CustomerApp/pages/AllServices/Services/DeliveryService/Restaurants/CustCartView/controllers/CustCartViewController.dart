import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerCartController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Restaurants/CustRestaurantOrderView/CustRestaurantOrderView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart'
    as MapHelper;
// import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as loc;
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

// controller class //
class CustCartViewController {
  // instances //
  CustomerAuthController customerAuthController =
      Get.find<CustomerAuthController>();

  CustomerCartController cartController = Get.find<CustomerCartController>();

  // Obs variables //
  //Rxn<CustStripeInfo> custStripeInfo = Rxn();
  Rxn<List<CreditCard>> _cards = Rxn();

  List<CreditCard>? get customerCards => _cards.value;
  RxList<PaymentOption> options = RxList<PaymentOption>();
  Rxn<loc.MezLocation> orderToLocation = Rxn();

  // CardChoice cartPaymentChoice = CardChoice.ApplePay;
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
  // CardChoice get getCardChoice {
  //   return pickerChoice.value!.entries.first.key.toCardChoice();
  // }

  DeliveryCost? get deliveryCost {
    return cart.restaurant?.deliveryCost;
  }

  RxBool isShippingSet = RxBool(false);
  RxBool hasData = RxBool(false);
  num _orderDistanceInKm = 0;

  Cart get cart => cartController.cart.value ?? Cart();

  Rxn<Cart> get _cartRxn => cartController.cart;

  num get getOrderDistance => _orderDistanceInKm;

  // init //
  Future<void> init() async {
    if (customerAuthController.customer?.stripeInfo?.cards.isNotEmpty == true)
      savedCardChoice =
          customerAuthController.customer?.stripeInfo?.cards.first;

    if (cart.cartPeriod != null) {
      cart.deliveryTime = cart.cartPeriod?.start;
    }
    await customerAuthController.fetchSavedLocations();
    orderToLocation.value =
        customerAuthController.customer?.defaultLocation?.location;
    if (orderToLocation.value != null) {
      _cartRxn.value?.toLocation = orderToLocation.value;

      // ignore: unawaited_futures
    }

    //
    await _setDefaultOptions();
    // await getCustomerCards();
    await _addingValusToOptions();
    pickerChoice.value = options.first;
    if (_cartRxn.value?.toLocation != null) {
      await updateShippingPrice();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => _cartRxn.refresh());
    hasData.value = true;
  }

  Future<void> _setDefaultOptions() async {
    options.add({PickerChoice.Cash: null});
    // if (await isApplePaySupported()) {
    //   options.add({PickerChoice.ApplePay: null});
    // }
    // if (await isGooglePaySupported()) {
    //   options.add({PickerChoice.GooglePay: null});
    // }
  }

  Future<void> _addingValusToOptions() async {
    // if (cart.restaurant?.acceptPayment(PaymentType.BankTransfer) == true) {
    //   options.add({PickerChoice.BankTransfer: null});
    // }

    // customerCards?.forEach((CreditCard element) {
    //   options.add({PickerChoice.SavedCard: element});
    // });
    // options.add({PickerChoice.NewCard: null});
  }

  // Future<void> getCustomerCards() async {
  //   // TODO: hasura-ch
  //   final List<CreditCard> data = await get_customer_cards(
  //       customerId: Get.find<AuthController>().hasuraUserId!, withCache: false);
  //   mezDbgPrint("Data from controller ==========>>> 😛${data.length}");
  //   _cards.value = data;

  //   if (_cards.value?.isEmpty == true) {
  //     options.removeWhere((PaymentOption element) =>
  //         element.entries.first.key == PickerChoice.SavedCard);
  //   }
  //   if (pickerChoice.value?.entries.first.key == PickerChoice.SavedCard &&
  //       _cards.value?.isEmpty == true) {
  //     pickerChoice.value = options.first;
  //   }
  //   //   }
  //   // });
  // }

  // void _updateListWithNewCard() {
  //   options.removeWhere((PaymentOption element) =>
  //       element.entries.first.key == PickerChoice.SavedCard);

  //   customerCards?.forEach((CreditCard element) {
  //     options.add({PickerChoice.SavedCard: element});
  //   });

  //   options.refresh();
  // }

  bool get shoudSchedule {
    return (cart.restaurant?.isOpen() == false || cart.isSpecial);
  }

  void switchPaymentMedthod(
      {required PaymentType paymentType, CreditCard? card}) {
    _cartRxn.value?.paymentType = paymentType;
    _cartRxn.refresh();
  }

  // methods
  Future<void> switchPicker(PaymentOption value) async {
    if (value.keys.first == PickerChoice.Cash) {
      switchPaymentMedthod(paymentType: PaymentType.Cash);
    }
    // else if (value.keys.first == PickerChoice.BankTransfer) {
    //   switchPaymentMedthod(paymentType: PaymentType.BankTransfer);
    // } else {
    //   switchPaymentMedthod(paymentType: PaymentType.Card);
    //   await handlePaymentChoice(value);
    // }
  }

  // Future<void> handlePaymentChoice(PaymentOption newValue) async {
  //   switch (newValue.entries.first.key) {
  //     case PickerChoice.SavedCard:
  //       card.value = newValue.entries.first.value;
  //       pickerChoice.value = newValue;
  //       break;

  //     case PickerChoice.NewCard:
  //       final String? newCardId = await addCardSheet();
  //       if (newCardId != null) {
  //         await getCustomerCards();
  //         _updateListWithNewCard();
  //         mezDbgPrint(
  //             "Before first wheeeeereeee =========>${customerCards?.length}");
  //         final CreditCard? newCard = customerCards
  //             ?.firstWhere((CreditCard element) => element.cardId == newCardId);

  //         if (newCard != null) {
  //           card.value = newCard;
  //           // options
  //           //     .insert(options.length - 1, {PickerChoice.SavedCard: newCard});
  //           pickerChoice.value = options.firstWhere((PaymentOption element) =>
  //               element.entries.first.value?.cardId == newCard.cardId);
  //         }
  //       } else {
  //         switchPaymentMedthod(paymentType: PaymentType.Cash);
  //         pickerChoice.value = options.first;

  //         pickerChoice.refresh();
  //       }

  //       break;

  //     default:
  //       pickerChoice.value = newValue;
  //   }
  // }

  Future<void> checkoutActionButton() async {
    cart.notes = noteText.text;
    num? newOrderId;
    try {
      // if (cart.paymentType == PaymentType.Card) {
      //   final String? stripePaymentId =
      //       await acceptPaymentByCardChoice(getCardChoice);
      //   if (stripePaymentId != null) {
      //     newOrderId =
      //         await cartController.checkout(stripePaymentId: stripePaymentId);
      //   }
      // } else {
      newOrderId = await cartController.checkout(stripePaymentId: null);
      // }

      if (newOrderId != null) {
        // ignore: unawaited_futures
        MezRouter.popEverythingTillBeforeHome().then((_) =>
            ViewRestaurantOrderScreen.navigate(orderId: newOrderId!.toInt()));
      }

      mezDbgPrint("success funish checkout");
    } catch (e, s) {
      mezDbgPrint(
        "Error happened during generating order's routeInfos / Stripe payment ===> #$e\n\nStackTrace ==> #$s",
      );
    }
  }

  /// returns stripePaymentId
  // Future<String?> acceptPaymentByCardChoice(CardChoice choice) async {
  //   String? stripePaymentId;
  //   mezDbgPrint("Look here ============>${cart.restaurant!.serviceDetailsId}");
  //   //viewCartController.getCardChoice
  //   if (cart.paymentType == PaymentType.Card) {
  //     switch (choice) {
  //       case CardChoice.ApplePay:
  //         cModel.PaymentIntentResponse? paymentIntent = await getPaymentIntent(
  //             serviceProviderDetailsId: cart.restaurant!.serviceDetailsId,
  //             paymentAmount: cart.totalCost);
  //         if (paymentIntent != null) {
  //           stripePaymentId = extractPaymentIdFromIntent(
  //               paymentIntent.paymentIntent.toString());
  //           await acceptPaymentWithApplePay(
  //               paymentAmount: cart.totalCost,
  //               paymentIntentData: paymentIntent,
  //               merchantName: cart.restaurant!.info.name);
  //         }
  //         break;
  //       case CardChoice.GooglePay:
  //         cModel.PaymentIntentResponse? paymentIntent = await getPaymentIntent(
  //             serviceProviderDetailsId: cart.restaurant!.serviceDetailsId,
  //             paymentAmount: cart.totalCost);
  //         if (paymentIntent != null) {
  //           stripePaymentId = extractPaymentIdFromIntent(
  //               paymentIntent.paymentIntent.toString());
  //           await acceptPaymentWithGooglePay(
  //               paymentAmount: cart.totalCost,
  //               paymentIntentData: paymentIntent,
  //               merchantName: cart.restaurant!.info.name);
  //         }
  //         break;
  //       case CardChoice.SavedCard:
  //         stripePaymentId = await acceptPaymentWithSavedCard(
  //             serviceProviderDetailsId: cart.restaurant!.serviceDetailsId,
  //             paymentAmount: cart.totalCost,
  //             card: card.value!);
  //         break;
  //     }
  //   }
  //   return stripePaymentId;
  // }

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
            true;
  }

  bool get showFees {
    return cart.paymentType == PaymentType.Card &&
        (cart.restaurant?.paymentInfo?.stripe?.chargeFeesOnCustomer ?? true);
  }

  bool get canSchedule {
    return cart.restaurant?.isOpen() == false && validTime;
  }

  bool get canOrder {
    return cart.toLocation != null &&
        _orderDistanceInKm <= 10 &&
        isShippingSet.isTrue &&
        validTime &&
        cart.shippingCost != null &&
        (cart.restaurant?.isOpen() == true || canSchedule);
  }

  void checkCartPeriod() {
    if (cart.cartPeriod != null &&
        cart.cartPeriod!.end.toLocal().isBefore(DateTime.now().toLocal())) {
      final List<CartItem> specialITems = cart.cartItems
          .where((CartItem element) => element.isSpecial)
          .toList();
      specialITems.forEach((CartItem element) {
        if (element.item.endsAt!.toLocal().isBefore(DateTime.now().toLocal())) {
          cart.cartItems.remove(element);
        }
      });
    }
  }

  Future<void> deleteItem(int itemId) async {
    await cartController.deleteCartItem(itemId);
  }

  Future<bool> updateShippingPrice() async {
    isShippingSet.value = false;
    final LocModel.MezLocation? loc = cart.toLocation;

    if (loc != null && cart.restaurant != null) {
      final MapHelper.Route? routeInfo = await MapHelper.getDurationAndDistance(
        cart.restaurant!.info.location,
        loc,
      );

      if (routeInfo != null) {
        _orderDistanceInKm = routeInfo.distance.distanceInMeters / 1000;
        if (_orderDistanceInKm <= 15) {
          final num shippingCost =
              deliveryCost!.costPerKm * (_orderDistanceInKm);
          if (shippingCost < deliveryCost!.minimumCost) {
            cart.shippingCost = deliveryCost!.minimumCost.ceil();
            _cartRxn.refresh();
          } else {
            cart.shippingCost = shippingCost.ceil();
            _cartRxn.refresh();
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
          isShippingSet.value = false;

          return false;
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
      isShippingSet.value = false;

      return false;
    }
  }

  Future<CartItem?> incrementItem(
      {required int itemId,
      required int quantity,
      bool saveToDb = false}) async {
    final CartItem? _item = cart.incrementItem(itemId, quantity);
    if (_item != null && saveToDb == true) {
      await cartController.updateCartItem(_item);
      return _item;
    }

    return null;
  }

  bool get validTime {
    if (cart.deliveryTime != null) {
      return cart.deliveryTime!.toLocal().isAfter(DateTime.now().toLocal());
    } else {
      return cart.restaurant?.isOpen() == true;
    }
  }

  void switchLocation(loc.MezLocation location) {
    _cartRxn.value?.toLocation = location;
    _cartRxn.refresh();
    updateShippingPrice();
  }

  void setDeliveryTime(DateTime? dateTime) {
    _cartRxn.value?.deliveryTime = dateTime;
    _cartRxn.refresh();
  }
}

// helpers //

enum PickerChoice {
  // SavedCard,
  // GooglePay,
  // ApplePay,
  Cash,
  // NewCard,
  // BankTransfer
}

// enum CardChoice { SavedCard, GooglePay, ApplePay }

typedef PaymentOption = Map<PickerChoice, CreditCard?>;

// extension pickerHelper on PickerChoice {
//   String toNormalString() {
//     final String str = toString().split('.').last.toLowerCase();

//     return str.toLowerCase();
//   }

//   CardChoice toCardChoice() {
//     switch (this) {
//       case PickerChoice.ApplePay:
//         return CardChoice.ApplePay;
//       case PickerChoice.GooglePay:
//         return CardChoice.GooglePay;
//       case PickerChoice.SavedCard:
//         return CardChoice.SavedCard;

//       default:
//         return CardChoice.SavedCard;
//     }
//   }
// }
