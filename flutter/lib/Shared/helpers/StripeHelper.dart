import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

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
      this.expMonth,
      this.last4});

  factory StripeOrderPaymentInfo.fromJson(data) {
    return StripeOrderPaymentInfo(
        id: data["id"],
        stripeFees: data["stripeFees"],
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

Future<ServerResponse> getPaymentIntent(
    {required String customerId,
    required String serviceProviderId,
    required OrderType orderType,
    required num paymentAmount,
    CaptureMethod captureMethod = CaptureMethod.Automatic}) async {
  final HttpsCallable getPaymentIntent =
      FirebaseFunctions.instance.httpsCallable("stripe-getPaymentIntent");
  try {
    final HttpsCallableResult<dynamic> response =
        await getPaymentIntent.call(<String, String>{
      "customerId": customerId,
      "serviceProviderId": serviceProviderId,
      "orderType": orderType.toFirebaseFormatString(),
      "paymentAmount": paymentAmount.toString(),
      "captureMethod": captureMethod.toFirebaseFormatString()
    });
    return ServerResponse.fromJson(response.data);
  } catch (e) {
    return ServerResponse(ResponseStatus.Error,
        errorMessage: "Server Error", errorCode: "serverError");
  }
}

Future<ServerResponse> addCard({required String paymentMethod}) async {
  final HttpsCallable addCardFunction =
      FirebaseFunctions.instance.httpsCallable("stripe-addCard");
  try {
    final HttpsCallableResult<dynamic> response = await addCardFunction
        .call(<String, String>{"paymentMethod": paymentMethod});
    return ServerResponse.fromJson(response.data);
  } catch (e) {
    return ServerResponse(ResponseStatus.Error,
        errorMessage: "Server Error", errorCode: "serverError");
  }
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

Future<String> acceptPaymentWithSavedCard(
    {required num paymentAmount,
    required CreditCard card,
    required String serviceProviderId}) async {
  final HttpsCallable addCardFunction =
      FirebaseFunctions.instance.httpsCallable("stripe-chargeCard");
  try {
    final HttpsCallableResult<dynamic> response =
        await addCardFunction.call(<String, dynamic>{
      "serviceProviderId": serviceProviderId,
      "cardId": card.id,
      "orderType": OrderType.Restaurant.toFirebaseFormatString(),
      "paymentAmount": paymentAmount
    });
    ServerResponse serverResponse = ServerResponse.fromJson(response.data);
    if (serverResponse.success) {
      return extractPaymentIdFromIntent(
          serverResponse.data['paymentIntent'].toString());
    } else {
      MezSnackbar(
          "Add Card Error", serverResponse.errorMessage ?? "Unknown Error");
      throw Exception(serverResponse.errorMessage ?? "Unknown Error");
    }
  } catch (e) {
    MezSnackbar("Add Card Error", e.toString());
    throw e;
  }
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
      testEnv: true, existingPaymentMethodRequired: true));
}

Future<void> acceptPaymentWithApplePay(
    {required paymentIntentData,
    required String merchantName,
    required num paymentAmount}) async {
  try {
    Stripe.publishableKey = paymentIntentData['publishableKey'];
    Stripe.merchantIdentifier = merchantName;
    final clientSecret = paymentIntentData['paymentIntent'];
    Stripe.stripeAccountId = paymentIntentData['stripeAccountId'];
    await Stripe.instance.applySettings();
    // 1. Present Apple Pay sheet
    await Stripe.instance.presentApplePay(
      ApplePayPresentParams(
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
    {required paymentIntentData,
    required String merchantName,
    required num paymentAmount}) async {
  try {
    Stripe.publishableKey = paymentIntentData['publishableKey'];
    Stripe.merchantIdentifier = merchantName;
    final clientSecret = paymentIntentData['paymentIntent'];
    Stripe.stripeAccountId = paymentIntentData['stripeAccountId'];
    await Stripe.instance.applySettings();

    await Stripe.instance.initGooglePay(GooglePayInitParams(
        testEnv: true, merchantName: merchantName, countryCode: 'US'));

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

Future<ServerResponse> onboardServiceProvider(
    String serviceProviderId, OrderType orderType) async {
  return serviceProviderFunctions(
      "setupServiceProvider", serviceProviderId, orderType);
}

Future<ServerResponse> updateServiceProvider(
    String serviceProviderId, OrderType orderType) async {
  return serviceProviderFunctions(
      "updateServiceProvider", serviceProviderId, orderType);
}

Future<ServerResponse> serviceProviderFunctions(
    String functionName, String serviceProviderId, OrderType orderType) async {
  final HttpsCallable cloudFunction =
      FirebaseFunctions.instance.httpsCallable('stripe-$functionName');
  try {
    final HttpsCallableResult response = await cloudFunction.call({
      "serviceProviderId": serviceProviderId,
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
      final PaymentMethod paymentMethod = await Stripe.instance
          .createPaymentMethod(const PaymentMethodParams.card(
              paymentMethodData: PaymentMethodData()));

      ServerResponse serverResponse =
          await addCard(paymentMethod: paymentMethod.id);
      if (serverResponse.success) {
        Get.back(result: serverResponse.data['cardId']);
      } else {
        MezSnackbar(
            "Add Card Error", serverResponse.errorMessage ?? "Unknown Error");
      }
    } catch (e) {
      MezSnackbar("Add Card Error", e.toString());
    } finally {
      setState(() {
        _isButtonEnabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
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
          fontSize: 24,
          placeholderColor: Colors.blue,
        ),
      ),
      ElevatedButton(
          child: new Text("Save"),
          onPressed: _isButtonEnabled ? createCard : null)
    ]);
  }
}
