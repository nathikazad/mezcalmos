import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/helpers/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class ROpPaymentsPageController {
  ROpEditInfoController editInfoController;
  ROpPaymentsPageController({
    required this.editInfoController,
  });

  Rxn<Restaurant> get restaurant => editInfoController.restaurant;
  final TextEditingController bankName = TextEditingController();
  final TextEditingController bankNumber = TextEditingController();
  String? stripeUrl;
  final RxBool showStripeReqs = RxBool(false);
  final RxBool showSetupStripe = RxBool(false);
  final RxBool showStripe = RxBool(false);
  final RxBool setupClicked = RxBool(false);

  RxString currentUrl = RxString("");
  void checkStripe() {
    if (restaurant.value!.paymentInfo?.stripe != null &&
        restaurant.value!.paymentInfo?.acceptedPayments[PaymentType.Card] ==
            true) {
      updateServiceProvider(
              restaurant.value!.info.hasuraId.toString(), OrderType.Restaurant)
          .then((ServerResponse value) {
        _checkStripeDetails();
      });
    }
  }

  void handleCardCheckBoxClick(bool v) {
    //  restaurantInfoController.setCardPayment(v);
  }

  void handleStripeUrlChanges(String url) {
    if (url == "https://example.com/return") {
      _returnUrlHandler();
    } else if (url == "https://example.com/reauth") {
      _reauthUrlHandler();
    }
  }

  void _reauthUrlHandler() {
    onboardServiceProvider(
            restaurant.value!.info.hasuraId.toString(), OrderType.Restaurant)
        .then((ServerResponse value) {
      if (value.success) {
        stripeUrl = value.data["url"];
        showStripe.value = true;
      }
    });
  }

  void _returnUrlHandler() {
    showStripe.value = false;
    updateServiceProvider(
            restaurant.value!.info.hasuraId.toString(), OrderType.Restaurant)
        .then((ServerResponse value) {
      _checkStripeDetails();
    });
  }

  void _checkStripeDetails() {
    if (restaurant.value!.paymentInfo?.stripe?.detailsSubmitted == false) {
      showSetupStripe.value = true;
    } else if (restaurant.value!.paymentInfo?.stripe?.chargesEnabled == false ||
        restaurant.value!.paymentInfo?.stripe?.payoutsEnabled == false) {
      showStripeReqs.value = true;
    }
  }

  Future<void> switchChargeFees(bool v) async {
    // await restaurantInfoController.switchFeesOption(v);
  }

  void showPaymentSetup() {
    setupClicked.value = true;
    onboardServiceProvider(
            restaurant.value!.info.hasuraId.toString(), OrderType.Restaurant)
        .then((ServerResponse value) {
      if (value.success) {
        stripeUrl = value.data["url"];
        showStripe.value = true;
      } else {
        Get.snackbar("Error", value.errorMessage ?? "Error");
      }
    }).whenComplete(() => setupClicked.value = false);
  }

  void closePaymentSetup() {
    stripeUrl = null;
    showStripe.value = false;
  }

  bool get showSetupBtn {
    return (restaurant.value!.paymentInfo?.acceptedPayments[PaymentType.Card] ==
                true &&
            restaurant.value!.paymentInfo?.stripe == null) ||
        (restaurant.value!.paymentInfo?.acceptedPayments[PaymentType.Card] ==
                true &&
            (restaurant.value!.paymentInfo?.detailsSubmitted == false ||
                restaurant.value!.paymentInfo?.chargesEnabled == false));
  }

  bool getChargeFessOnCustomer() {
    return restaurant.value!.paymentInfo?.stripe?.chargeFeesOnCustomer ?? true;
  }

  bool get showFeesOption {
    return (restaurant.value!.paymentInfo?.acceptedPayments[PaymentType.Card] ==
            true &&
        restaurant.value!.paymentInfo?.stripe != null);
  }

  bool get showStatusIcon {
    return (restaurant.value!.paymentInfo?.stripe?.requirements.isNotEmpty ==
        true);
  }

  bool get getAvailable {
    return restaurant.value!.state.available;
  }

  bool get isBankTrue {
    return restaurant
            .value!.paymentInfo?.acceptedPayments[PaymentType.BankTransfer] ==
        true;
  }

  void init() {}

  pushBankInfos({required String bankName, required num bankNumber}) {}

  removeBank() {}
}
