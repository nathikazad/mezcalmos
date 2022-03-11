import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

enum MezPlatform { IOS, ANDROID }

extension PlateformString on MezPlatform {
  String toShortString() {
    return this.toString().toLowerCase().split('.').last;
  }
}

MezPlatform getPlatformType() {
  if (Platform.isAndroid) {
    return MezPlatform.ANDROID;
  } else
    return MezPlatform.IOS;
}

String getPackageName() {
  return GetStorage().read(getxPackageName).toString();
}

String getLocalVersionName() {
  return GetStorage().read(getxAppVersion);
}
