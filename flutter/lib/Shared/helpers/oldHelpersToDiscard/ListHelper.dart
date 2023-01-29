import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

extension ListHelper on List {
  bool listEqual<T>(List<T>? b) {
    if (this == null) {
      return b == null;
    }
    if (b == null || length != b.length) {
      return false;
    }
    if (identical(this, b)) {
      return true;
    }
    for (int index = 0; index < length; index += 1) {
      if (this[index] != b[index]) {
        mezDbgPrint("Mez List Equality => Index changed $index");
        return false;
      }
    }
    return true;
  }
}
