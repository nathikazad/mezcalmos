import 'dart:convert';
import 'dart:math' show asin, atan2, cos, pi, pow, sin, sqrt;

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/env.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["General"];

typedef LocationChangesNotifier = void Function(LocModel.MezLocation? location);
double calculateDistanceFromBounds(LatLngBounds bounds) {
  final double centerLat =
      (bounds.northeast.latitude + bounds.southwest.latitude) / 2;
  final double centerLng =
      (bounds.northeast.longitude + bounds.southwest.longitude) / 2;
  final LatLng center = LatLng(centerLat, centerLng);

  final double p = 0.017453292519943295;
  final double a = 0.5 -
      cos((bounds.northeast.latitude - center.latitude) * p) / 2 +
      cos(center.latitude * p) *
          cos(bounds.northeast.latitude * p) *
          (1 - cos((bounds.northeast.longitude - center.longitude) * p)) /
          2;

  return (12742 * asin(sqrt(a))) * 1000;
}

double get getFetchDistance =>
    MezEnv.appLaunchMode == AppLaunchMode.prod ? 25000 : 10000000000000;

class RouteInformation {
  String polyline;
  RideDistance distance;
  RideDuration duration;

  RouteInformation({
    required this.polyline,
    required this.distance,
    required this.duration,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ...distance.toJson(),
      ...duration.toJson(),
      "polyline": polyline
    };
  }

  bool get valid {
    return duration.seconds > 0;
  }
}

class RideDistance {
  String distanceStringInKm;
  int distanceInMeters;

  RideDistance(this.distanceStringInKm, this.distanceInMeters);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "distance": <String, Object>{
        "text": distanceStringInKm,
        "value": distanceInMeters
      }
    };
  }

  RideDistance.fromJson(data)
      : distanceStringInKm = data['text'],
        distanceInMeters = data['value'];

  String toKmText() {
    return "${(distanceInMeters / 1000).toStringAsFixed(1)}km";
  }
}

String hoursMinsShortner(String original) {
  return original
      .replaceFirst('hours', 'hr')
      .replaceFirst('hour', 'hr')
      .replaceFirst('mins', 'min')
      .replaceFirst('min', 'min');
}

class RideDuration {
  String _text;
  String get longTextVersion => _text;
  String get shortTextVersion => hoursMinsShortner(_text);
  int seconds;

  RideDuration(this._text, this.seconds);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "duration": <String, Object>{"text": longTextVersion, "value": seconds}
    };
  }

  String inMinutesText() {
    return "${(seconds / 60).round()} ${_i18n()["min"]}";
  }

  RideDuration.fromJson(data)
      : _text = data['text'],
        seconds = data['value'];
}

class Route {
  RideDistance distance;
  RideDuration duration;
  List<PointLatLng> polylineList;
  String encodedPolyLine;

  Route({
    required this.duration,
    required this.distance,
    required this.polylineList,
    required this.encodedPolyLine,
  });
}

Future<LocModel.MezLocation> getCurrentLocation() async {
  final LocationData res =
      (await Get.find<LocationController>().getCurrentLocation());
  mezDbgPrint("Got current loc ====> $res");
  return LocModel.MezLocation("", res);
}

bool isLocationWithinIndia(LocModel.MezLocation loc) {
  // Approximate boundaries of India
  const double minLat = 6.7, maxLat = 35.5, minLng = 68.1, maxLng = 97.4;
  return loc.latitude >= minLat &&
      loc.latitude <= maxLat &&
      loc.longitude >= minLng &&
      loc.longitude <= maxLng;
}

Future<List<AutoCompleteResult>> getLocationsSuggestions(String search) async {
  mezDbgPrint("Getting locations with query =======>$search");
  final List<AutoCompleteResult> _returnedPredictions = <AutoCompleteResult>[];

  final cModels.Language userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  final LocationData loc =
      await Get.find<LocationController>().getCurrentLocation();

  final String components =
      isLocationWithinIndia(LocModel.MezLocation.fromLocationData(loc))
          ? "country:in"
          : "country:mx";

  final String url =
      "https://cors-mezc.herokuapp.com/api/place/autocomplete/json"
      "?input=$search&language=${userLanguage.toFirebaseFormatString()}&components=$components&location=${loc.latitude},${loc.longitude}&radius=50";

  mezDbgPrint(" $url \n ===>TWRK :  ${loc.latitude}  | ${loc.longitude}<===");

  if (loc == null) return _returnedPredictions;

  final http.Response resp = await http.get(Uri.parse(url));

  if (resp.statusCode == 200) {
    final Map<String, dynamic> respJson = json.decode(resp.body);

    if (respJson["status"] == "OK") {
      final List<dynamic> predictions = respJson["predictions"];
      for (final pred in predictions) {
        final String description = pred["description"];
        if (description.toLowerCase().startsWith(search.toLowerCase())) {
          _returnedPredictions.add(AutoCompleteResult(
            placeId: pred["place_id"],
            description: description,
          ));
        }
      }
    } else {
      mezDbgPrint("API Error: $respJson");
    }
  } else {
    mezDbgPrint("HTTP Error: ${resp.statusCode}");
  }

  mezDbgPrint("Returned Auto Complete ====> $_returnedPredictions");

  return _returnedPredictions;
}

/// This calls Places API with a [PlaceID] that can be fetched through [getLocationsSuggestions()] and returns [Location] !
Future<LocModel.MezLocation?> getLocationFromPlaceId(
    String placeId, String description) async {
  final String url =
      "https://cors-mezc.herokuapp.com/api/place/details/json?placeid=$placeId";
  final http.Response resp = await http.get(Uri.parse(url));
  final Map<String, dynamic> respJson = json.decode(resp.body);

  if (respJson["status"] == "OK") {
    final double lat = respJson["result"]["geometry"]["location"]["lat"];
    final double lng = respJson["result"]["geometry"]["location"]["lng"];

    return LocModel.MezLocation.fromFirebaseData(
        <String, Object>{"address": description, "lat": lat, "lng": lng});
  } else {
    return null;
    // in case there is a problem on request!
    // _controller.clear();
  }
}

/// Get Address [String] from Lat , Lng!
Future<String?> getAdressFromLatLng(LatLng latlng) async {
  //TODO: ALL HTTP CALLS MUST BE IMPLEMENTED INSIDE OF A TRY CATCH BLOCK!
  final String url =
      "https://cors-mezc.herokuapp.com/api/geocode/json?latlng=${latlng.latitude},${latlng.longitude}";

  http.Response? resp = null;
  try {
    resp = await (http.get(Uri.parse(url)).timeout(Duration(seconds: 10),
        onTimeout: () => throw Exception(
            "Timed out when trying to geocode LatLng(${latlng.latitude}, ${latlng.longitude})")));
  } catch (e, _stack) {
    logCrashes(e, _stack);
  }

  if (resp != null) {
    final Map<String, dynamic> respJson = json.decode(resp.body);

    if (respJson["status"] == "OK") {
      mezDbgPrint(respJson);
      final String address = respJson["results"][0]["formatted_address"];
      return address;
    } else {
      return null;
    }
  } else {
    return null;
  }
}

/// returns a Map {"distance" : { "text" : [in km] , "value": [in Meters]} , "duration": {"text" : [in days:h] , value : [in Seconds]}}
Future<Route?> getDurationAndDistance(
    LocModel.MezLocation from, LocModel.MezLocation to) async {
  //units=metric => this is so we can get distances in km , cuz default is miles !
  /// Note : distance.text is in [KM] while distance.value is in [M]!

  mezDbgPrint(
      "[tt] Called getDurationAndDistance \n- TO :  lat(${to.latitude}) | lng(to(${to.longitude}) \n- FROM :  lat(${from.latitude}) | lng(to(${from.longitude})!");

  final String components =
      isLocationWithinIndia(from) ? "country:in" : "country:mx";

  final String url =
      "https://cors-mezc.herokuapp.com/api/directions/json?units=metric&region=mx&destination=${to.latitude},${to.longitude}&origin=${from.latitude},${from.longitude}";
  mezDbgPrint("URL ==> $url");
  final http.Response resp = await http.get(Uri.parse(url));
  final Map<String, dynamic> respJson = json.decode(resp.body);

  mezDbgPrint("[tt] resp :: $respJson!");

  if (respJson["status"] == "OK") {
    final RideDistance distance =
        RideDistance.fromJson(respJson["routes"]?[0]?["legs"]?[0]?["distance"]);
    final RideDuration duration =
        RideDuration.fromJson(respJson["routes"]?[0]?["legs"]?[0]?["duration"]);
    final String encodedPolyLine =
        respJson["routes"]?[0]?["overview_polyline"]?['points'];

    mezDbgPrint(encodedPolyLine);

    final List<PointLatLng> polylinePoints =
        PolylinePoints().decodePolyline(encodedPolyLine);
    return Route(
      duration: duration,
      distance: distance,
      polylineList: polylinePoints,
      encodedPolyLine: encodedPolyLine,
    );
  } else {
    MezSnackbar('${_i18n()["error"]}', '${_i18n()["noRoute"]}');
    return null;
  }
}

/// Calculate Distance between To [LocationData] , return is in KM!
double calculateDistance(LocationData from, LocationData to) {
  final int R = 6371;
  final double dLat = (to.latitude! - from.latitude!) * pi / 180;
  final double dLon = (to.longitude! - from.longitude!) * pi / 180;

  final double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(from.latitude! * pi / 180) *
          cos(to.latitude! * pi / 180) *
          sin(dLon / 2) *
          sin(dLon / 2);
  final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  final double res = R * c; // this is in km

  return res;
}

LocModel.MezLocation alitasLoc = LocModel.MezLocation.fromHasura(
    Geography(15.87259551891018, -97.0804708551),
    "Costa Chica, 71984 Puerto Escondido, Oaxaca");

/// Don't use thid directly , Use [encodePolyLine()]!
String _encode(double current, double previous, int factor) {
  final int _current = (current * factor).round();
  final int _previous = (previous * factor).round();

  int coordinate = _current - _previous;
  coordinate <<= 1;
  if (_current - _previous < 0) {
    coordinate = ~coordinate;
  }

  String output = '';
  while (coordinate >= 0x20) {
    output += String.fromCharCode((0x20 | (coordinate & 0x1f)) + 63);
    coordinate >>= 5;
  }
  output += String.fromCharCode(coordinate + 63);
  return output;
}

/// we use this to Encode our polyline a.k.a List<LatLng> so we can save it in our db!
/// Google have a great clean doc in [https://developers.google.com/maps/documentation/utilities/polylinealgorithm]!
String encodePolyline(List<List<double>> coordinates, int precision) {
  if (coordinates.isEmpty) {
    return '';
  }

  final int factor = pow(10, precision is int ? precision : 5) as int;
  String output = _encode(coordinates[0][0], 0, factor) +
      _encode(coordinates[0][1], 0, factor);

  for (int i = 1; i < coordinates.length; i++) {
    List<double> a = coordinates[i], b = coordinates[i - 1];
    output += _encode(a[0], b[0], factor);
    output += _encode(a[1], b[1], factor);
  }

  return output;
}

/// decode a String encoded polyline!
List<LatLng> loadUpPolyline(String? polyline) {
  // Polylines stuff.
  if (polyline == null) return <LatLng>[];
  final List<LatLng> pLineCoords = <LatLng>[];

  final List<PointLatLng> res = PolylinePoints().decodePolyline(polyline);

  res.forEach((PointLatLng point) =>
      pLineCoords.add(LatLng(point.latitude, point.longitude)));

  return pLineCoords;
}

/// To create our LatLngBounds , used so we can fit Map Componenets in the map depending on LatLng!
LatLngBounds createMapBounds(List<LatLng> positions) {
  final double southwestLat = positions.map((LatLng p) => p.latitude).reduce(
      (double value, double element) =>
          value < element ? value : element); //  snallest value
  final double southwestLon = positions.map((LatLng p) => p.longitude).reduce(
      (double value, double element) => value < element ? value : element);
  final double northeastLat = positions.map((LatLng p) => p.latitude).reduce(
      (double value, double element) =>
          value > element ? value : element); // biggest value
  final double northeastLon = positions.map((LatLng p) => p.longitude).reduce(
      (double value, double element) => value > element ? value : element);
  // mapReady.value = true;
  return LatLngBounds(
      southwest: LatLng(southwestLat, southwestLon),
      northeast: LatLng(northeastLat, northeastLon));
}

extension LocationDataConverter on LocationData {
  LatLng? toLatLng() {
    if (latitude != null && longitude != null) {
      return LatLng(latitude!, longitude!);
    }
    return null;
  }
}

class AutoCompleteResult {
  String? placeId;
  String description;
  AutoCompleteResult({
    required this.placeId,
    required this.description,
  });

  factory AutoCompleteResult.fromMap(Map<String, dynamic> map) {
    return AutoCompleteResult(
      placeId: map['placeId'] as String,
      description: map['description'] as String,
    );
  }

  @override
  bool operator ==(covariant AutoCompleteResult other) {
    if (identical(this, other)) return true;

    return other.placeId == placeId && other.description == description;
  }
}

String getGMapsDirectionLink(LatLng? origin, LatLng destination) {
  final String baseUrl = 'https://www.google.com/maps/dir/?api=1';

  final String destinationParam =
      'destination=${destination.latitude},${destination.longitude}';

  String? originParam;
  String? waypoints;
  String? polylinePoints;
  String? markers;

  if (origin != null) {
    originParam = 'origin=${origin.latitude},${origin.longitude}';
    waypoints =
        'waypoints=${origin.latitude},${origin.longitude}|${destination.latitude},${destination.longitude}';
    polylinePoints = 'path=color:0x0000ff|enc:${_encodePolyline(<LatLng>[
          origin,
          destination
        ])}';
    markers =
        'markers=color:red|label:O|${origin.latitude},${origin.longitude}&markers=color:blue|label:D|${destination.latitude},${destination.longitude}';
  }

  // Encode the waypoints for polyline

  final String modeParam = 'travelmode=driving';

  final List<String> params = <String>[
    baseUrl,
    if (originParam != null) originParam,
    destinationParam,
    if (waypoints != null) waypoints,
    if (polylinePoints != null) polylinePoints,
    if (markers != null) markers,
    modeParam
  ];

  final String url = params.join('&');
  return url;
}

String _encodePolyline(List<LatLng> points) {
  final List<String> encodedPoints = points.map((LatLng point) {
    return '${point.latitude.toStringAsFixed(6)},${point.longitude.toStringAsFixed(6)}';
  }).toList();
  return Uri.encodeComponent(encodedPoints.join('|'));
}
