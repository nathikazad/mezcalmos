import 'package:mezcalmos/Shared/models/Location.dart';

class Customer {
  // List<Order> currentOrders = [];
  String? appVersion;
  dynamic notificationInfo;
  List<SavedLocation> savedLocations = [];
  dynamic data;
  Customer.fromSnapshot(dynamic data) {
    this.data = data;
    this.appVersion = data["versionNumber"] ?? null;
    this.notificationInfo = data["notificationInfo"];
    List<SavedLocation> newSavedLocations = [];
    if(data["savedLocations"] != null)
      for (var locationId in data["savedLocations"]) {
        dynamic locationData = data["savedLocations"][locationId];
        newSavedLocations
            .add(SavedLocation.fromData(id: locationId, data: locationData));
      }
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
        name: data["name"], location: Location.fromData(data), id: id);
  }

  Map<String, dynamic> toFirebaseFormattedJson() {
    Map<String, dynamic> json = this.location.toFirebaseFormattedJson();
    json["name"] = this.name;
    return json;
  }
}
