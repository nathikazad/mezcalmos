enum DeliveryType { Now, Scheduled }

extension ParseDeliveryTypeToString on DeliveryType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  String toNormalString() {
    final String str = toString().split('.').last;

    return str;
  }
}

extension ParseStringToDeliveryType on String {
  DeliveryType toDeliveryType() {
    return DeliveryType.values.firstWhere((DeliveryType e) =>
        e.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}
