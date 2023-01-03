import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

enum MinimalOrderStatus {
  InProcess,
  Delivered,
  Cancelled,
}

extension ParseMinimalOrderStatusToString on MinimalOrderStatus {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseRestaurantOrderStatusToMinimalOrderStatus
    on RestaurantOrderStatus {
  MinimalOrderStatus toMinimalOrderStatus() {
    switch (this) {
      case RestaurantOrderStatus.CancelledByAdmin:
      case RestaurantOrderStatus.CancelledByCustomer:
        return MinimalOrderStatus.Cancelled;
      case RestaurantOrderStatus.Delivered:
        return MinimalOrderStatus.Delivered;

      default:
        return MinimalOrderStatus.InProcess;
    }
  }
}
