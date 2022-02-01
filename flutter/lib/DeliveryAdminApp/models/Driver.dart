import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Driver {
  bool available = false;
  String name;
  String imageUrl;

  LatLng location;
  Driver({
    required this.available,
    required this.name,
    required this.imageUrl,
    required this.location,
  });

  static List<Driver> dummyDrivers = [
    Driver(
        available: true,
        name: 'Montassare Driver',
        imageUrl:
            'https://totaljobshub.in/wp-content/uploads/5350f78bac94c48e0792a288cdf36006_delivery-driver_SOCIAL.jpg',
        location: LatLng(17.0732, 96.7266)),
    Driver(
        available: false,
        name: 'Saad Driver',
        imageUrl:
            'http://deliveryexpressinc.com/wp-content/uploads/2015/11/Driver.jpg',
        location: LatLng(17.0732, 96.7196))
  ];

  Map<String, dynamic> toMap() {
    return {
      'available': available,
      'name': name,
      'imageUrl': imageUrl,
      'location': location,
    };
  }

  factory Driver.fromMap(Map<String, dynamic> map) {
    return Driver(
      available: map['available'] ?? false,
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      location: map['latLng'] ?? null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Driver.fromJson(String source) => Driver.fromMap(json.decode(source));
}
