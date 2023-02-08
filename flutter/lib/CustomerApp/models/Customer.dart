// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:collection/collection.dart';
import 'package:mezcalmos/CustomerApp/models/CustStripeInfo.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/models/Utilities/NotificationInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class Customer {
  // List<Order> currentOrders = [];
  String? appVersion;
  NotificationInfo? notificationInfo;
  SavedLocations savedLocations = <SavedLocation>[];
  CustStripeInfo? stripeInfo;
  dynamic data;
  SavedLocation? get defaultLocation => savedLocations.firstWhereOrNull(
      (SavedLocation savedLocation) => savedLocation.defaultLocation);

  Customer({
    this.appVersion,
    this.notificationInfo,
    this.stripeInfo,
  });

  void addSavedLocation(SavedLocation loc) {
    savedLocations.add(loc);
  }

  void addCreditCard(CreditCard card) {
    stripeInfo?.cards.add(card);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{"notificationInfo": notificationInfo};
  }

  SavedLocation? getLocation(String locationId) {
    try {
      return savedLocations.firstWhere(
        (SavedLocation savedLocation) => savedLocation.id == locationId,
      );
    } on StateError {
      return null;
    }
  }
}

class SavedLocation {
  String name;
  int? id;
  LocModel.MezLocation location;
  bool defaultLocation;

  SavedLocation(
      {required this.name,
      required this.id,
      required this.location,
      this.defaultLocation = false});

  // factory SavedLocation.fromHasuraData(
  //     {required Input$saved_location_insert_input savedLocation}) {
  //   return SavedLocation(
  //     name: savedLocation.name!,
  //     location: LocModel.Location(savedLocation.location_text!,
  //         savedLocation.location_gps!.toLocationData()),
  //     id: savedLocation.id!,
  //     defaultLocation: savedLocation.$default ?? false,
  //   );
  // }

  factory SavedLocation.fromData({
    required int id,
    required data,
  }) {
    return SavedLocation(
        name: data["name"],
        location: LocModel.MezLocation.fromFirebaseData(data),
        id: id,
        defaultLocation: data["default"] ?? false);
  }

  Map<String, dynamic> toFirebaseFormattedJson() {
    final Map<String, dynamic> json = (location != null)
        ? location.toFirebaseFormattedJson()
        : <String, dynamic>{};

    json["name"] = name;
    json["default"] = defaultLocation;
    return json;
  }
}

typedef SavedLocations = List<SavedLocation>;

class CreditCard {
  String id;
  CardBrand brand;
  num expMonth;
  num expYear;
  String last4;
  Map<ServiceProviderType, Map<int, String>>? idsWithServiceProvider;

  CreditCard({
    required this.id,
    required this.brand,
    required this.expYear,
    required this.expMonth,
    required this.last4,
  });

  factory CreditCard.fromData({required data}) {
    return CreditCard(
      id: data["id"],
      brand: data["brand"]?.toString().toCardBrand() ?? CardBrand.Visa,
      expYear: data["expYear"],
      expMonth: data["expMonth"],
      last4: data["last4"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'brand': brand.toFirebaseFormatString(),
      'expMonth': expMonth,
      'expYear': expYear,
      'last4': last4,
    };
  }

  @override
  bool operator ==(covariant CreditCard other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.brand == brand &&
        other.expMonth == expMonth &&
        other.expYear == expYear &&
        other.last4 == last4;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        brand.hashCode ^
        expMonth.hashCode ^
        expYear.hashCode ^
        last4.hashCode;
  }
}
