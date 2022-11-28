import 'package:collection/collection.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
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

  Customer.fromSnapshotData(data) {
    appVersion = data?["versionNumber"] ?? null;
    notificationInfo = data?["notificationInfo"];

    if (data["savedLocations"] != null) {
      Map<int, dynamic>.from(data["savedLocations"])
          .entries
          .forEach((MapEntry<int, dynamic> entry) {
        savedLocations.add(
          SavedLocation.fromData(id: entry.key, data: entry.value),
        );
      });
      // if none of the locations are default, then set the first location as default
      if (savedLocations.length > 0 &&
          savedLocations
                  .where((SavedLocation savedLocation) =>
                      savedLocation.defaultLocation)
                  .length ==
              0) savedLocations[0].defaultLocation = true;
    }
    if (data["stripe"] != null) {
      if (data["stripe"]["cards"] != null) {
        Map<String, dynamic>.from(data["stripe"]["cards"])
            .entries
            .forEach((MapEntry<String, dynamic> entry) {
          savedCards.add(
            CreditCard.fromData(id: entry.key, data: entry.value),
          );
        });
      }
    }
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

extension ParseGeography on Geography {
  LocationData toLocationData() {
    return LocationData.fromMap({"latitude": latitude, "longitude": longitude});
  }
}

extension ParseLocationData on LocationData {
  Geography? toGeography() {
    if (latitude != null && longitude != null) {
      return Geography(latitude!, longitude!);
    }
    return null;
  }
}

class SavedLocation {
  String name;
  int id;
  LocModel.Location location;
  bool defaultLocation;

  SavedLocation(
      {required this.name,
      required this.id,
      required this.location,
      this.defaultLocation = false});

  factory SavedLocation.fromHasuraData(
      {required Input$saved_location_insert_input savedLocation}) {
    return SavedLocation(
      name: savedLocation.name!,
      location: LocModel.Location(savedLocation.location_text!,
          savedLocation.location_gps!.toLocationData()),
      id: savedLocation.id!,
      defaultLocation: savedLocation.$default ?? false,
    );
  }

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

extension SavedLocationsFunctions on SavedLocations {
  Map<int, Object> toFirebaseFormattedJson() {
    final Map<int, Object> json = <int, Object>{};
    forEach((SavedLocation savedLocation) =>
        json[savedLocation.id] = savedLocation.toFirebaseFormattedJson());
    return json;
  }
}

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
