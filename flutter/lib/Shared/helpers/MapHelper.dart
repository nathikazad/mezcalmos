import 'package:location/location.dart';
import 'dart:math' show cos, sqrt, sin, pi, atan2;

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

    // print(
    //     "[ LOCATION DATA FROM ] -------\n${from.latitude} | ${from.longitude}\n");
    // print(
    //     "[ LOCATION DATA TO ] -------\n${to.latitude} | ${to.longitude}\n\n\n");
    // print(res);

    return res;
  }
}
