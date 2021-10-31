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
