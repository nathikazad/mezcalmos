enum DeliveryCompanyType { Restaurant, Laundry, Delivery_company }

extension ParseDeliveryCompanyTypeToString on DeliveryCompanyType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToDeliveryCompanyType on String {
  DeliveryCompanyType toDeliveryCompanyType() {
    return DeliveryCompanyType.values.firstWhere((DeliveryCompanyType e) =>
        e.toFirebaseFormatString().toLowerCase() == this);
  }
}
