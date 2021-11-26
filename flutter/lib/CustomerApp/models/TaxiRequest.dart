import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';

class TaxiRequest {
  String? orderId;
  Location? from;
  Location? to;
  RideDistance? distance;
  RideDuration? duration;
  int estimatedPrice;
  String? paymentType;
  String? polyline;

  // No orderId needed in this case, when the user creates
  TaxiRequest(
      {this.orderId,
      this.from,
      this.to,
      this.distance,
      this.duration,
      this.estimatedPrice = 35,
      this.paymentType,
      this.polyline});

  // User to Get the order from db
  factory TaxiRequest.fromSnapShotData(String orderId, dynamic data) {
    return TaxiRequest(
        orderId: orderId,
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

  Map<String, dynamic> toFirebaseJson() {
    return {
      "from": this.from?.toFirebaseFormattedJson(),
      "to": this.to?.toFirebaseFormattedJson(),
      "distance": this.distance?.toJson(),
      "duration": this.duration?.toJson(),
      "estimatedPrice": this.estimatedPrice,
      "paymentType": this.paymentType,
      "polyline": this.polyline
    };
  }
}
