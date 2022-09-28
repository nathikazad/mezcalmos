import 'package:flutter/services.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalizeAllWordsInFullSentence(newValue.text),
      // text: capitalizeAllWordsInFullSentence(newValue.text),
      selection: newValue.selection,
    );
  }
}

String capitalizeAllWordsInFullSentence(String str) {
  int i;
  String constructedString = "";
  for (i = 0; i < str.length; i++) {
    if (i == 0) {
      constructedString += str[0].toUpperCase();
    } else if (str[i - 1] == ' ') {
      // mandatory to have index>1 !
      constructedString += str[i].toUpperCase();
    } else {
      constructedString += str[i];
    }
  }
  // print('constructed: $constructedString');
  return constructedString;
}

String capitalize1Word(String value) {
  if (value.trim().isEmpty) return "";
  return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
}
