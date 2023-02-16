import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModel;
import 'package:mezcalmos/Shared/controllers/ServiceProfileController.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ServicePaymentsViewController {
  // instances //
  WebViewController webViewController = WebViewController();
  ServiceProfileController serviceProfileViewController =
      Get.find<ServiceProfileController>();

  // state variables //
  Map<PaymentType, bool> _cloneAcceptedPayments = <PaymentType, bool>{
    PaymentType.Card: false,
    PaymentType.BankTransfer: false,
    PaymentType.Cash: true,
  };
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
  int get serviceProviderId => serviceProfileViewController.serviceId;
  String? stripeUrl;
// getters //
  int get _detailsId => serviceProfileViewController.detailsId;
  ServiceProviderType get serviceProviderType =>
      serviceProfileViewController.service.serviceProviderType!;

  PaymentInfo? get paymentInfo => _paymentInfo.value;
  bool get cardChecked =>
      _paymentInfo.value?.stripe != null &&
      _paymentInfo.value!.acceptCard &&
      _paymentInfo.value!.stripe!.chargesEnabled;
  // init //
  Future<void> init() async {
    // get payment info //
    await _fetchPayment(withCache: false);
  }

  Future<void> _fetchPayment({bool withCache = true}) async {
    _paymentInfo.value = await get_service_payment_info(
        serviceDetailsId: _detailsId, withCache: withCache);

    _cloneAcceptedPayments = _paymentInfo.value!.acceptedPayments;
    mezDbgPrint(
        "after fetching payments 🤣🤣🤣🤣🤣 =>${_paymentInfo.value.toString()}");
  }

  void checkStripe() {
    if (_paymentInfo.value?.stripe != null &&
        _paymentInfo.value?.acceptedPayments[PaymentType.Card] == true) {
      _updateServiceProvider();
    }
  }

  Future<void> handleCardCheckBoxClick(bool v) async {
    mezDbgPrint("Heeerrererrere =>${_paymentInfo.value}");
    if (cardChecked) {
      final Map<PaymentType, bool> newMap = {
        ...paymentInfo!.acceptedPayments,
        PaymentType.Card: v
      };

      mezDbgPrint("Heeerrererrere =>$newMap");
      try {
        bool res = await update_service_accepted_payments(
            payments: newMap, detailsId: _detailsId);
        if (res) {
          showSavedSnackBar();
          _paymentInfo.value!.acceptedPayments = newMap;
          _paymentInfo.refresh();
        }
      } catch (e, stk) {
        showErrorSnackBar(errorText: e.toString());
        mezDbgPrint(e);
        mezDbgPrint(stk);
      }
    } else {
      await showPaymentSetup();
    }
    mezDbgPrint("PAYMENT CARD ======>${_paymentInfo.value?.acceptedPayments}");
  }

  void handleStripeUrlChanges(String url) {
    if (url == "https://example.com/return") {
      _returnUrlHandler();
    } else if (url == "https://example.com/reauth") {
      _reauthUrlHandler();
    }
  }

  Future<void> _reauthUrlHandler() async {
    await _setupService();
  }

  Future<void> _returnUrlHandler() async {
    showStripe.value = false;
    await _updateServiceProvider();
  }

  Future<void> _updateServiceProvider() async {
    try {
      await updateServiceProvider(serviceProviderId, serviceProviderType,
          paymentInfo!.acceptedPayments);
      await _fetchPayment(withCache: false);

      _checkStripeDetails();
    } on FirebaseFunctionsException catch (e, stk) {
      showErrorSnackBar(errorText: e.message ?? "");
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  void _checkStripeDetails() {
    if (_paymentInfo.value?.stripe != null) {
      setupClicked.value = false;
    }
    if (_paymentInfo.value?.stripe?.chargesEnabled == false) {
      showSetupStripe.value = true;
      showStripeReqs.value = true;
    }
  }

  Future<void> switchChargeFees(bool v) async {
    try {
      // await update_restaurant_payment_info(
      //     id: serviceProviderId,
      //     paymentInfo: paymentInfo!.copyWith(
      //         stripe: paymentInfo!.stripe!.copyWith(chargeFeesOnCustomer: v)));
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

  Future<void> showPaymentSetup() async {
    setupClicked.value = true;

    await _setupService();

    // onboardServiceProvider(
    //     serviceProviderId, serviceProviderType, paymentInfo!.acceptedPayments);

    // if (value.success) {
    //   mezDbgPrint("response ============> $value");
    //   stripeUrl = value.data["url"];
    //   showStripe.value = true;
    //   initWebView();
    // } else {
    //   Get.snackbar("Error", value.errorMessage ?? "Error");
    // }
    // setupClicked.value = false;
  }

  Future<void> _setupService() async {
    try {
      cModel.SetupResponse res =
          await onboardServiceProvider(serviceProviderId, serviceProviderType);
      mezDbgPrint("response ============> $res");
      stripeUrl = res.url;
      showStripe.value = true;
      initWebView();
    } on FirebaseFunctionsException catch (e) {
      showErrorSnackBar(errorText: e.message ?? "Error");
      mezDbgPrint(e);
    }
  }

  void closePaymentSetup() {
    stripeUrl = null;
    showStripe.value = false;
    setupClicked.value = false;
  }

  bool get showSetupBtn {
    return (_paymentInfo.value?.acceptedPayments[PaymentType.Card] == true &&
            _paymentInfo.value?.stripe == null) ||
        (_paymentInfo.value?.acceptedPayments[PaymentType.Card] == true &&
            (_paymentInfo.value?.detailsSubmitted == false ||
                _paymentInfo.value?.chargesEnabled == false));
  }

  bool getChargeFessOnCustomer() {
    return _paymentInfo.value?.stripe?.chargeFeesOnCustomer ?? false;
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

  void removeBank() {
    final Map<Object, dynamic> newMap = {
      ...paymentInfo!.acceptedPayments,
      PaymentType.Card: true
    };
    mezDbgPrint(newMap);
  }
  // TODO @m66are RFC

  void dspose() {}
}
