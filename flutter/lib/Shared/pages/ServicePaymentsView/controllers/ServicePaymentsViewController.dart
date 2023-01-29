import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ServicePaymentsViewController {
  // instances //
  WebViewController webViewController = WebViewController();

  // state variables //

  final Rxn<PaymentInfo> _paymentInfo = Rxn();
  final RxBool showStripeReqs = RxBool(false);
  final RxBool showSetupStripe = RxBool(false);
  final RxBool showStripe = RxBool(false);
  final RxBool setupClicked = RxBool(false);
  final RxBool showLinarProgress = RxBool(false);
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
    await _fetchPayment(withCache: true);
  }

  Future<void> _fetchPayment({bool withCache = true}) async {
    _paymentInfo.value = await get_restaurant_payment_info(
        serviceProviderId: serviceProviderId, withCache: withCache);
  }

  void checkStripe() {
    if (_paymentInfo.value?.stripe != null &&
        _paymentInfo.value?.acceptedPayments[PaymentType.Card] == true) {
      updateServiceProvider(serviceProviderId, ServiceProviderType.Restaurant,
              paymentInfo!.acceptedPayments)
          .then((ServerResponse value) {
        _checkStripeDetails();
      });
    }
  }

  Future<void> handleCardCheckBoxClick(bool v) async {
    _paymentInfo.value?.acceptedPayments[PaymentType.Card] = v;
    mezDbgPrint("PAYMENT CARD ======>${paymentInfo?.acceptedPayments}");
    try {
      _paymentInfo.value = await update_restaurant_payment_info(
          id: serviceProviderId, paymentInfo: paymentInfo!);
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  void handleStripeUrlChanges(String url) {
    if (url == "https://example.com/return") {
      _returnUrlHandler();
    } else if (url == "https://example.com/reauth") {
      _reauthUrlHandler();
    }
  }

  void _reauthUrlHandler() {
    onboardServiceProvider(serviceProviderId, ServiceProviderType.Restaurant,
            paymentInfo!.acceptedPayments)
        .then((ServerResponse value) {
      if (value.success) {
        stripeUrl = value.data["url"];
        showStripe.value = true;
      }
    });
  }

  void _returnUrlHandler() {
    showStripe.value = false;
    updateServiceProvider(serviceProviderId, ServiceProviderType.Restaurant,
            paymentInfo!.acceptedPayments)
        .then((ServerResponse value) {
      _checkStripeDetails();
      if (value.success) {
        _fetchPayment(withCache: false);
      }
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
    try {
      await update_restaurant_payment_info(
          id: serviceProviderId,
          paymentInfo: paymentInfo!.copyWith(
              stripe: paymentInfo!.stripe!.copyWith(chargeFeesOnCustomer: v)));
      await _fetchPayment(withCache: false);
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  void initWebView() {
    webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    webViewController.setBackgroundColor(const Color(0x00000000));
    webViewController.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          showLinarProgress.value = true;
        },
        onPageStarted: (String url) {
          showLinarProgress.value = true;
          currentUrl.value = url;
          mezDbgPrint("🌍 Started with url ======>$url");
          handleStripeUrlChanges(url);
        },
        onPageFinished: (String url) {
          showLinarProgress.value = false;
        },
        onWebResourceError: (WebResourceError error) {},
      ),
    );
    webViewController.loadRequest(Uri.parse(stripeUrl!));
  }

  void showPaymentSetup() {
    setupClicked.value = true;
    onboardServiceProvider(serviceProviderId, ServiceProviderType.Restaurant,
            paymentInfo!.acceptedPayments)
        .then((ServerResponse value) {
      if (value.success) {
        stripeUrl = value.data["url"];
        showStripe.value = true;
        initWebView();
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
