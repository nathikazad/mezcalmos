import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';

class TaxiRequest {
  Location? from;
  Location? to;
  RouteInformation? routeInformation;
  int estimatedPrice;
  PaymentType paymentType;
  TaxiRequest({
    this.from,
    this.to,
    this.routeInformation,
    this.estimatedPrice = 35,
    this.paymentType = PaymentType.Cash,
  });

  bool valid() {
    return (this.from != null &&
        this.to != null &&
        this.routeInformation != null);
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
    this.from = loc;
  }

  void setToLocation(Location? loc) {
    this.to = loc;
  }

  void setRouteInformation(RouteInformation routeInformation) {
    this.routeInformation = routeInformation;
  }

  bool isFromToSet() {
    return this.from?.address != null &&
        this.from?.address != "" &&
        this.to?.address != null &&
        this.to?.address != "";
  }

  Map<String, dynamic> asCloudFunctionParam() {
    return {
      "from": from?.toFirebaseFormattedJson(),
      "to": to?.toFirebaseFormattedJson(),
      "estimatedPrice": estimatedPrice,
      "paymentType": paymentType.toFirebaseFormatString(),
      "routeInformation": routeInformation?.toJson()
    };
  }
}
