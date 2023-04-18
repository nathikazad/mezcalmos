import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModel;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/env.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["Shared"]["helpers"]["StripeHelper"];
//

enum StripePaymentStatus { Authorized, Captured, Cancelled }

extension ParseStripePaymentStatusToString on StripePaymentStatus {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToStripePaymentStatus on String {
  StripePaymentStatus? toStripePaymentStatus() {
    return StripePaymentStatus.values.firstWhereOrNull(
        (StripePaymentStatus e) =>
            e.toFirebaseFormatString().toLowerCase() == this);
  }
}

class StripeOrderPaymentInfo {
  String id;
  num stripeFees;
  CardBrand? brand;
  bool? chargeFeesOnCustomer;
  num? expMonth;
  num? expYear;
  String? last4;
  num amountCharged;
  num amountRefunded;
  StripePaymentStatus status;

  StripeOrderPaymentInfo(
      {required this.id,
      required this.stripeFees,
      required this.status,
      this.amountCharged = 0,
      this.amountRefunded = 0,
      this.brand,
      this.expYear,
      this.chargeFeesOnCustomer,
      this.expMonth,
      this.last4});

  factory StripeOrderPaymentInfo.fromJson(data) {
    return StripeOrderPaymentInfo(
        id: data["id"],
        stripeFees: data["stripeFees"],
        chargeFeesOnCustomer: data["chargeFeesOnCustomer"],
        amountCharged: data["amountCharged"] ?? 0,
        amountRefunded: data["amountRefunded"] ?? 0,
        brand: data["brand"].toString().toCardBrand(),
        expYear: data["expYear"],
        expMonth: data["expMonth"],
        last4: data["last4"],
        status: data["status"].toString().toStripePaymentStatus() ??
            StripePaymentStatus.Captured);
  }
}

num getStripeCost(num totalCost) {
  return ((3 + totalCost * 0.036) * 1.16).ceil();
}

enum CardBrand { Visa, Mastercard, Amex }

extension ParseCardBrandToString on CardBrand {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  String toName() {
    final String str = toString().split('.').last;
    return str[0].toUpperCase() + str.substring(1);
  }
}

extension ParseCardBrandToIcon on CardBrand {
  IconData toIcon() {
    switch (this) {
      case CardBrand.Visa:
        return FontAwesomeIcons.ccVisa;
      case CardBrand.Mastercard:
        return FontAwesomeIcons.ccMastercard;
      case CardBrand.Amex:
        return FontAwesomeIcons.ccAmex;
    }
  }
}

extension ParseStringToCardBrand on String {
  CardBrand? toCardBrand() {
    return CardBrand.values.firstWhereOrNull(
        (CardBrand e) => e.toFirebaseFormatString().toLowerCase() == this);
  }
}

enum CaptureMethod { Automatic, Manual }

extension ParseCaptureMethodToString on CaptureMethod {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

Future<cModel.PaymentIntentResponse?> getPaymentIntent({
  required int serviceProviderDetailsId,
  required num paymentAmount,
}) async {
  try {
    cModel.PaymentIntentResponse res =
        await CloudFunctions.stripe3_getPaymentIntent(
            paymentAmount: paymentAmount,
            serviceProviderDetailsId: serviceProviderDetailsId);
    if (res.success == false) {
      showErrorSnackBar(errorText: res.error.toString());
      mezDbgPrint(res.error);
    }
    return res;
  } on FirebaseFunctionsException catch (e, stk) {
    showErrorSnackBar(errorText: e.message.toString());
    mezDbgPrint(e);
    mezDbgPrint(stk);
  } catch (e, stk) {
    mezDbgPrint(e);
    mezDbgPrint(stk);
  }
  return null;
}

Future<String?> addCard({required String paymentMethod}) async {
  try {
    cModel.AddCardResponse res =
        await CloudFunctions.stripe3_addCard(paymentMethod: paymentMethod);
    if (res.success == false) {
      showErrorSnackBar(errorText: res.error.toString());
      mezDbgPrint(res.error);
    }
    return res.cardId;
  } on FirebaseFunctionsException catch (e, stk) {
    showErrorSnackBar(errorText: e.message ?? "");
    mezDbgPrint(e);
    mezDbgPrint(stk);
  }
  return null;
}

Future<ServerResponse> removeCard({required String cardId}) async {
  final HttpsCallable aremoveCardFunction =
      FirebaseFunctions.instance.httpsCallable("stripe-removeCard");
  try {
    final HttpsCallableResult<dynamic> response =
        await aremoveCardFunction.call(<String, String>{"cardId": cardId});
    return ServerResponse.fromJson(response.data);
  } catch (e) {
    return ServerResponse(ResponseStatus.Error,
        errorMessage: "Server Error", errorCode: "serverError");
  }
}

Future<String?> acceptPaymentWithSavedCard(
    {required num paymentAmount,
    required CreditCard card,
    required int serviceProviderDetailsId}) async {
  mezDbgPrint("Payment with saved Card ============> ${card.toString()}");

  try {
    cModel.ChargeCardResponse res = await CloudFunctions.stripe3_chargeCard(
        serviceProviderDetailsId: serviceProviderDetailsId,
        cardId: card.cardId,
        paymentAmount: paymentAmount);
    if (res.success == false) {
      showErrorSnackBar(errorText: res.error.toString());
      mezDbgPrint(res.error);
    }
    return extractPaymentIdFromIntent(res.paymentIntent.toString());
  } on FirebaseFunctionsException catch (e, stk) {
    showErrorSnackBar(errorText: e.message.toString());
    mezDbgPrint(e);
    mezDbgPrint(stk);
  } catch (e, stk) {
    mezDbgPrint(e);
    mezDbgPrint(stk);
  }
  return null;
}

Future<void> acceptPaymentWithSheet(
    {required paymentIntentData, required String merchantName}) async {
  Stripe.publishableKey = paymentIntentData['publishableKey'];
  Stripe.merchantIdentifier = merchantName;
  Stripe.stripeAccountId = paymentIntentData['stripeAccountId'];
  await Stripe.instance.applySettings();
  //2. initialize the payment sheet
  await Stripe.instance.initPaymentSheet(
    paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentData['paymentIntent'],
        merchantDisplayName: merchantName,
        customerId: paymentIntentData['customer'],
        customerEphemeralKeySecret: paymentIntentData['ephemeralKey'],
        style: ThemeMode.light,
        applePay: PaymentSheetApplePay(merchantCountryCode: "MX"),
        googlePay: PaymentSheetGooglePay(merchantCountryCode: "MX")),
  );
  await Stripe.instance.presentPaymentSheet();
}

Future<bool> isApplePaySupported() {
  return Stripe.instance.checkApplePaySupport();
}

Future<bool> isGooglePaySupported() {
  return Stripe.instance.isGooglePaySupported(IsGooglePaySupportedParams(
      testEnv: MezEnv.appLaunchMode == AppLaunchMode.prod ? false : true,
      existingPaymentMethodRequired: true));
}

Future<void> acceptPaymentWithApplePay(
    {required String publishableKey,
    required String paymentIntent,
    required String stripeAccountId,
    required String merchantName,
    required num paymentAmount}) async {
  try {
    Stripe.publishableKey = publishableKey;
    Stripe.merchantIdentifier = "merchant.mezcalmos";
    final String clientSecret = paymentIntent;
    Stripe.stripeAccountId = stripeAccountId;
    await Stripe.instance.applySettings();
    // 1. Present Apple Pay sheet
    await Stripe.instance.presentApplePay(
      params: ApplePayPresentParams(
        cartItems: [
          ApplePayCartSummaryItem.immediate(
            label: merchantName,
            amount: paymentAmount.toString(),
          ),
        ],
        country: 'MX',
        currency: 'MXN',
      ),
    );
    await Stripe.instance.confirmApplePayPayment(clientSecret);
    MezSnackbar("Apple Pay Success", "Apple Pay payment succesfully completed");
  } catch (e) {
    MezSnackbar("Apple Pay Error", e.toString());
    throw e;
  }
}

Future<void> acceptPaymentWithGooglePay(
    {required String publishableKey,
    required String paymentIntent,
    required String stripeAccountId,
    required String merchantName,
    required num paymentAmount}) async {
  try {
    Stripe.publishableKey = publishableKey;
    Stripe.merchantIdentifier = "BCR2DN4T4C3I3XDF";
    final String clientSecret = paymentIntent;
    Stripe.stripeAccountId = stripeAccountId;
    await Stripe.instance.applySettings();

    await Stripe.instance.initGooglePay(GooglePayInitParams(
        testEnv: MezEnv.appLaunchMode == AppLaunchMode.prod ? false : true,
        merchantName: "Mezcalmos",
        countryCode: 'US'));

    await Stripe.instance.presentGooglePay(
      PresentGooglePayParams(clientSecret: clientSecret),
    );
    MezSnackbar("Google Pay Success", "Payment succesfully completed");
  } catch (e) {
    MezSnackbar("Google Pay Error", e.toString());
    throw e;
  }
}

String extractPaymentIdFromIntent(String a) {
  return a.split('_').sublist(0, 2).join('_');
}

Future<cModel.SetupStripeResponse> onboardServiceProvider(
  int serviceProviderDetailsId,
  ServiceProviderType orderType,
) async {
  mezDbgPrint("Payload ================>>> $serviceProviderDetailsId");
  mezDbgPrint("Payload ================>>> $orderType");
  return await CloudFunctions.stripe3_setupServiceProvider(
    serviceProviderDetailsId: serviceProviderDetailsId,
  );
}

Future<void> updateServiceProvider(
    int serviceProviderDetailsId,
    ServiceProviderType orderType,
    Map<cModel.PaymentType, bool> acceptedPayments) async {
  mezDbgPrint("Payload ================>>> $serviceProviderDetailsId");
  mezDbgPrint("Payload ================>>> $orderType");
  cModel.UpdateStripeResponse res =
      await CloudFunctions.stripe3_updateServiceProvider(
    serviceProviderDetailsId: serviceProviderDetailsId,
  );
  if (res.success == false) {
    showErrorSnackBar(errorText: res.error.toString());
    mezDbgPrint(res.error);
  }
  // return serviceProviderFunctions(
  //     "updateServiceProvider", serviceProviderId, orderType, acceptedPayments);
}

Future<ServerResponse> serviceProviderFunctions(
    String functionName,
    int serviceProviderId,
    ServiceProviderType orderType,
    Map<cModel.PaymentType, bool> acceptedPayments) async {
  final HttpsCallable cloudFunction =
      FirebaseFunctions.instance.httpsCallable('stripe-$functionName');
  try {
    final HttpsCallableResult response = await cloudFunction.call({
      "serviceProviderId": "$serviceProviderId",
      "orderType": orderType.toFirebaseFormatString(),
      "redirectUrl": "https://example.com/redirect"
    });
    mezDbgPrint("Response : ${response.data}");
    return ServerResponse.fromJson(response.data);
  } catch (e) {
    mezDbgPrint("Errrooooooooor =======> $e");
    return ServerResponse(ResponseStatus.Error,
        errorMessage: "Server Error", errorCode: "serverError");
  }
}

Future<dynamic> addCardSheet(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )),
      builder: (BuildContext ctx) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          '${_i18n()["addCard"]}',
                          style:
                              ctx.txt.displaySmall?.copyWith(fontSize: 17.sp),
                        ),
                      ),
                      Get.find<LanguageController>().userLanguageKey ==
                              LanguageType.EN
                          ? Row(
                              children: [
                                Text(
                                  '${_i18n()["powered"]}',
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Image.asset(
                                  "assets/images/shared/stripeLogo.png",
                                  width: 50,
                                  height: 20,
                                  fit: BoxFit.contain,
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${_i18n()["powered"]}',
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Image.asset(
                                  "assets/images/shared/stripeLogo.png",
                                  width: 50,
                                  height: 20,
                                  fit: BoxFit.contain,
                                ),
                              ],
                            ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CardForm(),
                ],
              )),
        );
      });
}

class CardForm extends StatefulWidget {
  const CardForm({
    Key? key,
  }) : super(key: key);

  @override
  State<CardForm> createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  bool _isButtonEnabled = false;
  Future<void> createCard() async {
    try {
      setState(() {
        //TODO: should be in loading state
        _isButtonEnabled = false;
      });
      Stripe.stripeAccountId = null;
      await Stripe.instance.applySettings();
      final PaymentMethod paymentMethod = await Stripe.instance
          .createPaymentMethod(
              params: PaymentMethodParams.card(
                  paymentMethodData: PaymentMethodData()));
      mezDbgPrint("payment method from stripe =========>$paymentMethod");
      String? res = await addCard(paymentMethod: paymentMethod.id);
      mezDbgPrint("Response ====> $res");
      if (res != null) {
        await MezRouter.back(backResult: res);
      }
    } on StripeException catch (e) {
      mezDbgPrint("Error add stripe ======>>>>$e");
      MezSnackbar("Error", e.toString());
    } catch (e) {
      MezSnackbar("Error", "Error");
    } finally {
      setState(() {
        _isButtonEnabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          CardFormField(
            enablePostalCode: true,
            onCardChanged: (CardFieldInputDetails? card) {
              setState(() {
                _isButtonEnabled = card?.complete ?? false;
              });
            },
            countryCode: 'MX',
            style: CardFormStyle(
              borderColor: Colors.blueGrey,
              textColor: Colors.black,
              cursorColor: primaryBlueColor,
              fontSize: 18,
              placeholderColor: Colors.grey.shade800,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          MezButton(
            label: '${_i18n()["save"]}',
            enabled: _isButtonEnabled,
            onClick: _isButtonEnabled
                ? () async {
                    await createCard();
                  }
                : null,
          ), // TextButton(
          //     child: Container(
          //         margin: const EdgeInsets.symmetric(vertical: 5),
          //         alignment: Alignment.center,
          //         child: Text("Save")),
          //     onPressed: _isButtonEnabled ? createCard : null),
        ]);
  }
}
