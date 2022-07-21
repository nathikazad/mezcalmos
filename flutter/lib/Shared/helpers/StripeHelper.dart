import 'package:cloud_functions/cloud_functions.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/material.dart';

Future<ServerResponse> getPaymentIntent(
    {required String customerId,
    required String serviceProviderId,
    required OrderType orderType,
    required num paymentAmount}) async {
  final HttpsCallable getPaymentIntent =
      FirebaseFunctions.instance.httpsCallable("stripe-getPaymentIntent");
  try {
    final HttpsCallableResult<dynamic> response =
        await getPaymentIntent.call(<String, String>{
      "customerId": customerId,
      "serviceProviderId": serviceProviderId,
      "orderType": orderType.toFirebaseFormatString(),
      "paymentAmount": paymentAmount.toString()
    });
    return ServerResponse.fromJson(response.data);
  } catch (e) {
    return ServerResponse(ResponseStatus.Error,
        errorMessage: "Server Error", errorCode: "serverError");
  }
}

Future<void> acceptPayment(
    {required dynamic paymentIntentData, required String merchantName}) async {
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
