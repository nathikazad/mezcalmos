import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

class LaundryRequest {
  String laundryId;
  String? notes;

  /// to means Customer's location.
  Location? to;

  /// from means laundry's location (choosen by the customer)
  Location? from;
  num? shippingCost;
  RouteInformation? routeInformation;
  PaymentType paymentType;
  LaundryRequest({
    this.routeInformation,
    required this.laundryId,
    this.notes,
    this.from,
    this.shippingCost,
    this.to,
    this.paymentType = PaymentType.Cash,
  });

  bool valid() {
    return (to != null);
  }

  void setToLocation(Location? loc) {
    to = loc;
  }

  bool isFromToSet() {
    return from != null && to != null;
  }

  Map<String, dynamic> asCloudFunctionParam() {
    return {
      "laundryId": laundryId,
      "to": to?.toFirebaseFormattedJson(),
      "from": from?.toFirebaseFormattedJson(),
      "notes": notes,
      "shippingCost": shippingCost,
      "paymentType": paymentType.toFirebaseFormatString(),
      "routeInformation": routeInformation?.toJson()
    };
  }
}
