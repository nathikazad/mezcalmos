import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class TaxiRequest {
  // String? orderId;
  Location? from;
  Location? to;
  RideDistance? distance;
  RideDuration? duration;
  int estimatedPrice;
  PaymentType paymentType;
  String? polyline;

  // No orderId needed in this case, when the user creates
  TaxiRequest(
      {
      // this.orderId,
      this.from,
      this.to,
      this.distance,
      this.duration,
      this.estimatedPrice = 35,
      this.paymentType = PaymentType.Cash,
      this.polyline});

  // User to Get the order from db
  factory TaxiRequest.fromSnapShotData(String orderId, dynamic data) {
    return TaxiRequest(
        // orderId: orderId,
        from: data['from'],
        to: data['to'],
        distance: RideDistance.fromJson(data['distance']),
        duration: RideDuration.fromJson(data['duration']),
        estimatedPrice: data['estimatedPrice'],
        paymentType: data['paymentType'],
        polyline: data['polyline']);
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

  bool isFromToSet() {
    return this.from != null && this.to != null;
  }

  Map<String, dynamic> asCloudFunctionParam() {
    return {
      "from": from?.toFirebaseFormattedJson(),
      "to": to?.toFirebaseFormattedJson(),
      "estimatedPrice": estimatedPrice,
      "paymentType": paymentType.toFirebaseFormatString(),
      "routeInformation": {
        "duration": duration!.daysHoursString,
        "distance": distance!.distanceStringInKm,
        "polyline": polyline
      }
    };
  }
}
