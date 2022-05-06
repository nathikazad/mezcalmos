import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Location {
  String address;
  LocationData position;
  Location(this.address, this.position);
  factory Location.fromFirebaseData(location) {
    // mezDbgPrint("Building LocData => $location");
    final LocationData position =
        buildLocationData(location["lat"], location["lng"]);
    return Location(location["address"], position);
  }

  factory Location.fromLocationData(LocationData locationData) {
    return Location("", locationData);
  }

  static LocationData buildLocationData(double lat, double lng) {
    return LocationData.fromMap(
        <String, dynamic>{"latitude": lat, "longitude": lng});
  }

  LatLng toLatLng() {
    return LatLng(position.latitude!, position.longitude!);
  }

  Map<String, String> toJson() =>
      {"address": address, "position": position.toString()};

  dynamic get latitude => position.latitude;
  dynamic get longitude => position.longitude;

  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "address": address,
      "lat": position.latitude,
      "lng": position.longitude
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Location && other.address == address;
  }

  @override
  int get hashCode => address.hashCode;
}
