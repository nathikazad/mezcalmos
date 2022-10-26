enum DeliveryMode {
  None,
  ForwardedToMezCalmos,
  SelfDeliveryByDriver,
  SelfDeliveryByRestaurant
}

extension ParseDeliveryTypeToString on DeliveryMode {
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
  DeliveryMode toDeliveryMode() {
    return DeliveryMode.values.firstWhere((DeliveryMode e) =>
        e.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}
