import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/User.dart';

class CounterOffer {
  num price;
  DateTime offerValidTime;
  CounterOfferStatus counterOfferStatus;
  // this is needed
  UserInfo driverInfo;

  CounterOffer({
    required this.price,
    this.counterOfferStatus = CounterOfferStatus.Submitted,
    required this.offerValidTime,
    required this.driverInfo,
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
        driverInfo: taxiUserInfo,
        offerValidTime:
            DateTime.now().toUtc().add(Duration(seconds: validTimeInSeconds)));
  }

  factory CounterOffer.fromData(dynamic data,
      {required UserInfo taxiUserInfo}) {
    return CounterOffer(
        price: data["price"],
        offerValidTime: DateTime.parse(data["offerValidTime"]),
        counterOfferStatus: data["status"].toString().toCounterOfferStatus(),
        driverInfo: taxiUserInfo);
  }

  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "driverInfo": this.driverInfo.toFirebaseFormatJson(),
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
    var r = DateTime.now().toUtc().difference(offerValidTime.toUtc()).inSeconds;
    mezDbgPrint("validityTimeDifference ===> $r");
    return r;
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

class CounterOfferNotificationForQueue extends NotificationForQueue {
  UserInfo driver;
  String orderId;
  String customerId;
  num price;
  CounterOfferNotificationForQueue(
      {required this.driver,
      required this.orderId,
      required this.customerId,
      required this.price})
      : super(
            notificationType: NotificationType.NewCounterOffer,
            timeStamp: DateTime.now().toUtc());

  Map<String, dynamic> toFirebaseFormatJson() => {
        ...super.toFirebaseFormatJson(),
        "driver": driver.toFirebaseFormatJson(),
        "timestamp": DateTime.now().toUtc().toString(),
        "orderId": orderId,
        "customerId": customerId,
        "price": price,
        "notificationType": notificationType.toFirebaseFormatString()
      };
}
