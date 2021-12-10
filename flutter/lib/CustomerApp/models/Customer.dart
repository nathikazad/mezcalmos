import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class Customer {
  // List<Order> currentOrders = [];
  String? appVersion;
  dynamic notificationInfo;
  List<SavedLocation> savedLocations = [];
  dynamic data;
  Customer.fromSnapshotData(dynamic data) {
    this.appVersion = data?["versionNumber"] ?? null;
    this.notificationInfo = data?["notificationInfo"];
    List<SavedLocation> newSavedLocations = [];

    mezDbgPrint("SavedLocations ===> ${data?["savedLocations"]}");
    if (data["savedLocations"] != null) {
      Map<String, dynamic>.from(data?["savedLocations"])
          .entries
          .forEach((entry) {
        savedLocations
            .add(SavedLocation.fromData(id: entry.key, data: entry.value));
      });
    }
    // for (var locationId in ) {
    //   dynamic locationData = data["savedLocations"][locationId];
    //   newSavedLocations
    //       .add(SavedLocation.fromData(id: locationId, data: locationData));
    // }
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{"notificationInfo": this.notificationInfo};
  }

  SavedLocation? getLocation(String locationId) {
    try {
      return savedLocations
          .firstWhere((savedLocation) => savedLocation.id == locationId);
    } on StateError {
      return null;
    }
  }
}

class SavedLocation {
  String name;
  String? id;
  Location location;
  SavedLocation({required this.name, required this.location, this.id});
  factory SavedLocation.fromData({required String id, required dynamic data}) {
    return SavedLocation(
        name: data["name"], location: Location.fromFirebaseData(data), id: id);
  }

  Map<String, dynamic> toFirebaseFormattedJson() {
    Map<String, dynamic> json = this.location.toFirebaseFormattedJson();
    json["name"] = this.name;
    return json;
  }
}
