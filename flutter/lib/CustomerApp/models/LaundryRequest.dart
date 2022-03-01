import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';

class LaundryRequest {
  String? notes;
  Location? to;
  PaymentType paymentType;
  LaundryRequest({
    this.notes,
    this.to,
    this.paymentType = PaymentType.Cash,
  });

  bool valid() {
    return (this.to != null);
  }

  void setToLocation(Location? loc) {
    this.to = loc;
  }

  Map<String, dynamic> asCloudFunctionParam() {
    return {
      "to": to?.toFirebaseFormattedJson(),
      "notes": notes,
      "paymentType": paymentType.toFirebaseFormatString(),
    };
  }
}
