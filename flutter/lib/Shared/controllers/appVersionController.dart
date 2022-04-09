import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezUpgrader/MezUpgraderWidget.dart';
import 'package:mezcalmos/Utils/mez_in_app_update.dart';
import 'package:new_version/new_version.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:store_redirect/store_redirect.dart';

class VersionSplit {
  final String major;
  final String minor;
  final String patches;

  const VersionSplit({
    required this.major,
    required this.minor,
    required this.patches,
  });

  factory VersionSplit.split({
    required String stringToSplit,
    Pattern pattern = '.',
  }) {
    final List<String> list = stringToSplit.split(pattern); // [1.5.1}
    if (list.length == 3) {
      return VersionSplit(
        major: list.first,
        minor: list[1],
        patches: list.last,
      );
    } else {
      return VersionSplit(
        major: 'Unknown',
        minor: 'Unknown',
        patches: 'Unknown',
      );
    }
  }

  @override
  String toString() {
    return 'VersionSplit{major: $major, minor: $minor, patches: $patches}';
  }
}

enum UpdateType {
  Major,
  Minor,
  Patches,
  Null,
}

class AppVersionController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  Timer? _versionPeriodicTimer;
  Rx<UpdateType> needsUpdate = UpdateType.Null.obs;

  /// AppUpdateInfo
  Rx<MezAppUpdateInfo?> appVersionInfo = Rx<MezAppUpdateInfo?>(null);

  /// Get Version Status
  Rx<VersionStatus?> status = Rx<VersionStatus?>(null);
  Rx<UpdateType> updateType = Rx<UpdateType>(UpdateType.Null);
  Rx<AppUpdateResult> appUpdateResult =
      Rx<AppUpdateResult>(AppUpdateResult.inAppUpdateFailed);

  /// this is only used inside AppNeedUpdate Screen
  RxBool startFlexibleUpdate = false.obs;
  RxBool isDownloading = false.obs;

  /// Check update result
  /// if checkUpdateResult.value == true, then force the user to update the app.
  /// if checkUpdateResult.value == false, let the user back to home screen!.
  ValueNotifier<bool> checkUpdateResult = ValueNotifier<bool>(false);

  /// Platform messages are asynchronous, so we initialize in an async method.
  Future<void> checkForUpdate() async {
    await MezInAppUpdate.mezCheckForUpdate(
      packageName: 'com.mezcalmos.customer',
    ).then((MezAppUpdateInfo info) {
      appVersionInfo.value = info;
      appVersionInfo.refresh();
    }).catchError((e) {
      debugPrint('catchError((e)  type ${e.runtimeType.toString()}');
      debugPrint('checkForUpdate: ${e.toString()}');
      Get.snackbar(
        'Ops!',
        e.toString(),
        backgroundColor: Colors.grey[300],
      );
    });
  }

  UpdateType compareSplitVersions({
    required VersionSplit first,
    required VersionSplit second,
  }) {
    if (first.major != second.major) {
      return UpdateType.Major;
    } else if (first.minor != second.minor) {
      return UpdateType.Minor;
    } else if (first.patches != second.patches) {
      return UpdateType.Patches;
    } else {
      /// That's mean that local version equals store version...
      return UpdateType.Null;
    }
  }

  void checkUpdateType({
    required UpdateType updateType,
    required String releaseNotes,
    required String appName,
    required String packageName,
    required String currentAppStoreVersion,
    required String currentInstalledVersion,
  }) {
    debugPrint('updateType: ${updateType.toString()}');
    switch (updateType) {
// 			- if major :
// 				- IOS : full screen w fiha button -> appStore (link).
// 				- Android : full Screen w fiha button ->
// 					- package:in_app_update -> performImmediateUpdate
      case UpdateType.Major:
        Get.toNamed<void>(kAppNeedsUpdate);
        // MezUpgrade.show(
        //   releaseNotes: releaseNotes,
        //   appName: appName,
        //   packageName: packageName,
        //   currentAppStoreVersion: currentAppStoreVersion,
        //   currentInstalledVersion: currentInstalledVersion,
        // );
        break;
      case UpdateType.Minor:
        if (Platform.isAndroid) {
          Get.toNamed<void>(kAppNeedsUpdate);
        } else if (Platform.isIOS) {
          MezUpgrade.show(
            releaseNotes: releaseNotes,
            appName: appName,
            packageName: packageName,
            currentAppStoreVersion: currentAppStoreVersion,
            currentInstalledVersion: currentInstalledVersion,
          );
        }
        break;
      case UpdateType.Patches:
        if (Platform.isIOS) {
// 				- iOS : we show a dismissible alert dialog (user can cancel) - with link to app page on app store
          MezUpgrade.show(
            releaseNotes: releaseNotes,
            appName: appName,
            packageName: packageName,
            currentAppStoreVersion: currentAppStoreVersion,
            currentInstalledVersion: currentInstalledVersion,
          );
        } else if (Platform.isAndroid) {
// 				- android : we show a dismissible (user can cancel) alert with button (onPress) -> executes : package:in_app_update:startFlexibleUpdate() ->
// 					which runs completeFlexibleUpdate()  upon complete.
          /// Complete flexible update
          InAppUpdate.completeFlexibleUpdate().then((_) {
            debugPrint("Success!");
          }).catchError((e) {
            debugPrint("Error:completeFlexibleUpdate ${e.toString()}");
          });
        }
        break;
      case UpdateType.Null:
      default:
    }
  }

  /// Returns bool. if the user canUpdate return true, otherwise return false;
  Future<bool> initTheNewVersion() async {
    bool canUpdate = false;

    /// PackageInfo
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    /// Instantiate NewVersion manager object (Using GCP Console app as example)
    debugPrint("------------------- NewVersion ------------------------");
    final String packageName = packageInfo.packageName.contains('mezstaging')
        ? packageInfo.packageName.replaceFirst('mezstaging', 'mezcalmos')
        : 'com.mezcalmos.customer';
    final NewVersion newVersion = NewVersion(
      iOSId: packageName,
      androidId:
          packageName, // packageInfo.packageName // 'com.mezcalmos.customer'
    );

    debugPrint(
      "-------------------Start advancedStatusCheck ------------------------",
    );

    /// Get Version Status
    status.value = await newVersion.getVersionStatus();
    status.refresh();
    if (status.value != null) {
      debugPrint("releaseNotes: ${status.value?.releaseNotes}");
      debugPrint('appStoreLink: ${status.value?.appStoreLink}');
      debugPrint('localVersion: ${status.value?.localVersion}');
      debugPrint('storeVersion: ${status.value?.storeVersion}');
      debugPrint('canUpdate ${status.value?.canUpdate.toString()}');
      if (status.value!.canUpdate) {
        canUpdate = true;

        /// To Know if we can let the user back to the home screen
        checkUpdateResult.value = true;

        /// localVersion
        final VersionSplit localVersionSplit = VersionSplit.split(
          stringToSplit: status.value!.localVersion,
        );
        debugPrint('localVersionSplit: ${localVersionSplit.toString()}');

        /// storeVersion
        final VersionSplit storeVersionSplit = VersionSplit.split(
          stringToSplit: status.value!.storeVersion,
        );
        debugPrint('storeVersionSplit: ${storeVersionSplit.toString()}');

        /// Compare split versions
        updateType.value = compareSplitVersions(
          first: localVersionSplit,
          second: storeVersionSplit,
        );

        /// Check update type
        checkUpdateType(
          updateType: updateType.value,
          releaseNotes: "${status.value?.releaseNotes}",
          appName: packageInfo.appName,
          packageName: packageInfo.packageName,
          currentInstalledVersion: '${status.value?.localVersion}',
          currentAppStoreVersion: '${status.value?.storeVersion}',
        );
      }
    } else {
      debugPrint("getVersionStatus: null");
    }
    debugPrint(
      "------------------- End advancedStatusCheck ------------------------",
    );
    return canUpdate;
  }

  Future<bool> checkForUpdateTypeAndPlatForm() async {
    if (Platform.isAndroid) {
      /// checkForUpdate and get appVersionInfo...
      await checkForUpdate();
      if (appVersionInfo.value != null &&
          appVersionInfo.value!.updateAvailability ==
              UpdateAvailability.updateAvailable) {
        /// A new version is being downloaded
        if (updateType.value == UpdateType.Major) {
          /// Downloading....
          /// Perform immediate update
          isDownloading.value = true;
          //isDownloading.refresh();
          appUpdateResult.value =
              await InAppUpdate.performImmediateUpdate().catchError((e) {
            Get.snackbar(
              'Ops!',
              e.toString(),
              backgroundColor: Colors.grey[300],
            );
          });
          isDownloading.value = false;
          //isDownloading.refresh();
          debugPrint('isDownloading.value ${isDownloading.value}');
        } else if (updateType.value == UpdateType.Minor) {
          /// Downloading....
          /// Start flexible update
          isDownloading.value = true;
          startFlexibleUpdate.value = true;
          //isDownloading.refresh();
          appUpdateResult.value =
              await InAppUpdate.startFlexibleUpdate().catchError((e) {
            Get.snackbar(
              'Ops!',
              e.toString(),
              backgroundColor: Colors.grey[300],
            );
          });

          isDownloading.value = false;
          //isDownloading.refresh();
          // startFlexibleUpdate.value = false;
        }

        /// check App Info Result To Force Update
        checkUpdateResult.value = _checkAppInfoResultToForceUpdate();
      }
    } else if (Platform.isIOS) {
      /// Update Type is Major 100%,
      /// We check the update type is Platform.isIOS and UpdateType,Major. then navigate to this route.
      /// Navigate to app store and get the result
      await StoreRedirect.redirect(
        //androidAppId: "com.mezcalmos.customer",
        iOSAppId: "1595882320",
      ).then((_) async {
        /// Returns bool. if the user canUpdate return true, otherwise return false;
        final bool canUpdate = await initTheNewVersion();
        if (canUpdate) {
          Get.snackbar(
            'Attention!',
            'There is a new version. Please make sure to update the app',
          );
        } else {
          /// Now we can let the user back to the home screen!
          checkUpdateResult.value = false;
        }
      });
    }
    return false;
  }

  bool _checkAppInfoResultToForceUpdate() {
    if (Platform.isAndroid) {
      bool updated = false;
      switch (appUpdateResult.value) {
        case AppUpdateResult.success:
          updated = true;
          break;
        case AppUpdateResult.userDeniedUpdate:
        case AppUpdateResult.inAppUpdateFailed:
          updated = false;
      }
      if (updateType.value == UpdateType.Major) {
        return !updated;
      } else if (updateType.value == UpdateType.Minor) {
        return !(startFlexibleUpdate.value && updated);
      }
    }

    return false;
  }

  @override
  void onInit() {
    //  get the package name ex : com.mezcalmos.customer
    final String packageName = getPackageName();

    // At start we set it to the same as current
    final String platform =
        getPlatformType().toShortString(); // returns 'ios' 'android'
    mezDbgPrint("s@a@a@d : packageName $packageName");
    mezDbgPrint("s@a@a@d : platform $platform");
    mezDbgPrint("s@a@a@d : Listening on  version/$packageName-$platform");

    /// init timer
    _versionPeriodicTimer = Timer.periodic(
      Duration(hours: 3),
      (Timer _t) async {
        if (_versionPeriodicTimer == null) {
          _t.cancel();
        }
        await initTheNewVersion();
      },
    );
    // _versionListener = _databaseHelper.firebaseDatabase
    //     .reference()
    //     .child("version/$packageName-$platform")
    //     .onValue
    //     .distinct()
    //     .listen((appUpdateInfos) {
    //   mezDbgPrint("s@a@a@d : GOT IT   ");

    //   dynamic payload = appUpdateInfos.snapshot.value;
    //   mezDbgPrint("s@a@a@d : remoteUpdateInfos $payload");

    //   if (payload != null) {
    //     appVersionInfos.value = AppUpdate.fromSnapshotData(payload);
    //   }
    // });
    super.onInit();
  }

  @override
  void onClose() {
    _versionPeriodicTimer?.cancel();
    _versionPeriodicTimer = null;
    super.onClose();
  }
}
