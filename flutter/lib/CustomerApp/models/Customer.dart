import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class Customer {
  // List<Order> currentOrders = [];
  String? appVersion;
  dynamic notificationInfo;
  List<SavedLocation> savedLocations = <SavedLocation>[];
  List<CreditCard> savedCards = <CreditCard>[];
  dynamic data;

  Customer.fromSnapshotData(data) {
    appVersion = data?["versionNumber"] ?? null;
    notificationInfo = data?["notificationInfo"];

    if (data["savedLocations"] != null) {
      Map<String, dynamic>.from(data["savedLocations"])
          .entries
          .forEach((MapEntry<String, dynamic> entry) {
        savedLocations.add(
          SavedLocation.fromData(id: entry.key, data: entry.value),
        );
      });
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

class SavedLocation {
  String name;
  String? id;
  Location? location;

  SavedLocation({
    required this.name,
    this.location,
    this.id,
  });

  factory SavedLocation.fromData({
    required String id,
    required data,
  }) {
    return SavedLocation(
      name: data["name"],
      location: Location.fromFirebaseData(data),
      id: id,
    );
  }

  Map<String, dynamic> toFirebaseFormattedJson() {
    final Map<String, dynamic> json = (location != null)
        ? location!.toFirebaseFormattedJson()
        : <String, dynamic>{};

    json["name"] = name;
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

  factory CreditCard.fromData({required String id, required dynamic data}) {
    return CreditCard(
        id: id,
        brand: data["brand"]!.toString().toCardBrand() ?? CardBrand.Visa,
        expYear: data["expYear"],
        expMonth: data["expMonth"],
        last4: data["last4"]);
  }
}
