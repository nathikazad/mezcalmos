import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class LaundryRequest {
  String laundryId;
  String? notes;
  Location? to;
  PaymentType paymentType;
  LaundryRequest({
    required this.laundryId,
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
      "laundryId": laundryId,
      "to": to?.toFirebaseFormattedJson(),
      "notes": notes,
      "paymentType": paymentType.toFirebaseFormatString(),
    };
  }
}
