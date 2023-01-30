import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: constant_identifier_names
enum MezPlatform { IOS, ANDROID }

extension PlateformString on MezPlatform {
  String toShortString() => toString().toLowerCase().split('.').last;
}

/// FOR IOS - PROD - to get the save
String getAppStoreId() {
  if (Platform.isIOS && getAppLaunchMode() == AppLaunchMode.prod) {
    return GetStorage().read(getxAppStoreId);
  }
  return getPackageName();
}

MezPlatform getPlatformType() {
  if (Platform.isAndroid) {
    return MezPlatform.ANDROID;
  } else
    return MezPlatform.IOS;
}

String getPackageName() {
  return GetStorage().read<String>(getxPackageName).toString();
}

Future<int> getAndroidSdkVersion() async {
  final AndroidDeviceInfo androidDeviceInfo =
      await DeviceInfoPlugin().androidInfo;
  return androidDeviceInfo.version.sdkInt;
}

String getLocalVersionName() {
  return GetStorage().read(getxAppVersion);
}

String getAppName() {
  return GetStorage().read(getxAppName);
}

Future<void> openOsStore({required Function openIosStoreFunction}) async {
//       startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=" + appPackageName)));
// } catch (android.content.ActivityNotFoundException anfe) {
//     startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("https://play.google.com/store/apps/details?id=" + appPackageName)));

  String uri = "market://details?id=${getPackageName()}";

  if (Platform.isAndroid) {
    try {
      await launch(uri);
    } on PlatformException catch (_) {
      uri = "https://play.google.com/store/apps/details?id=${getPackageName()}";
      unawaited(launch(uri));
    }
    await launch(uri);
  } else {
    openIosStoreFunction();
  }
}
