import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

// controller class //
class ViewCartController {
  // instances //
  RestaurantController controller = Get.find<RestaurantController>();
  CustomerAuthController customerAuthController =
      Get.find<CustomerAuthController>();
  // streams //
  //StreamSubscription? cardsListener;

  // Obs variables //
  RxList<CreditCard> customerCards = RxList([]);
  RxList<PaymentOption> options = RxList<PaymentOption>();
  Rxn<Location> orderToLocation = Rxn();

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

  Cart get cart => controller.cart.value;
  // init //
  Future<void> init() async {
    if (customerAuthController.customer?.savedCards.isNotEmpty == true)
      savedCardChoice = customerAuthController.customer?.savedCards.first;
    orderToLocation.value =
        customerAuthController.customer?.defaultLocation?.location;
    if (orderToLocation.value != null) {
      controller.cart.value.toLocation = orderToLocation.value;
    }
    await controller.fetchCart();

    if (controller.cart.value.cartPeriod != null) {
      controller.cart.value.deliveryTime =
          controller.cart.value.cartPeriod?.start;
    }
    //
    _addAndListenToCustomerCards();
    await _addingValusToOptions();
    pickerChoice.value = options.first;
  }

  Future<void> _addingValusToOptions() async {
    options.add({PickerChoice.Cash: null});
    if (controller.cart.value.restaurant
            ?.acceptPayment(PaymentType.BankTransfer) ==
        true) {
      options.add({PickerChoice.BankTransfer: null});
    }
    if (await isApplePaySupported()) {
      options.add({PickerChoice.ApplePay: null});
    }
    if (await isGooglePaySupported()) {
      options.add({PickerChoice.GooglePay: null});
    }
    customerCards.forEach((CreditCard element) {
      options.add({PickerChoice.SavedCard: element});
    });
    options.add({PickerChoice.NewCard: null});
  }

  void _addAndListenToCustomerCards() {
    // TODO: hasura-ch
    // customerCards.value =
    //     Get.find<CustomerAuthController>().customer.value!.savedCards;
    // cardsListener = Get.find<CustomerAuthController>()
    //     .customer
    //     .stream
    //     .listen((Customer? event) {
    //   if (event != null) {
    //     customerCards.clear();
    //     customerCards.value.addAll(event.savedCards);
    //     if (customerCards.isEmpty) {
    //       options.removeWhere((PaymentOption element) =>
    //           element.entries.first.key == PickerChoice.SavedCard);
    //     }
    //     if (pickerChoice.value?.entries.first.key == PickerChoice.SavedCard &&
    //         customerCards.isEmpty) {
    //       pickerChoice.value = options.first;
    //     }
    //   }
    // });
  }

  void _updateListWithNewCard() {
    options.removeWhere((PaymentOption element) =>
        element.entries.first.key == PickerChoice.SavedCard);

    customerCards.forEach((CreditCard element) {
      options.add({PickerChoice.SavedCard: element});
    });

    options.refresh();
  }

  bool get shoudSchedule {
    return (controller.cart.value.restaurant?.isOpen() == false ||
        controller.cart.value.isSpecial);
  }

  Future<void> _getCustomerCards() async {
    //await Get.find<CustomerAuthController>().getCards();
  }

  // methods
  Future<void> switchPicker(PaymentOption value) async {
    if (value.keys.first == PickerChoice.Cash) {
      controller.switchPaymentMedthod(paymentType: PaymentType.Cash);
    } else if (value.keys.first == PickerChoice.BankTransfer) {
      controller.switchPaymentMedthod(paymentType: PaymentType.BankTransfer);
    } else {
      controller.switchPaymentMedthod(paymentType: PaymentType.Card);
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
          await Future.delayed(Duration(milliseconds: 2), () {});
          _updateListWithNewCard();

          final CreditCard? newCard = customerCards
              .firstWhere((CreditCard element) => element.id == newCardId);

          if (newCard != null) {
            card.value = newCard;
            // options
            //     .insert(options.length - 1, {PickerChoice.SavedCard: newCard});
            pickerChoice.value = options.firstWhere((PaymentOption element) =>
                element.entries.first.value?.id == newCard.id);
          }
        } else {
          controller.switchPaymentMedthod(paymentType: PaymentType.Cash);
          pickerChoice.value = options.first;

          pickerChoice.refresh();
        }

        break;

      default:
        pickerChoice.value = newValue;
    }
  }

  Future<void> checkoutActionButton() async {
    controller.cart.value.notes = noteText.text;
    try {
 
      final String? stripePaymentId =
          await acceptPaymentByCardChoice(getCardChoice);

      final ServerResponse _serverResponse =
          await controller.checkout(stripePaymentId: stripePaymentId);

      mezDbgPrint("datatatatataat => ${_serverResponse.data}");

      if (_serverResponse.success) {
        await controller.clearCart();

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
    if (controller.cart.value.paymentType == PaymentType.Card) {
      switch (choice) {
        case CardChoice.ApplePay:
          final ServerResponse paymentIntentResponse = await getPaymentIntent(
              customerId: Get.find<AuthController>().user!.hasuraId.toString(),
              serviceProviderId: controller.cart.value.restaurant!.info.hasuraId
                  .toString()
                  .toString(),
              orderType: OrderType.Restaurant,
              paymentAmount: controller.cart.value.totalCost);
          stripePaymentId = extractPaymentIdFromIntent(
              paymentIntentResponse.data['paymentIntent'].toString());
          await acceptPaymentWithApplePay(
              paymentAmount: controller.cart.value.totalCost,
              paymentIntentData: paymentIntentResponse.data,
              merchantName: controller.cart.value.restaurant!.info.name);
          break;
        case CardChoice.GooglePay:
         

          final ServerResponse paymentIntentResponse = await getPaymentIntent(
              customerId: Get.find<AuthController>().user!.hasuraId.toString(),
              serviceProviderId: controller.cart.value.restaurant!.info.hasuraId
                  .toString()
                  .toString(),
              orderType: OrderType.Restaurant,
              paymentAmount: controller.cart.value.totalCost);
          stripePaymentId = extractPaymentIdFromIntent(
              paymentIntentResponse.data['paymentIntent'].toString());
          await acceptPaymentWithGooglePay(
              paymentAmount: controller.cart.value.totalCost,
              paymentIntentData: paymentIntentResponse.data,
              merchantName: controller.cart.value.restaurant!.info.name);
          break;
        case CardChoice.SavedCard:
          stripePaymentId = await acceptPaymentWithSavedCard(
              serviceProviderId: controller.cart.value.restaurant!.info.hasuraId
                  .toString()
                  .toString(),
              paymentAmount: controller.cart.value.totalCost,
              card: card.value!);
          break;
      }
    }
    return stripePaymentId;
  }

  void dispose() {
    noteText.dispose();
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
