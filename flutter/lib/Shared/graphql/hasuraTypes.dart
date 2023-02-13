import 'dart:convert';

import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class Geography {
  final double latitude;
  final double longitude;
  Geography(this.latitude, this.longitude);
}

Geography geographyFromJson(data) {
  final List<dynamic> coordinates = data["coordinates"];

  return Geography(double.parse(coordinates[1].toString()),
      double.parse(coordinates[0].toString()));
}

dynamic geographyToJson(Geography geography) {
  return <String, dynamic>{
    "type": "Point",
    "crs": {
      "type": "name",
      "properties": {"name": "urn:ogc:def:crs:EPSG::4326"}
    },
    "coordinates": [geography.longitude, geography.latitude]
  };
}

double moneyFromJson(String data) {
  final String str = data.split('\$').last.replaceAll(",", "");

  return double.parse(str);
}

String moneyToJson(double money) => "$money";

/// Accepts a translations array (from hasura) and return a language map object
// ignore: avoid_annotating_with_dynamic
Map<LanguageType, String> toLanguageMap({required List translations}) {
  final Map<LanguageType, String> map = {};
  translations.forEach((element) {
    map[element.language_id.toString().toLanguageType()] = element.value;
  });
  return map;
}
  Map<LanguageType, bool> convertToLanguages(languages) {
    Map<LanguageType, bool> data = {};
    languages.forEach((key, value) {
      data[key] = value;
    });
    return data;
  }
/// Decode a jsonString into a Map<String, dynamic>
T mapFromJson<T>(jsonString) {
  return jsonDecode(jsonString.toString()) as T;
}

/// Stringify a Map object
String mapToJson(map) {
  return jsonEncode(map);
}
