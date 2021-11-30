import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Location {
  String address;
  LocationData position;
  Location(this.address, this.position);
  factory Location.fromFirebaseData(dynamic location) {
    LocationData position = buildLocationData(location["lat"], location["lng"]);
    return Location(location["address"], position);
  }

  static LocationData buildLocationData(double lat, double lng) {
    return LocationData.fromMap(
        <String, dynamic>{"latitude": lat, "longitude": lng});
  }

  LatLng toLatLng() {
    return LatLng(position.latitude!, position.longitude!);
  }

  Map<String, String> toJson() =>
      {"address": this.address, "position": this.position.toString()};

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
  String toString() {
    return "{address : $address , position : ${toLatLng()}}";
  }
}
