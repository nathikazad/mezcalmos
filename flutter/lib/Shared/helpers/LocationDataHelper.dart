import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

extension LocationDataHelper on LocationData {
  LatLng? getLatLng() {
    if (latitude != null && longitude != null)
      return LatLng(latitude!, longitude!);
    return null;
  }
}
