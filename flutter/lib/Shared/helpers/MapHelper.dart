import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:math' show cos, sqrt, sin, pi, atan2;
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';

LatLngBounds createMapBounds(List<LatLng> positions) {
  final southwestLat = positions.map((p) => p.latitude).reduce(
      (value, element) => value < element ? value : element); //  snallest value
  final southwestLon = positions
      .map((p) => p.longitude)
      .reduce((value, element) => value < element ? value : element);
  final northeastLat = positions.map((p) => p.latitude).reduce(
      (value, element) => value > element ? value : element); // biggest value
  final northeastLon = positions
      .map((p) => p.longitude)
      .reduce((value, element) => value > element ? value : element);
  // mapReady.value = true;
  return LatLngBounds(
      southwest: LatLng(southwestLat, southwestLon),
      northeast: LatLng(northeastLat, northeastLon));
}

List<LatLng> loadUpPolyline(String? polyline) {
  // Polylines stuff.
  if (polyline == null) return <LatLng>[];
  List<LatLng> pLineCoords = [];

  List<PointLatLng> res = PolylinePoints()
      .decodePolyline(polyline);

  res.forEach((PointLatLng point) =>
      pLineCoords.add(LatLng(point.latitude, point.longitude)));

  return pLineCoords;
}

class MapHelper {
  static double calculateDistance(LocationData from, LocationData to) {
    var R = 6371;
    var dLat = (to.latitude! - from.latitude!) * pi / 180;
    var dLon = (to.longitude! - from.longitude!) * pi / 180;

    var a = sin(dLat / 2) * sin(dLat / 2) +
        cos(from.latitude! * pi / 180) *
            cos(to.latitude! * pi / 180) *
            sin(dLon / 2) *
            sin(dLon / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var res = R * c; // this is in km

    return res;
  }
}
