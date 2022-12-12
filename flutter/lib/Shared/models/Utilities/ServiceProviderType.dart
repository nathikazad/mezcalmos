enum ServiceProviderType { Customer, Restaurant, Laundry }

extension ParseServiceProviderTypeToString on ServiceProviderType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToServiceProviderType on String {
  ServiceProviderType toServiceProviderType() {
    return ServiceProviderType.values.firstWhere((ServiceProviderType e) =>
        e.toFirebaseFormatString().toLowerCase() == this);
  }
}
