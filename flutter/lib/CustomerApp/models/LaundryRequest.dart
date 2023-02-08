// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

class LaundryRequest {
  int laundryId;
  String? notes;
  num deliveryCost;

  /// to means Customer's location.
  MezLocation? to;

  /// from means laundry's location (choosen by the customer)
  MezLocation? from;
  num? shippingCost;
  RouteInformation? routeInformation;
  PaymentType paymentType;
  LaundryRequest({
    this.routeInformation,
    required this.laundryId,
    required this.deliveryCost,
    this.notes,
    this.from,
    this.shippingCost,
    this.to,
    this.paymentType = PaymentType.Cash,
  });

  bool valid() {
    return (to != null);
  }

  void setToLocation(MezLocation? loc) {
    to = loc;
  }

  bool isFromToSet() {
    return from != null && to != null;
  }

  Map<String, dynamic> asCloudFunctionParam() {
    return {
      "laundryId": laundryId,
      "delivery cost": deliveryCost,
      "to": to?.toFirebaseFormattedJson(),
      "from": from?.toFirebaseFormattedJson(),
      "notes": notes,
      "shippingCost": shippingCost,
      "paymentType": paymentType.toFirebaseFormatString(),
      "routeInformation": routeInformation?.toJson()
    };
  }

  @override
  String toString() {
    return 'LaundryRequest(laundryId: $laundryId, notes: $notes, deliveryCost: $deliveryCost, to: $to, from: $from, shippingCost: $shippingCost, routeInformation: $routeInformation, paymentType: $paymentType)';
  }
}
