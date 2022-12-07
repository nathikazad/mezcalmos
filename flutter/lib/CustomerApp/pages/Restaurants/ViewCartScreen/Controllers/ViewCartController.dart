import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/ViewCartScreen.dart';
import 'package:mezcalmos/Shared/helpers/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

// types //
enum PickerChoice {
  SavedCard,
  GooglePay,
  ApplePay,
  Cash,
  NewCard,
  BankTransfer
}

typedef PaymentOption = Map<PickerChoice, CreditCard?>;

// controller class //
class ViewCartController {
  // instances //
  RestaurantController controller = Get.find<RestaurantController>();
  // streams //
  StreamSubscription? cardsListener;
  // Obs variables //
  RxList<CreditCard> customerCards = RxList([]);
  RxList<PaymentOption> options = RxList<PaymentOption>();
  // dropdown value
  Rxn<PaymentOption> pickerChoice = Rxn<PaymentOption>();
  PaymentOption cash = {PickerChoice.Cash: null};
  // Payment Card //
  Rxn<CreditCard> card = Rxn();

  // init //
  Future<void> init() async {
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

  CardChoice get getCardChoice {
    return pickerChoice.value!.entries.first.key.toCardChoice();
  }
}

// helpers //
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
