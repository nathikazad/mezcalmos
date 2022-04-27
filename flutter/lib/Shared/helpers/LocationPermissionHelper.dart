// ignore_for_file: constant_identifier_names

import 'package:app_settings/app_settings.dart' show AppSettings;

enum LocationPermissionType { Null, Foreground, ForegroundAndBackground }
enum LocationPermissionsStatus {
  /// When the actual Location Service is OFF
  ServiceOff,

  /// When User pressed Deny Foreever
  ForeverDenied,

  /// When user refuse to give us permissions
  Denied,

  /// when the app does not have bg access
  BackgroundAccessDenied,

  /// When The app Enough needed Permissions (depending on our checks)
  Ok
}

Future<void> openLocationSetting() async => AppSettings.openLocationSettings();
