import 'package:mezcalmos/DeliveryApp/models/utilities/DeliveryOrderStatus.dart';
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

extension ParseDeliveryOrderStatusToMinimalOrderStatus on DeliveryOrderStatus {
  MinimalOrderStatus toMinimalOrderStatus() {
    switch (this) {
      case DeliveryOrderStatus.CancelledByCustomer:
      case DeliveryOrderStatus.CancelledByDeliverer:
      case DeliveryOrderStatus.CancelledByServiceProvider:
        return MinimalOrderStatus.Cancelled;
      case DeliveryOrderStatus.Delivered:
        return MinimalOrderStatus.Delivered;

      default:
        return MinimalOrderStatus.InProcess;
    }
  }
}

extension ParseRestaurantOrderStatusToMinimalOrderStatus
    on RestaurantOrderStatus {
  MinimalOrderStatus toMinimalOrderStatus() {
    switch (this) {
      case RestaurantOrderStatus.CancelledByCustomer:
      case RestaurantOrderStatus.CancelledByAdmin:
        return MinimalOrderStatus.Cancelled;
      case RestaurantOrderStatus.Delivered:
        return MinimalOrderStatus.Delivered;

      default:
        return MinimalOrderStatus.InProcess;
    }
  }
}
