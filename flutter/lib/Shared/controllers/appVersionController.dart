// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/MezUpdateHelper.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:new_version/new_version.dart';
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

  UpdateType compareSplitVersions({
    required VersionSplit versionToCompare,
  }) {
    if (major != versionToCompare.major) {
      return UpdateType.Major;
    } else if (minor != versionToCompare.minor) {
      return UpdateType.Minor;
    } else if (patches != versionToCompare.patches) {
      return UpdateType.Patches;
    } else {
      /// That means that local version equals store version...
      return UpdateType.Null;
    }
  }

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

typedef void OnNewUpdateAvailable(
  UpdateType appUpdateType,
  VersionStatus status,
);

class AppVersionController {
  Timer? _versionPeriodicTimer;
  final OnNewUpdateAvailable onNewUpdateAvailable;

  AppVersionController({required this.onNewUpdateAvailable});

  /// This init the controller flow, by setting a 3h periodic timer that checks for new version availabality.
  void init({Duration autoUpdatesCheckerDuration = const Duration(hours: 3)}) {
    // call Asyncronously first then start timer
    _checkForNewUpdates();

    /// init timer - check each 3 hours
    _versionPeriodicTimer = Timer.periodic(
      autoUpdatesCheckerDuration,
      (Timer _t) async {
        if (_versionPeriodicTimer == null) {
          _t.cancel();
        }
        await _checkForNewUpdates();
        // execute the callback.
      },
    );
  }

  /// This is a private func , we keep calling it each 3h in `init`
  Future<void> _checkForNewUpdates() async {
    UpdateType _updateType = UpdateType.Null;
    // Instanciating newVersion
    final NewVersion newVersion = NewVersion(
      iOSId: getPackageName(platform: MezPlatform.IOS),
      androidId: getPackageName(
        platform: MezPlatform.ANDROID,
      ), // packageInfo.packageName // 'com.mezcalmos.customer'
    );

    // Get Version Status
    final VersionStatus? status = await newVersion.getVersionStatus();
    if (status != null && status.canUpdate) {
      debugPrint("releaseNotes: ${status.releaseNotes}");
      debugPrint('appStoreLink: ${status.appStoreLink}');
      debugPrint('localVersion: ${status.localVersion}');
      debugPrint('storeVersion: ${status.storeVersion}');
      debugPrint('canUpdate ${status.canUpdate.toString()}');

      // To Know if we can let the user back to the home screen
      // checkUpdateResult.value = true;

      // localVersion
      final VersionSplit _localVersion = VersionSplit.split(
        stringToSplit: status.localVersion,
      );

      // Compare split versions
      _updateType = _localVersion.compareSplitVersions(
        versionToCompare: VersionSplit.split(
          stringToSplit: status.storeVersion,
        ),
      );

      // Check update type
      // processUpdateType(
      //   updateType: _updateType,
      //   releaseNotes: "${status.releaseNotes}",
      //   appName: getAppName(),
      //   packageName: getPackageName()!,
      //   currentInstalledVersion: '${status.localVersion}',
      //   currentAppStoreVersion: '${status.storeVersion}',
      // );
      if (_updateType != UpdateType.Null) {
        // we make sure to set this to true.
        onNewUpdateAvailable.call(_updateType, status);
      }
    }
  }

  /// Returns bool. if the user canUpdate return true, otherwise return false;

  Future<MezAppUpdateResult?> startAppUpdate(UpdateType updateType) async {
    if (Platform.isAndroid) {
      MezAppUpdateResult? _appUpdateResult;

      /// checkForUpdate and get appVersionInfo...
      MezAppUpdateInfo? _versionInfos = await _getNewVersionInfos();

      if (_versionInfos != null &&
          _versionInfos.updateAvailability ==
              MezUpdateAvailability.updateAvailable) {
        /// A new version is being downloaded
        if (updateType == UpdateType.Major) {
          /// Downloading....
          /// Perform immediate update
          // isDownloading.value = true;
          //isDownloading.refresh();
          try {
            _appUpdateResult = await MezInAppUpdate.performImmediateUpdate();
          } catch (e) {
            // keep null
            Get.snackbar(
              'Ops!',
              e.toString(),
              backgroundColor: Colors.grey[300],
            );
          }

          // isDownloading.value = false;
          //isDownloading.refresh();
          // debugPrint('isDownloading.value ${isDownloading.value}');
        } else if (updateType == UpdateType.Minor) {
          /// Downloading....
          /// Start flexible update
          // isDownloading.value = true;
          // startFlexibleUpdate.value = true;
          //isDownloading.refresh();

          try {
            _appUpdateResult = await MezInAppUpdate.startFlexibleUpdate();
          } catch (e) {
            // keep null
            Get.snackbar(
              'Ops!',
              e.toString(),
              backgroundColor: Colors.grey[300],
            );
          }

          // isDownloading.value = false;
          //isDownloading.refresh();
          // startFlexibleUpdate.value = false;
        }

        /// check App Info Result To Force Update
        // checkUpdateResult.value = _checkAppInfoResultToForceUpdate();
        return _appUpdateResult;
      }
    } else if (Platform.isIOS) {
      /// Update Type is Major 100%,
      /// We check the update type is Platform.isIOS and UpdateType,Major. then navigate to this route.
      /// Navigate to app store and get the result
      ///
      await StoreRedirect.redirect(
        iOSAppId: getPackageName(platform: MezPlatform.IOS),
      );

      return MezAppUpdateResult.redirectedToStore;

      /// Returns bool. if the user canUpdate return true, otherwise return false;
      //   final bool canUpdate = await checkForNewUpdates();
      //   if (canUpdate) {
      //     Get.snackbar(
      //       'Attention!',
      //       'There is a new version. Please make sure to update the app',
      //     );
      //   } else {
      //     /// Now we can let the user back to the home screen!
      //     checkUpdateResult.value = false;
      //   }
      // });
    }
    return null;
  }

  /// Platform messages are asynchronous, so we initialize in an async method.
  Future<MezAppUpdateInfo?> _getNewVersionInfos() async {
    try {
      return await MezInAppUpdate.mezCheckForUpdate(
        packageName: getPackageName()!,
      );
    } catch (e) {
      debugPrint('catchError((e)  type ${e.runtimeType.toString()}');
      debugPrint('checkForUpdate: ${e.toString()}');
      Get.snackbar(
        'Ops!',
        e.toString(),
        backgroundColor: Colors.grey[300],
      );

      return null;
    }
  }

  // bool _checkAppInfoResultToForceUpdate(MezAppUpdateResult result) {
  //   if (Platform.isAndroid) {
  //     bool updated = false;
  //     switch (result) {
  //       case MezAppUpdateResult.success:
  //         updated = true;
  //         break;
  //       case MezAppUpdateResult.userDeniedUpdate:
  //       case MezAppUpdateResult.inAppUpdateFailed:
  //         updated = false;
  //     }
  //     if (updateType.value == UpdateType.Major) {
  //       return !updated;
  //     } else if (updateType.value == UpdateType.Minor) {
  //       return !(startFlexibleUpdate.value && updated);
  //     }
  //   }

  //   return false;
  // }

  void dispose() {
    _versionPeriodicTimer?.cancel();
    _versionPeriodicTimer = null;
  }
}
