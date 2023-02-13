enum DeliveryOrderStatus {
  OrderReceived,
  OnTheWayToPickup,
  PackageReady,
  AtPickup,
  OnTheWayToDropoff,
  AtDropoff,
  Delivered,
  CancelledByCustomer,
  CancelledByDeliverer,
  CancelledByServiceProvider
}

extension ParseDeliveryOrderStatusToString on DeliveryOrderStatus {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  String toNormalString() {
    final String str = toString().split('.').last;

    return str;
  }
}

extension ParseStringToDeliveryOrderStatus on String {
  DeliveryOrderStatus toDeliveryOrderStatus() {
    return DeliveryOrderStatus.values.firstWhere((DeliveryOrderStatus e) =>
        e.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}
