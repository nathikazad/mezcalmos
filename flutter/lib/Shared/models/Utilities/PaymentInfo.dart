// import 'package:intl/intl.dart';
// import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
// import 'package:mezcalmos/Shared/helpers/StringHelper.dart';

import 'package:mezcalmos/Shared/models/Utilities/BankInfo.dart';

enum PaymentType { Cash, Card, BankTransfer }

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

  String toNormalString() {
    final String str = toString().split('.').last;
    return str[0].toUpperCase() + str.substring(1);
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
  bool chargeFeesOnCustomer;
  bool chargesEnabled;
  bool payoutsEnabled;
  bool detailsSubmitted;
  String? email;
  List<String> requirements;
  StripeInfo(
      {required this.id,
      required this.status,
      this.chargesEnabled = false,
      this.payoutsEnabled = false,
      this.detailsSubmitted = false,
      this.email,
      this.chargeFeesOnCustomer = true,
      this.requirements = const <String>[]});
}

class PaymentInfo {
  final Map<PaymentType, bool> acceptedPayments;
  StripeInfo? stripe;
  BankInfo? bankInfo;
  PaymentInfo(
      {this.acceptedPayments = const <PaymentType, bool>{
        PaymentType.Card: false,
        PaymentType.Cash: true
      },
      this.stripe,
      this.bankInfo});

  factory PaymentInfo.fromData(data) {
    final Map<PaymentType, bool> acceptedPayments = {
      PaymentType.Card: false,
      PaymentType.BankTransfer: false,
      PaymentType.Cash: true
    };
    PaymentType.values.forEach((PaymentType paymentType) {
      acceptedPayments[paymentType] = data["acceptedPayments"]
              ?[paymentType.toFirebaseFormatString()] ??
          false;
    });
    StripeInfo? stripe;
    if (acceptedPayments[PaymentType.Card] == true && data["stripe"] != null) {
      final List<String> requis = [];
      data["stripe"]?["requirements"]?.forEach((req) {
        requis.add(req.toString());
      });
      stripe = StripeInfo(
          id: data["stripe"]["id"],
          status: data["stripe"]["status"].toString().toStripeStatus(),
          payoutsEnabled: data["stripe"]["payoutsEnabled"] ?? false,
          detailsSubmitted: data["stripe"]["detailsSubmitted"] ?? false,
          chargesEnabled: data["stripe"]["chargesEnabled"] ?? false,
          chargeFeesOnCustomer: data["stripe"]["chargeFeesOnCustomer"] ?? true,
          email: data["stripe"]["email"],
          requirements: requis);
    }
    BankInfo? bankInfo;
    if (acceptedPayments[PaymentType.BankTransfer] == true &&
        data["bankInfo"] != null) {
      bankInfo = BankInfo.fromMap(data["bankInfo"]);
    }
    return PaymentInfo(
        acceptedPayments: acceptedPayments, stripe: stripe, bankInfo: bankInfo);
  }

  bool get acceptCard {
    return acceptedPayments[PaymentType.Card] == true &&
        stripe?.status == StripeStatus.IsWorking;
  }

  bool get detailsSubmitted {
    return stripe?.detailsSubmitted ?? false;
  }

  bool get chargesEnabled {
    return stripe?.chargesEnabled ?? false;
  }

  bool get payoutsEnabled {
    return stripe?.payoutsEnabled ?? false;
  }

  List<String> get getReqs {
    return stripe?.requirements ?? [];
  }

  bool get shouldFixPayouts {
    return stripe?.chargesEnabled == true &&
        stripe?.detailsSubmitted == true &&
        stripe?.payoutsEnabled == false;
  }
}
