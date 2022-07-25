// import 'package:intl/intl.dart';
// import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
// import 'package:mezcalmos/Shared/helpers/StringHelper.dart';

enum PaymentType { Cash, Card }

extension ParsePaymentTypeToString on PaymentType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  String toNormalString() {
    final String str = toString().split('.').last;
    return str;
  }
}

extension ParseStringToPaymentType on String {
  PaymentType toPaymentType() {
    return PaymentType.values.firstWhere((PaymentType e) =>
        e.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

enum StripeStatus { InProcess, IsWorking, Inactive }

extension ParseStripeStatusoString on StripeStatus {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToStripeStatus on String {
  StripeStatus toStripeStatus() {
    return StripeStatus.values.firstWhere((StripeStatus e) =>
        e.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

class StripeInfo {
  StripeStatus status;
  String id;
  StripeInfo({required this.id, required this.status});
}

class PaymentInfo {
  final Map<PaymentType, bool> acceptedPayments;
  StripeInfo? stripe;
  PaymentInfo(
      {this.acceptedPayments = const <PaymentType, bool>{
        PaymentType.Card: false,
        PaymentType.Cash: true
      },
      this.stripe});

  factory PaymentInfo.fromData(data) {
    final Map<PaymentType, bool> acceptedPayments = {
      PaymentType.Card: false,
      PaymentType.Cash: true
    };
    PaymentType.values.forEach((PaymentType paymentType) {
      acceptedPayments[paymentType] = data["acceptedPayments"]
              ?[paymentType.toFirebaseFormatString()] ??
          false;
    });
    StripeInfo? stripe;
    if (acceptedPayments[PaymentType.Card] ?? false)
      stripe = StripeInfo(
          id: data["stripe"]["id"],
          status: data["stripe"]["status"].toString().toStripeStatus());
    return PaymentInfo(acceptedPayments: acceptedPayments, stripe: stripe);
  }

  bool get acceptCard {
    return acceptedPayments[PaymentType.Card] == true &&
        stripe?.status == StripeStatus.IsWorking;
  }
}
