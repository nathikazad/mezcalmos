class Geography {
  final double latitude;
  final double longitude;
  Geography(this.latitude, this.longitude);
}

Geography GeographyFromJson(data) {
  final List<dynamic> coordinates = data["coordinates"];
  return Geography(coordinates[0], coordinates[1]);
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
  return double.parse(data.split("\$")[1]);
}

String MoneyToJson(double money) => "$money";
