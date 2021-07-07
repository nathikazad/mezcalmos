import 'package:geolocator/geolocator.dart';
import 'dart:math' show cos, sqrt, asin;

class MapHelper {
  static double calculateDistance(Position from, Position to) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((from.latitude - to.latitude) * p)/2 + 
          c(to.latitude * p) * c(from.latitude * p) * 
          (1 - c((from.longitude - to.longitude) * p))/2;
    return 12742 * asin(sqrt(a));
  }
}
