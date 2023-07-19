import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/CustRestaurantCartController.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantOrderView/CustRestaurantOrderView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart'
    as MapHelper;
// import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as loc;
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

// controller class //
class CustRestaurantCartViewController {
  // instances //
  CustomerAuthController customerAuthController =
      Get.find<CustomerAuthController>();
  GlobalKey<FormState> formKey = GlobalKey();

  CustRestaurantCartController cartController =
      Get.find<CustRestaurantCartController>();

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
  Rx<cModels.DeliveryType> dvType = Rx(cModels.DeliveryType.Delivery);
  RxList<cModels.DeliveryType> availableDvTypes =
      RxList([cModels.DeliveryType.Delivery, cModels.DeliveryType.Pickup]);

  // texts
  TextEditingController noteText = TextEditingController();

  // getters //
  // CardChoice get getCardChoice {
  //   return pickerChoice.value!.entries.first.key.toCardChoice();
  // }

  RxDouble estDeliveryCost = RxDouble(40);

  DeliveryCost? get deliveryCost {
    return cart.restaurant?.deliveryCost;
  }

  RxBool isShippingSet = RxBool(false);
  RxBool hasData = RxBool(false);
  RxnDouble orderDistanceInKm = RxnDouble();
  List<int> selectedCompanies = [];

  Cart get cart => cartController.cart.value ?? Cart();

  Rxn<Cart> get _cartRxn => cartController.cart;
  bool get showDelivery => dvType.value == cModels.DeliveryType.Delivery;

  // init //
  Future<void> init() async {
    mezDbgPrint("SUPER INIT");
    final loc.MezLocation? baseLoc =
        await get_service_location(serviceDetailsId: 63);
    mezDbgPrint("base looooooooc ====>${baseLoc?.toFirebaseFormattedJson()}");
    if (customerAuthController.customer?.stripeInfo?.cards.isNotEmpty == true)
      savedCardChoice =
          customerAuthController.customer?.stripeInfo?.cards.first;

    if (cart.cartPeriod != null) {
      cart.deliveryTime = cart.cartPeriod?.start;
    }
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
    await customerAuthController.fetchSavedLocations();

    WidgetsBinding.instance.addPostFrameCallback((_) => _cartRxn.refresh());
    hasData.value = true;
  }

  Future<void> _setDefaultOptions() async {
    mezDbgPrint("SUPER _setDefaultOptions");
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

  void switchPaymentMedthod(
      {required cModels.PaymentType paymentType, CreditCard? card}) {
    _cartRxn.value?.paymentType = paymentType;
    _cartRxn.refresh();
  }

  // methods
  Future<void> switchPicker(PaymentOption value) async {
    if (value.keys.first == PickerChoice.Cash) {
      switchPaymentMedthod(paymentType: cModels.PaymentType.Cash);
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
  double getShippingCostFromBase() {
    mezDbgPrint(
        "Gett shipping cost from base =====>${deliveryCost?.costPerKmFromBase}");
    double result = 0;
    if (cart.restaurant != null && deliveryCost?.costPerKmFromBase != null) {
      final double dist = MapHelper.calculateDistance(
          MapHelper.alitasLoc.toLocationData(),
          cart.restaurant!.info.location.toLocationData());
      mezDbgPrint("distance from base ========>$dist");
      final double cost = dist * deliveryCost!.costPerKmFromBase!;
      result = cost;
    }
    mezDbgPrint("shipping cost from base ==========>$result");
    return result;
  }

  Future<void> checkoutActionButton() async {
    cart.notes = noteText.text.inCaps;
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
      newOrderId = await cartController.checkout(
          stripePaymentId: null, selectedComapnies: selectedCompanies);
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
  //         cModels.PaymentIntentResponse? paymentIntent = await getPaymentIntent(
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
  //         cModels.PaymentIntentResponse? paymentIntent = await getPaymentIntent(
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
    return cart.restaurant?.paymentInfo
                ?.acceptedPayments[cModels.PaymentType.Card] ==
            true ||
        cart.restaurant?.paymentInfo
                ?.acceptedPayments[cModels.PaymentType.BankTransfer] ==
            true;
  }

  bool get showFees {
    return cart.paymentType == cModels.PaymentType.Card &&
        (cart.restaurant?.paymentInfo?.stripe?.chargeFeesOnCustomer ?? true);
  }

  bool get canOrder {
    if (dvType == cModels.DeliveryType.Pickup) {
      return true;
    }
    return cart.toLocation != null && cart.shippingCost != null;
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

  Future<void> updateShippingPrice() async {
    isShippingSet.value = false;

    if (cart.toLocation != null && cart.restaurant != null) {
      final MapHelper.Route? routeInfo = await MapHelper.getDurationAndDistance(
        cart.restaurant!.info.location,
        cart.toLocation!,
      );

      if (routeInfo != null) {
        orderDistanceInKm.value = routeInfo.distance.distanceInMeters / 1000;
        cart.setRouteInformation = MapHelper.RouteInformation(
          polyline: routeInfo.encodedPolyLine,
          distance: routeInfo.distance,
          duration: routeInfo.duration,
        );

        orderDistanceInKm.refresh();
        // if (_orderDistanceInKm <= 10) {
        //   final num shippingCost =
        //       (deliveryCost!.costPerKm * (_orderDistanceInKm)) +
        //           getShippingCostFromBase();
        //   if (shippingCost < deliveryCost!.minimumCost) {
        //     mezDbgPrint(
        //         " shipping cost is less than ${deliveryCost!.minimumCost} : $shippingCost ");
        //     cart.shippingCost = deliveryCost!.minimumCost.ceil();
        //     _cartRxn.refresh();
        //   } else {
        //     mezDbgPrint("Shipping cost ============>$shippingCost");
        //     cart.shippingCost = shippingCost.ceil();
        //     _cartRxn.refresh();
        //   }
        //   cart.setRouteInformation = MapHelper.RouteInformation(
        //     polyline: routeInfo.encodedPolyLine,
        //     distance: routeInfo.distance,
        //     duration: routeInfo.duration,
        //   );

        //   // await saveCart();
        //   isShippingSet.value = true;

        //   return true;
        // } else {
        //   cart.shippingCost = null;
        //   // await saveCart();
        //   isShippingSet.value = false;

        //   return false;
        // }
      } else {
        cart.shippingCost = null;
        // await saveCart();
        isShippingSet.value = false;
      }
    } else {
      cart.shippingCost = null;
      //   await saveCart();
      isShippingSet.value = false;
    }
  }

  void setShippingCost(double value) {
    estDeliveryCost.value = value;
    cart.shippingCost = value;
    //  estDeliveryCost.refresh();
    //  _cartRxn.refresh();
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

  // bool get validTime {
  //   if (cart.deliveryTime != null) {
  //     return cart.deliveryTime!.toLocal().isAfter(DateTime.now().toLocal());
  //   } else {
  //     return cart.restaurant?.isOpen == true;
  //   }
  // }

  void switchLocation(loc.MezLocation location) {
    _cartRxn.value?.toLocation = location;

    updateShippingPrice();
  }

  // void setDeliveryTime(DateTime? dateTime) {
  //   _cartRxn.value?.deliveryTime = dateTime;
  //   _cartRxn.refresh();
  // }

  void switchDeliveryType({required cModels.DeliveryType type}) {
    dvType.value = type;
    _cartRxn.value?.deliveryType = dvType.value;
    if (_cartRxn.value?.deliveryType == cModels.DeliveryType.Pickup) {
      _cartRxn.value?.shippingCost = null;
    }
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
