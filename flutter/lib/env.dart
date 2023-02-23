import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class MezEnv {
  static const AppLaunchMode _appLaunchMode = AppLaunchMode.stage;
  static AppLaunchMode get appLaunchMode => _appLaunchMode;

  static const String _host = "http://127.0.0.1";
  static String get host => _host;

  static const bool _previewMode = false;
  static bool get previewMode => _previewMode;

  static const AppType _appType = AppType.CustomerApp;
  static AppType get appType => _appType;

  static const String _versionNumber = "0.0.0";
  static String get versionNumber => _versionNumber;
}
