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

// extension ParseWeekdayToString on Weekday {
//   String toFirebaseFormatString() {
//     final String str = toString().split('.').last;
//     return str[0].toLowerCase() + str.substring(1);
//   }
// }

// extension ParseStringToDaysOfWeek on String {
//   Weekday toWeekDay() {
//     return Weekday.values.firstWhere(
//         (Weekday e) => e.toFirebaseFormatString().toLowerCase() == this);
//   }
// }

class PaymentInfo {
  final Map<PaymentType, bool> acceptedPayments;
  String? stripeId;
  PaymentInfo(
      {this.acceptedPayments = const <PaymentType, bool>{
        PaymentType.Card: false,
        PaymentType.Cash: true
      },
      this.stripeId});

  factory PaymentInfo.fromData(dynamic data) {
    Map<PaymentType, bool> acceptedPayments = {
      PaymentType.Card: false,
      PaymentType.Cash: true
    };
    PaymentType.values.forEach((PaymentType paymentType) {
      acceptedPayments[paymentType] = data["acceptedPayments"]
              ?[paymentType.toFirebaseFormatString()] ??
          false;
    });
    String? stripeId;
    if (acceptedPayments[PaymentType.Card] ?? false)
      stripeId = data["stripeId"];
    return PaymentInfo(acceptedPayments: acceptedPayments, stripeId: stripeId);
  }
}
