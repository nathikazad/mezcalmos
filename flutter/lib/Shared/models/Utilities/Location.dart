import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class MezLocation {
  String address;
  LocationData position;
  MezLocation(this.address, this.position);
  factory MezLocation.fromFirebaseData(location) {
    // mezDbgPrint("Building LocData => $location");
    final LocationData position =
        buildLocationData(location["lat"], location["lng"]);
    return MezLocation(location["address"], position);
  }

  factory MezLocation.fromLocationData(LocationData locationData) {
    return MezLocation("", locationData);
  }

  factory MezLocation.fromHasura(Geography locationData, address) {
    final LocationData position = buildLocationData(
        locationData.latitude.toDouble(), locationData.longitude.toDouble());
    return MezLocation(address, position);
  }

  static LocationData buildLocationData(double lat, double lng) {
    return LocationData.fromMap(
        <String, dynamic>{"latitude": lat, "longitude": lng});
  }

  LocationData toLocationData() {
    return LocationData.fromMap(
        <String, dynamic>{"latitude": latitude, "longitude": longitude});
  }

  LatLng? toLatLng() {
    if (isValidLocation() &&
        position.latitude != null &&
        position.longitude != null)
      return LatLng(position.latitude!, position.longitude!);
    return null;
  }

  Map<String, String> toJson() =>
      {"address": address, "position": position.toString()};

  double get latitude => position.latitude!;
  double get longitude => position.longitude!;

  Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      "address": address,
      "lat": position.latitude,
      "lng": position.longitude
    };
  }

  Geography toGeography() {
    return Geography(position.latitude!, -97.07638386636972);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MezLocation && other.address == address;
  }

  bool isValidLocation() =>
      //  address.replaceAll(' ', '') != "0.0,0.0" &&
      position.latitude != 0 && position.longitude != 0;

  @override
  int get hashCode => address.hashCode;

  Map<String, dynamic> toGpsJson() {
    return {
      "address": address,
      "gps": {
        "type": "",
        "coordinates": [latitude, longitude]
      }
    };
  }
}

cModels.Location constructLocation(Geography locationData, String address) {
  return cModels.Location(
      lat: locationData.latitude,
      lng: locationData.longitude,
      address: address);
}
