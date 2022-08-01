import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class Customer {
  // List<Order> currentOrders = [];
  String? appVersion;
  dynamic notificationInfo;
  List<SavedLocation> savedLocations = <SavedLocation>[];
  dynamic data;

  Customer.fromSnapshotData(data) {
    appVersion = data?["versionNumber"] ?? null;
    notificationInfo = data?["notificationInfo"];

    if (data["savedLocations"] != null) {
      Map<String, dynamic>.from(data?["savedLocations"])
          .entries
          .forEach((MapEntry<String, dynamic> entry) {
        savedLocations.add(
          SavedLocation.fromData(id: entry.key, data: entry.value),
        );
      });
    }
    // for (var locationId in ) {
    //   dynamic locationData = data["savedLocations"][locationId];
    //   newSavedLocations
    //       .add(SavedLocation.fromData(id: locationId, data: locationData));
    // }
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
