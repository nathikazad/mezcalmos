import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

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
    return (to != null);
  }

  void setToLocation(Location? loc) {
    to = loc;
  }

  Map<String, dynamic> asCloudFunctionParam() {
    return {
      "to": to?.toFirebaseFormattedJson(),
      "notes": notes,
      "paymentType": paymentType.toFirebaseFormatString(),
    };
  }
}
