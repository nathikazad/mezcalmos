import 'package:location/location.dart';
import 'dart:math' show cos, sqrt, asin;

class MapHelper {
  static double calculateDistance(LocationData from, LocationData to) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((from.latitude ?? 0 - to.latitude!) * p) / 2 +
        c(to.latitude! * p) *
            c(from.latitude! * p) *
            (1 - c((from.longitude! - to.longitude!) * p)) /
            2;
    double res = ((12742 * asin(sqrt(a))) / 1000);

    return res;
  }
}
