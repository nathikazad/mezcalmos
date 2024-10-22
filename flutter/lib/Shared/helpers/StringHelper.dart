import 'dart:math';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

/// This Generates the first letters of the first 2 words in a String,
///
/// Ex : Mezcalmos Admin => MA

Language get userLanguage => Get.find<LanguageController>().userLanguageKey;
String getRandomString(int length) {
  const String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}

extension StringHelper on String {
  String toPlural({required bool isPlural}) {
    return this + (isPlural ? 's' : '');
  }

  bool validatePhoneNumber() {
    // Define the regular expression for a valid phone number
    final RegExp regex = RegExp(r'^\+?\d{10,12}$');

    // Check if the phone number matches the regular expression
    return regex.hasMatch(this);
  }

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

  String removeLast() {
    String str = this;
    if (length > 0) {
      str = str.substring(0, str.length - 1);
    }
    return str;
  }

  String get inCaps =>
      (length > 0) ? '${this[0].toUpperCase()}${substring(1)}' : '';
  String get unCapFirst =>
      (length > 0) ? '${this[0].toLowerCase()}${substring(1)}' : '';
  String get allInCaps => toUpperCase();
  String get capitalizeFirstofEach =>
      split(" ").map((String str) => str.capitalize).join(" ");
  String get capitalizeDays =>
      split("-").map((String str) => str.capitalize).join("-");

  String get capitalizeMonthAfterDay => replaceFirst(
      this[indexOf(' ') + 1], this[indexOf(' ') + 1].toUpperCase());
}
