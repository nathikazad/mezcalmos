import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

enum MinimalOrderStatus {
  Open,
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
      case DeliveryOrderStatus.CancelledByAdmin:
      case DeliveryOrderStatus.CancelledByServiceProvider:
        return MinimalOrderStatus.Cancelled;
      case DeliveryOrderStatus.Delivered:
        return MinimalOrderStatus.Delivered;

      default:
        return MinimalOrderStatus.InProcess;
    }
  }
}

extension ParseMinimalDeliveryOrderStatusToMinimalOrderStatus
    on MinimalDeliveryOrderStatus {
  MinimalOrderStatus toMinimalOrderStatus() {
    switch (this) {
      case MinimalDeliveryOrderStatus.Finished:
        return MinimalOrderStatus.Delivered;
      case MinimalDeliveryOrderStatus.InProcess:
        return MinimalOrderStatus.InProcess;
      case MinimalDeliveryOrderStatus.Open:
        return MinimalOrderStatus.Open;

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

extension ParseLaundryOrderStatusToMinimalOrderStatus on LaundryOrderStatus {
  MinimalOrderStatus toMinimalOrderStatus() {
    switch (this) {
      case LaundryOrderStatus.CancelledByCustomer:
      case LaundryOrderStatus.CancelledByAdmin:
        return MinimalOrderStatus.Cancelled;
      case LaundryOrderStatus.Delivered:
        return MinimalOrderStatus.Delivered;

      default:
        return MinimalOrderStatus.InProcess;
    }
  }
}

extension ParseBusinessOrderStatusToMinimalOrderStatus
    on BusinessOrderRequestStatus {
  MinimalOrderStatus toMinimalOrderStatus() {
    switch (this) {
      case BusinessOrderRequestStatus.CancelledByCustomer:
      case BusinessOrderRequestStatus.CancelledByBusiness:
        return MinimalOrderStatus.Cancelled;
      case BusinessOrderRequestStatus.Confirmed:
        return MinimalOrderStatus.Delivered;

      default:
        return MinimalOrderStatus.InProcess;
    }
  }
}
