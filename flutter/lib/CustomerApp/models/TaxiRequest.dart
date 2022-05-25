import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class TaxiRequest {
  Location? from;
  Location? to;
  RouteInformation? routeInformation;
  int estimatedPrice;
  PaymentType paymentType;
  DateTime? scheduledTime;
  TaxiRequest({
    this.from,
    this.to,
    this.routeInformation,
    this.estimatedPrice = 35,
    this.paymentType = PaymentType.Cash,
  });

  bool valid() {
    return (from != null && to != null && routeInformation != null);
  }

  void setEstimatedPrice(int price) {
    estimatedPrice = price;
  }

  void incrementPrice() {
    estimatedPrice += 5;
  }

  void decrementPrice() {
    if (estimatedPrice > 35) {
      estimatedPrice -= 5;
    }
  }

  void setFromLocation(Location? loc) {
    from = loc;
  }

  void setToLocation(Location? loc) {
    to = loc;
  }

  void setScheduledTime(DateTime? scheduledTime) {
    this.scheduledTime = scheduledTime;
  }

  void setRouteInformation(RouteInformation routeInformation) {
    this.routeInformation = routeInformation;
  }

  bool isFromToSet() {
    return from?.address != null &&
        from?.address != "" &&
        to?.address != null &&
        to?.address != "";
  }

  Map<String, dynamic> asCloudFunctionParam() {
    return <String, dynamic>{
      "from": from?.toFirebaseFormattedJson(),
      "to": to?.toFirebaseFormattedJson(),
      "estimatedPrice": estimatedPrice,
      "paymentType": paymentType.toFirebaseFormatString(),
      "routeInformation": routeInformation?.toJson(),
      "scheduledTime": scheduledTime?.toUtc().toString()
    };
  }
}
