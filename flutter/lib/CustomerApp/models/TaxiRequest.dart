import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class TaxiRequest {
  MezLocation? from;
  MezLocation? to;
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

  void setFromLocation(MezLocation? loc) {
    from = loc;
  }

  void setToLocation(MezLocation? loc) {
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
