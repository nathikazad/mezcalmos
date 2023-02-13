enum DeliveryDirection { ToCustomer, FromCustomer }

extension ParseDeliveryDirectionToString on DeliveryDirection {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  String toNormalString() {
    final String str = toString().split('.').last;

    return str;
  }
}

extension ParseStringToDeliveryDirection on String {
  DeliveryDirection toDeliveryDirection() {
    return DeliveryDirection.values.firstWhere((DeliveryDirection e) =>
        e.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}
