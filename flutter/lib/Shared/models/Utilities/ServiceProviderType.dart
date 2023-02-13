import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

enum ServiceProviderType { Customer, Restaurant, Laundry, DeliveryCompany }

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

  IconData toIcon() {
    switch (this) {
      case ServiceProviderType.Restaurant:
        return Icons.food_bank;
      case ServiceProviderType.DeliveryCompany:
        return Icons.delivery_dining;
      case ServiceProviderType.Laundry:
        return Icons.dry_cleaning;

      default:
        return Icons.store;
    }
  }
}

extension ParseStringToServiceProviderType on String {
  ServiceProviderType toServiceProviderType() {
    mezDbgPrint("Caaaaaattttt ===============>$this");
    mezDbgPrint(
        "Caaaaaattttt ===============>${ServiceProviderType.DeliveryCompany.toFirebaseFormatString()}");
    return ServiceProviderType.values.firstWhere(
        (ServiceProviderType e) => e.toFirebaseFormatString() == this);
  }
}
