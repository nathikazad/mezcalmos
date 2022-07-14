import 'package:flutter/services.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  /// Uppercase the first letter inside a text input
  /// used as an input formatter inside TextFormField or TextField widgets
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalize(newValue.text),
      selection: newValue.selection,
    );
  }
}

String capitalize(String value) {
  if (value.trim().isEmpty) return "";
  return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
}
