// ignore_for_file: constant_identifier_names

enum OperatorType { Laundry, Restaurant }

extension ParseOrderTypeToString on OperatorType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}
