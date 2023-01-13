import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class ServicePaymentsViewController {
  // instances //

  // state variables //

  final Rxn<PaymentInfo> _paymentInfo = Rxn();
  final RxBool showStripeReqs = RxBool(false);
  final RxBool showSetupStripe = RxBool(false);
  final RxBool showStripe = RxBool(false);
  final RxBool setupClicked = RxBool(false);
  RxString currentUrl = RxString("");
  // text inputs //
  final TextEditingController bankName = TextEditingController();
  final TextEditingController bankNumber = TextEditingController();
  // vars //
  late int serviceProviderId;
  String? stripeUrl;
// getters //

  PaymentInfo? get paymentInfo => _paymentInfo.value;
  // init //
  Future<void> init({required int serviceProviderId}) async {
    this.serviceProviderId = serviceProviderId;
    // get payment info //
  }

  void checkStripe() {
    if (_paymentInfo.value?.stripe != null &&
        _paymentInfo.value?.acceptedPayments[PaymentType.Card] == true) {
      updateServiceProvider(serviceProviderId, ServiceProviderType.Restaurant)
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
    onboardServiceProvider(serviceProviderId, ServiceProviderType.Restaurant)
        .then((ServerResponse value) {
      if (value.success) {
        stripeUrl = value.data["url"];
        showStripe.value = true;
      }
    });
  }

  void _returnUrlHandler() {
    showStripe.value = false;
    updateServiceProvider(serviceProviderId, ServiceProviderType.Restaurant)
        .then((ServerResponse value) {
      _checkStripeDetails();
    });
  }

  void _checkStripeDetails() {
    if (_paymentInfo.value?.stripe?.detailsSubmitted == false) {
      showSetupStripe.value = true;
    } else if (_paymentInfo.value?.stripe?.chargesEnabled == false ||
        _paymentInfo.value?.stripe?.payoutsEnabled == false) {
      showStripeReqs.value = true;
    }
  }

  Future<void> switchChargeFees(bool v) async {
    // await restaurantInfoController.switchFeesOption(v);
  }

  void showPaymentSetup() {
    setupClicked.value = true;
    onboardServiceProvider(serviceProviderId, ServiceProviderType.Restaurant)
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
    return (_paymentInfo.value?.acceptedPayments[PaymentType.Card] == true &&
            _paymentInfo.value?.stripe == null) ||
        (_paymentInfo.value?.acceptedPayments[PaymentType.Card] == true &&
            (_paymentInfo.value?.detailsSubmitted == false ||
                _paymentInfo.value?.chargesEnabled == false));
  }

  bool getChargeFessOnCustomer() {
    return _paymentInfo.value?.stripe?.chargeFeesOnCustomer ?? true;
  }

  bool get showFeesOption {
    return (_paymentInfo.value?.acceptedPayments[PaymentType.Card] == true &&
        _paymentInfo.value?.stripe != null);
  }

  bool get showStatusIcon {
    return (_paymentInfo.value?.stripe?.requirements.isNotEmpty == true);
  }

  bool get isBankTrue {
    return _paymentInfo.value?.acceptedPayments[PaymentType.BankTransfer] ==
        true;
  }

  pushBankInfos({required String bankName, required num bankNumber}) {}

  removeBank() {}

  void dspose() {}
}
