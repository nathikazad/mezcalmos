import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/User.dart';

class CounterOffer {
  num price;
  DateTime offerValidTime;
  CounterOfferStatus counterOfferStatus;
  // this is needed
  UserInfo driverInfos;

  CounterOffer({
    required this.price,
    this.counterOfferStatus = CounterOfferStatus.Submitted,
    required this.offerValidTime,
    required this.driverInfos,
  });

  /// Builds a counter offer with 30 second validity by default
  /// validTime in seconds
  factory CounterOffer.buildWithExpiration({
    required num price,
    required UserInfo taxiUserInfo,
    int validTimeInSeconds = nDefaultCounterOfferValidExpireTimeInSeconds,
  }) {
    return CounterOffer(
        price: price,
        driverInfos: taxiUserInfo,
        offerValidTime:
            DateTime.now().toUtc().add(Duration(seconds: validTimeInSeconds)));
  }

  factory CounterOffer.fromData(dynamic data,
      {required UserInfo taxiUserInfo}) {
    return CounterOffer(
        price: data["price"],
        offerValidTime: DateTime.parse(data["offerValidTime"]),
        counterOfferStatus: data["status"].toString().toCounterOfferStatus(),
        driverInfos: taxiUserInfo);
  }

  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "driverInfos": this.driverInfos.toFirebaseJson(),
      "price": this.price,
      "offerValidTime": this.offerValidTime.toIso8601String(),
      "offerValidTimeEpoch": this.offerValidTime.millisecondsSinceEpoch,
      "status": this.counterOfferStatus.toFirebaseFormatString()
    };
  }

  /// this function calculates the diffrence in seconds between the [offerValidTime] and [DateTime.now()]  (negative number till 0)
  ///
  /// basically if the return == 0 , it means that this Offer is expired.
  int validityTimeDifference() {
    return DateTime.now().toUtc().difference(offerValidTime.toUtc()).inSeconds;
  }
}

// enum CounterOfferStatus { Submitted, Accepted, Rejected, Expired, Cancelled }
enum CounterOfferStatus { Submitted, Accepted, Rejected }

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
