import 'package:location/location.dart';

class Location {
  String address;
  LocationData position;
  Location(this.address, this.position);
  factory Location.fromData(dynamic location) {
    LocationData position = LocationData.fromMap(<String, dynamic>{
      "latitude": location["lat"],
      "longitude": location["lng"]
    });
    return Location(location["address"], position);
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
}
