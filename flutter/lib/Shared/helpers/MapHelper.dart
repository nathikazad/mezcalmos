import 'dart:convert';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'dart:math' show cos, sqrt, sin, pi, atan2;
import 'package:http/http.dart' as http;
import 'package:mezcalmos/Shared/models/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

Future<Map<String, String>> getLocationsSuggestions(String search) async {
  LanguageController _lang = Get.find<LanguageController>();
  String url =
      "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&language=${_lang.userLanguageKey}&components=country:mx&key=$placesApikey";

  http.Response resp = await http.get(Uri.parse(url));
  Map<String, dynamic> respJson = json.decode(resp.body);
  Map<String, String> _returnedPredictions = <String, String>{};

  if (respJson["status"] == "OK") {
    respJson["predictions"].forEach((pred) {
      if (pred["description"].toLowerCase().contains(search.toLowerCase())) {
        _returnedPredictions[pred["place_id"]] = pred["description"];
      }
    });
  }

  mezDbgPrint(_returnedPredictions.length);

  return _returnedPredictions;
}

Future<LocModel.Location?> getLocationFromPlaceId(String placeId) async {
  String url =
      "https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=$placesApikey";
  http.Response resp = await http.get(Uri.parse(url));
  Map<String, dynamic> respJson = json.decode(resp.body);

  if (respJson["status"] == "OK") {
    double lat = respJson["result"]["geometry"]["location"]["lat"];
    double lng = respJson["result"]["geometry"]["location"]["lng"];
    String address = respJson["result"]["formatted_address"];

    return LocModel.Location({"address": address, "lat": lat, "lng": lng});
  } else {
    return null;
    // in case there is a problem on request!
    // _controller.clear();
  }
}

Future<String?> getAdressFromLatLng(LatLng latlng) async {
  //TODO: ALL HTTP CALLS MUST BE IMPLEMENTED INSIDE OF A TRY CATCH BLOCK!
  String url =
      "https://maps.googleapis.com/maps/api/geocode/json?latlng=${latlng.latitude},${latlng.latitude}&key=$placesApikey";

  http.Response resp = await http.get(Uri.parse(url));
  Map<String, dynamic> respJson = json.decode(resp.body);

  if (respJson["status"] == "OK") {
    mezDbgPrint(respJson);
    String address = respJson["results"][0]["formatted_address"];
    return address;
  } else {
    return null;
  }
}

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

  List<PointLatLng> res = PolylinePoints().decodePolyline(polyline);

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
