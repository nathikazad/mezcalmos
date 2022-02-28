import 'package:mezcalmos/TaxiApp/models/TaxiDriver.dart';

class CounterOffer {
  num price;
  DateTime offerValidTime;
  CounterOfferStatus counterOfferStatus;
  String? driverId;

  CounterOffer({
    required this.price,
    this.counterOfferStatus = CounterOfferStatus.Submitted,
    required this.offerValidTime,
    this.driverId,
  });

  /// Builds a counter offer with 30 second validity by default
  /// validTime in seconds
  factory CounterOffer.buildWithExpiration({
    required num price,
    int validTimeInSeconds = 30,
  }) {
    return CounterOffer(
        price: price,
        offerValidTime:
            DateTime.now().toUtc().add(Duration(seconds: validTimeInSeconds)));
  }

  factory CounterOffer.fromData(dynamic data, [String? driverId]) {
    return CounterOffer(
        price: data["price"],
        offerValidTime: DateTime.parse(data["offerValidTime"]),
        counterOfferStatus: data["status"].toString().toCounterOfferStatus(),
        driverId: driverId);
  }

  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "price": this.price,
      "offerValidTime": this.offerValidTime.toIso8601String(),
      "offerValidTimeEpoch": this.offerValidTime.millisecondsSinceEpoch,
      "status": this.counterOfferStatus.toFirebaseFormatString()
    };
  }
}

enum CounterOfferStatus { Submitted, Accepted, Rejected, Expired, Cancelled }

extension ParseCounterOfferStatusToString on CounterOfferStatus {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToCounterOfferStatus on String {
  CounterOfferStatus toCounterOfferStatus() {
    return CounterOfferStatus.values
        .firstWhere((e) => e.toFirebaseFormatString() == this);
  }
}
