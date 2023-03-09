import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appVersionController.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/rootNodes.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/env.dart';
import 'package:url_launcher/url_launcher_string.dart';

// ignore: constant_identifier_names
enum MezPlatform { IOS, ANDROID }

class PlatformOSHelper {
  static late String _packageName;
  static String get getPackageName => _packageName;
  static void setPackageName(String packageName) {
    _packageName = packageName;
  }

  static String _appName = MezEnv.appType.toHasuraString();
  static String get getAppName => _appName;
  static void setAppName(String appName) {
    _appName = appName;
  }

  static String? _appId;
  static String? get getAppId => _appId;
  static void setAppId(String? appId) {
    _appId = appId;
  }

  static String _appVersion = MezEnv.versionNumber;
  static String get getAppVersion => _appVersion;
  static void setAppVersion(String appVersion) {
    _appVersion = appVersion;
  }

  static AppVersionController? _appVersionController;

  static Future<void> setAppInfoGlobals() async {
    final PackageInfo pInfos = await PackageInfo.fromPlatform();
    mezDbgPrint("version number ${pInfos.version}");
    setPackageName(pInfos.packageName);
    setAppName(pInfos.appName);
    setAppVersion(pInfos.version);

    if (Platform.isIOS && MezEnv.appLaunchMode == AppLaunchMode.prod) {
      await setupIosAppStoreId(pInfos.appName);
    }

    // // then check if we're in prod - check appUpdate
    // if (MezEnv.appLaunchMode == AppLaunchMode.prod) {
    //   _appVersionController = AppVersionController.instance(
    //     onNewUpdateAvailable: _onNewUpdateAvailable,
    //   );
    //   // Delayed init of the appVersionController - that way we make sure that the NavigationStack is correct,
    //   // Which makes it easy for us to push NeedUpdateScreen on top in case there is update.
    //   Future<void>.delayed(Duration(seconds: 2), _appVersionController!.init);
    // }
  }

  static Future<void> setupIosAppStoreId(String appName) async {
    final String? res = (await Get.find<FirebaseDb>()
            .firebaseDatabase
            .ref()
            .child(appStoreIdNode(appName))
            .once())
        .snapshot
        .value
        .toString();
    mezDbgPrint("Got setupIosAppStoreId @ ==> $res");
    setAppId(res);
  }

  /// Called each time there is a new update.
  // static void _onNewUpdateAvailable(
  //     UpdateType updateType, VersionStatus status) {
  //   switch (updateType) {
  //     case UpdateType.Null:
  //     case UpdateType.Patches:
  //       MezUpdaterDialog.show(
  //         context: context,
  //         onUpdateClicked: _appVersionController.openStoreAppPage,
  //       );
  //       break;
  //     default:
  //       // Major/Minor - forcing the app to stay in AppNeedsUpdate
  //       MezRouter.toNamed<void>(
  //         SharedRoutes.kAppNeedsUpdate,
  //         arguments: <String, dynamic>{
  //           "versionStatus": status,
  //         },
  //       );
  //   }
  // }
}

extension PlateformString on MezPlatform {
  String toShortString() => toString().toLowerCase().split('.').last;
}

/// FOR IOS - PROD - to get the save
String? getAppStoreId() {
  if (Platform.isIOS && MezEnv.appLaunchMode == AppLaunchMode.prod) {
    return PlatformOSHelper.getAppId;
  }
  return PlatformOSHelper.getPackageName;
}

MezPlatform getPlatformType() {
  if (Platform.isAndroid) {
    return MezPlatform.ANDROID;
  } else
    return MezPlatform.IOS;
}

Future<int> getAndroidSdkVersion() async {
  final AndroidDeviceInfo androidDeviceInfo =
      await DeviceInfoPlugin().androidInfo;
  return androidDeviceInfo.version.sdkInt;
}

Future<void> openOsStore({required Function openIosStoreFunction}) async {
//       startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=" + appPackageName)));
// } catch (android.content.ActivityNotFoundException anfe) {
//     startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("https://play.google.com/store/apps/details?id=" + appPackageName)));

  String uri = "market://details?id=${PlatformOSHelper.getPackageName}";

  if (Platform.isAndroid) {
    try {
      await launchUrlString(uri);
    } on PlatformException catch (_) {
      uri =
          "https://play.google.com/store/apps/details?id=${PlatformOSHelper.getPackageName}";
      unawaited(launchUrlString(uri));
    }
    await launchUrlString(uri);
  } else {
    openIosStoreFunction();
  }
}
