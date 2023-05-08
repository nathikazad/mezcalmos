import 'dart:convert';

import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
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
Map<Language, String> toLanguageMap({required List translations}) {
  final Map<Language, String> map = {};
  translations.forEach((element) {
    map[element.language_id.toString().toLanguage()] = element.value;
  });
  return map;
}

ServiceProviderLanguage convertToLanguages(languages) {
  return ServiceProviderLanguage(
    primary: languages.primary.toString().toLanguage(),
    secondary: languages.secondary.toString().toLanguage(),
  );
}

/// Decode a jsonString into a Map<String, dynamic>
T mapFromJson<T>(jsonString) {
  mezDbgPrint("mapFromJson: $jsonString");
  try {
    return jsonDecode(jsonString.toString()) as T;
  } on FormatException {
    return jsonString;
  }
}

/// Stringify a Map object
String mapToJson(map) {
  mezDbgPrint("map =======>$map");
  return jsonEncode(map);
}
