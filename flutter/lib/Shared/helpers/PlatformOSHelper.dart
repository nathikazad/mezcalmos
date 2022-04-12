import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

// ignore: constant_identifier_names
enum MezPlatform { IOS, ANDROID }

extension PlateformString on MezPlatform {
  String toShortString() => toString().toLowerCase().split('.').last;
}

MezPlatform getPlatformType() {
  if (Platform.isAndroid) {
    return MezPlatform.ANDROID;
  } else
    return MezPlatform.IOS;
}

String? getPackageName({MezPlatform? platform}) {
  final String _packName = GetStorage()
      .read<String>(getxPackageName)
      .toString()
      .replaceFirst('mezstaging', 'mezcalmos');

  switch (platform) {
    case MezPlatform.ANDROID:
      return getPlatformType() == MezPlatform.ANDROID ? _packName : null;
    case MezPlatform.IOS:
      return getPlatformType() == MezPlatform.IOS ? _packName : null;
    default:
      return _packName;
  }
}

String getLocalVersionName() {
  return GetStorage().read(getxAppVersion);
}

String getAppName() {
  return GetStorage().read(getxAppName);
}
