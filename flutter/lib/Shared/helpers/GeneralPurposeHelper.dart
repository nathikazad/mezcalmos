import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

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

enum AppLaunchMode { prod, dev, stage }

extension AppLaunchModeParser on String {
  /// if couldn't parse it returns dev as default
  AppLaunchMode toLaunchMode({AppLaunchMode defaultLmode = AppLaunchMode.dev}) {
    mezDbgPrint("Called [toLaunchMode] on $this ");
    return AppLaunchMode.values.firstWhere(
      (AppLaunchMode v) =>
          v.toString().toLowerCase().split('.').last == toLowerCase(),
      orElse: () => defaultLmode,
    );
  }
}

extension AppLaunchModeConverter on AppLaunchMode {
  /// if couldn't parse it returns dev as default
  String toShortString() {
    return toString().toLowerCase().split('.').last;
  }
}

AppLaunchMode getAppLaunchMode() {
  return (GetStorage().read<String>(getxLmodeKey).toString()).toLaunchMode();
}
