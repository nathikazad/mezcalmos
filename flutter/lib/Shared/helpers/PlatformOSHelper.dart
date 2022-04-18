import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

// ignore: constant_identifier_names
enum MezPlatform { IOS, ANDROID }

extension PlateformString on MezPlatform {
  String toShortString() => toString().toLowerCase().split('.').last;
}

/// FOR IOS - PROD - to get the save
String? getAppStoreId() {
  if (Platform.isIOS && GetStorage().read<String>(getxLmodeKey) == "prod") {
    return GetStorage().read<String?>(getxAppStoreId);
  }
  return null;
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

Future<int> getAndroidSdkVersion() async {
  final AndroidDeviceInfo androidDeviceInfo =
      await DeviceInfoPlugin().androidInfo;
  return androidDeviceInfo.version.sdkInt!;
}

String getLocalVersionName() {
  return GetStorage().read(getxAppVersion);
}

String getAppName() {
  return GetStorage().read(getxAppName);
}
