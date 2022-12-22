import 'package:collection/collection.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;

class Customer {
  // List<Order> currentOrders = [];
  String? appVersion;
  dynamic notificationInfo;
  SavedLocations savedLocations = <SavedLocation>[];
  List<CreditCard> savedCards = <CreditCard>[];
  dynamic data;
  SavedLocation? get defaultLocation => savedLocations.firstWhereOrNull(
      (SavedLocation savedLocation) => savedLocation.defaultLocation);

  Customer({
    this.appVersion,
    this.notificationInfo,
  });

  void addSavedLocation(SavedLocation loc) {
    savedLocations.add(loc);
  }

  void addCreditCard(CreditCard card) {
    savedCards.add(card);
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
  LocModel.Location location;
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
        location: LocModel.Location.fromFirebaseData(data),
        id: id,
        defaultLocation: data["default"] ?? false);
  }

  Map<String, dynamic> toFirebaseFormattedJson() {
    final Map<String, dynamic> json = (location != null)
        ? location!.toFirebaseFormattedJson()
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

  CreditCard(
      {required this.id,
      required this.brand,
      required this.expYear,
      required this.expMonth,
      required this.last4});

  factory CreditCard.fromData({required String id, required data}) {
    return CreditCard(
        id: id,
        brand: data["brand"]?.toString().toCardBrand() ?? CardBrand.Visa,
        expYear: data["expYear"],
        expMonth: data["expMonth"],
        last4: data["last4"]);
  }
}
