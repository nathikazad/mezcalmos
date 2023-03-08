// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:intl/intl.dart';
// import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
// import 'package:mezcalmos/Shared/helpers/StringHelper.dart';

import 'package:mezcalmos/Shared/cloudFunctions/model.dart'
    as cloudFunctionModels;
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

  cloudFunctionModels.PaymentType toFirebaseFormatEnum() {
    switch (this) {
      case PaymentType.Cash:
        return cloudFunctionModels.PaymentType.Cash;
      case PaymentType.Card:
        return cloudFunctionModels.PaymentType.Card;
      default:
        return cloudFunctionModels.PaymentType.Card;
    }
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
  int id;
  String stripeId;
  bool chargeFeesOnCustomer;
  bool chargesEnabled;
  bool payoutsEnabled;
  bool detailsSubmitted;
  String? email;
  List<String> requirements;
  StripeInfo(
      {required this.stripeId,
      required this.id,
      required this.status,
      this.chargesEnabled = false,
      this.payoutsEnabled = false,
      this.detailsSubmitted = false,
      this.email,
      this.chargeFeesOnCustomer = true,
      this.requirements = const <String>[]});

  StripeInfo copyWith({
    StripeStatus? status,
    String? id,
    bool? chargeFeesOnCustomer,
    bool? chargesEnabled,
    bool? payoutsEnabled,
    bool? detailsSubmitted,
    String? email,
    List<String>? requirements,
  }) {
    return StripeInfo(
      id: this.id,
      stripeId: id ?? stripeId,
      status: status ?? this.status,
      chargeFeesOnCustomer: chargeFeesOnCustomer ?? this.chargeFeesOnCustomer,
      chargesEnabled: chargesEnabled ?? this.chargesEnabled,
      payoutsEnabled: payoutsEnabled ?? this.payoutsEnabled,
      detailsSubmitted: payoutsEnabled ?? this.detailsSubmitted,
      email: email ?? this.email,
      requirements: requirements ?? this.requirements,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status.toFirebaseFormatString(),
      'id': stripeId,
      'chargeFeesOnCustomer': chargeFeesOnCustomer,
      'chargesEnabled': chargesEnabled,
      'payoutsEnabled': payoutsEnabled,
      'detailsSubmitted': detailsSubmitted,
      'email': email,
      'requirements': requirements,
    };
  }
}

class PaymentInfo {
  Map<PaymentType, bool> acceptedPayments;
  StripeInfo? stripe;
  BankInfo? bankInfo;

  PaymentInfo(
      {this.acceptedPayments = const <PaymentType, bool>{
        PaymentType.Card: false,
        PaymentType.Cash: true
      },
      this.stripe,
      this.bankInfo});

  factory PaymentInfo.fromData(
      {required stripeInfo, required acceptedPayments}) {
    final Map<PaymentType, bool> _acceptedPayments = {
      PaymentType.Card: false,
      PaymentType.BankTransfer: false,
      PaymentType.Cash: true
    };

    acceptedPayments?.forEach((String key, data) {
      _acceptedPayments[key.toPaymentType()] = data;
    });
    StripeInfo? stripe;
    if (_acceptedPayments[PaymentType.Card] == true && stripeInfo != null) {
      final List<String> requis = [];
      stripeInfo.requirements?.forEach((req) {
        requis.add(req.toString());
      });
      stripe = StripeInfo(
          id: stripeInfo.id,
          stripeId: stripeInfo.stripe_id,
          status: stripeInfo.status.toString().toStripeStatus(),
          payoutsEnabled: stripeInfo.payouts_enabled ?? false,
          detailsSubmitted: stripeInfo.details_submitted ?? false,
          chargesEnabled: stripeInfo.charges_enabled ?? false,
          chargeFeesOnCustomer: stripeInfo.charge_fees_on_customer ?? true,
          email: stripeInfo.email,
          requirements: requis);
    }

    return PaymentInfo(
      acceptedPayments: _acceptedPayments,
      stripe: stripe,
    );
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

  Map<String, bool> getAcceptedPaymentsJson() {
    final Map<String, bool> data = {};
    acceptedPayments.forEach((PaymentType key, bool value) {
      data[key.toFirebaseFormatString()] = value;
    });
    return data;
  }

// helpers //
  Map<PaymentType, bool> parseAcceptedPayments(data) {
    final Map<PaymentType, bool> result = {};
    data.forEach((String key, data) {
      result[key.toPaymentType()] = data;
    });
    return result;
  }

  StripeInfo? parseServiceStripeInfo(data) {
    StripeInfo? stripe;

    if (data != null) {
      final List<String> requis = [];
      data.requirements?.forEach((req) {
        requis.add(req.toString());
      });
      stripe = StripeInfo(
          id: data.id,
          stripeId: data.stripe_id,
          status: data.status.toString().toStripeStatus(),
          payoutsEnabled: data.payoutsEnabled ?? false,
          detailsSubmitted: data.detailsSubmitted ?? false,
          chargesEnabled: data.chargesEnabled ?? false,
          chargeFeesOnCustomer: data.chargeFeesOnCustomer ?? true,
          email: data.email,
          requirements: requis);
      return stripe;
    }
    return null;
  }

  PaymentInfo copyWith({
    Map<PaymentType, bool>? acceptedPayments,
    StripeInfo? stripe,
    BankInfo? bankInfo,
  }) {
    return PaymentInfo(
      acceptedPayments: acceptedPayments ?? this.acceptedPayments,
      stripe: stripe ?? this.stripe,
      bankInfo: bankInfo ?? this.bankInfo,
    );
  }
}
