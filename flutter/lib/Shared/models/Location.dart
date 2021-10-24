import 'package:location/location.dart';

class Location {
  late String address;
  late LocationData position;

  Location(dynamic location) {
    this.address = location["address"];
    this.position = LocationData.fromMap(<String, dynamic>{
      "latitude": location["lat"],
      "longitude": location["lng"]
    });
  }

  dynamic get latitude => position.latitude;
  dynamic get longitude => position.longitude;
}
