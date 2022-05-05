import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class LaundryRequest {
  String? notes;

  /// to means Customer's location.
  Location? to;

  /// from means laundry's location (choosen by the customer)
  Location? from;
  RouteInformation? routeInformation;
  PaymentType paymentType;
  LaundryRequest({
    this.routeInformation,
    this.notes,
    this.from,
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
    return <String, dynamic>{
      "to": to?.toFirebaseFormattedJson(),
      "from": from?.toFirebaseFormattedJson(),
      "notes": notes,
      "paymentType": paymentType.toFirebaseFormatString(),
      "routeInformation": routeInformation?.toJson()
    };
  }
}
