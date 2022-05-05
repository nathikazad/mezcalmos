import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class LaundryRequest {
  String? notes;

  /// to means Customer's location.
  Location? from;

  /// from means laundry's location (choosen by the customer)
  Location? to;
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
    return (from != null);
  }

  void setToLocation(Location? loc) {
    from = loc;
  }

  bool isFromToSet() {
    return from != null && to != null;
  }

  Map<String, dynamic> asCloudFunctionParam() {
    return <String, dynamic>{
      "to": from?.toFirebaseFormattedJson(),
      "notes": notes,
      "paymentType": paymentType.toFirebaseFormatString(),
      "routeInformation": routeInformation?.toJson()
    };
  }
}
