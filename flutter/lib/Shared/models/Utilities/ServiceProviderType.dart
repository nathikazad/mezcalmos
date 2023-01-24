enum ServiceProviderType { Customer, Restaurant, Laundry, Delivery_company }

extension ParseServiceProviderTypeToString on ServiceProviderType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  String toNormalString() {
    String str = toString().split('.').last;
    str = str[0].toUpperCase() + str.substring(1);
    str = str.replaceFirst("_", " ");
    return str;
  }
}

extension ParseStringToServiceProviderType on String {
  ServiceProviderType toServiceProviderType() {
    return ServiceProviderType.values.firstWhere((ServiceProviderType e) =>
        e.toFirebaseFormatString().toLowerCase() == this);
  }
}
