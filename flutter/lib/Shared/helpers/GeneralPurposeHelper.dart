import 'package:intl/intl.dart' show NumberFormat;

/// This calls will contains all the Formatting Stuff
class MezFormatter {
  static final NumberFormat currency = NumberFormat("#,##0.00", "en_US");
}

/// Call this with the _i18n fucntion and the wanted path.
///
/// PS: Path should be separated using . ex: key1.key2.key3
Object? getMapValueFromPath(
    {required Function i18nFunction, required String path}) {
  if (i18nFunction() is! Map<String, dynamic>) return null;
  final int index = path.indexOf('.');
  if (index < 0) return i18nFunction()[path];
  return getMapValueFromPath(
      i18nFunction: () => i18nFunction()[path.substring(0, index)],
      path: path.substring(index + 1));
}
