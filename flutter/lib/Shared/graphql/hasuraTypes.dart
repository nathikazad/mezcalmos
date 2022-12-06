import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class Geography {
  final double latitude;
  final double longitude;
  Geography(this.latitude, this.longitude);
}

Geography GeographyFromJson(data) {
  final List<dynamic> cors = data["coordinates"];

  mezDbgPrint(
      "🥵🥵🥵🥵 Data coming to geaography ${data["coordinates"][0].runtimeType}\n ${data["coordinates"][1].runtimeType} \n $cors");
  final double test = double.parse(cors[0].toString());
  final double testTwo = double.parse(cors[1].toString());
  return Geography(test, testTwo);
}

dynamic GeographyToJson(Geography geography) => <String, dynamic>{
      "type": "Point",
      "crs": {
        "type": "name",
        "properties": {"name": "urn:ogc:def:crs:EPSG::4326"}
      },
      "coordinates": [geography.latitude, geography.longitude]
    };

double MoneyFromJson(String data) {
  final String str = data.split('\$').last.replaceAll(",", "");

  return double.parse(str);
}

String MoneyToJson(double money) => "$money";

/// Accepts a translations array (from hasura) and return a language map object
// ignore: avoid_annotating_with_dynamic
Map<LanguageType, String> toLanguageMap({required List translations}) {
  final Map<LanguageType, String> map = {};
  translations.forEach((element) {
    map[element.language_id.toString().toLanguageType()] = element.value;
  });
  return map;
}
