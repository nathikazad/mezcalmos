import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

enum StripePaymentStatus { Authorized, Captured, Cancelled }

extension ParseStripePaymentStatusToString on StripePaymentStatus {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToStripePaymentStatus on String {
  StripePaymentStatus toStripePaymentStatus() {
    return StripePaymentStatus.values.firstWhere((StripePaymentStatus e) =>
        e.toFirebaseFormatString().toLowerCase() == this);
  }
}

class StripePaymentInfo {
  String id;
  num stripeFees;
  String? brand;
  num? expMonth;
  num? expYear;
  String? last4;
  num amountCharged;
  num amountRefunded;
  StripePaymentStatus status;

  StripePaymentInfo(
      {required this.id,
      required this.stripeFees,
      required this.status,
      this.amountCharged = 0,
      this.amountRefunded = 0,
      this.brand,
      this.expYear,
      this.expMonth,
      this.last4});

  factory StripePaymentInfo.fromJson(data) {
    return StripePaymentInfo(
        id: data["id"],
        stripeFees: data["stripeFees"],
        amountCharged: data["amountCharged"],
        amountRefunded: data["amountRefunded"],
        brand: data["brand"],
        expYear: data["expYear"],
        expMonth: data["expMonth"],
        last4: data["last4"],
        status: data["status"].toString().toStripePaymentStatus());
  }
}

num getStripeCost(num totalCost) {
  return ((3 + totalCost * 0.036) * 1.16).ceil();
}

enum CaptureMethod { Automatic, Manual }

extension ParseCaptureMethodToString on CaptureMethod {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  String toNormalString() {
    final String str = toString().split('.').last;
    return str;
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

Future<void> acceptPayment(
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
