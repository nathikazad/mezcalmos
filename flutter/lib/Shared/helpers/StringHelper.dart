import 'package:get/get.dart';

extension CapExtension on String {
  String get inCaps =>
      (length > 0) ? '${this[0].toUpperCase()}${substring(1)}' : '';
  String get allInCaps => toUpperCase();
  String get capitalizeFirstofEach =>
      split(" ").map((String str) => str.capitalize).join(" ");
}

/// This Generates the first letters of the first 2 words in a String,
///
/// Ex : Mezcalmos Admin => MA
extension TwoLettersGenerator on String {
  String generateTwoFirstLetters() {
    String imageString = '';
    if (isNotEmpty) {
      final List<String> _split = split(" ");
      for (int i = 0; i < _split.length; i++) {
        if (i < 2 && _split[i].isNotEmpty) {
          imageString += _split[i][0];
        } else {
          break;
        }
      }
    }
    return imageString.toUpperCase();
  }
}
