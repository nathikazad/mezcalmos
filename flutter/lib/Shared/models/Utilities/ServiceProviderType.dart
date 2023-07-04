import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["models"]
    ["Utilities"]["ServiceProviderType"];

extension ParseServiceProviderTypeToString on ServiceProviderType {
//   String toFirebaseFormatString() {
//     final String str = toString().split('.').last;
//     return str[0].toLowerCase() + str.substring(1);
//   }

  String toNormalString() {
    String str = toFirebaseFormatString();

    return "${_i18n()["$str"]}";
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

// extension ParseStringToServiceProviderType on String {
//   ServiceProviderType toServiceProviderType() {
//     return ServiceProviderType.values.firstWhere(
//         (ServiceProviderType e) => e.toFirebaseFormatString() == this);
//   }
// }
