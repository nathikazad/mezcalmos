// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/MezUpdateHelper.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
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

  UpdateType compareVersions({
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
  late final OnNewUpdateAvailable onNewUpdateAvailable;
// this is tom implement singleton instead of using GetxController just to use Get.find ..
  static AppVersionController? _instance;
  // AppVersionController({required this.onNewUpdateAvailable});
  AppVersionController._internal();

  /// This is a Singleton Class, Basically upon a first-time Instanciation, onNewUpdateAvailable is required,
  ///
  /// if AppVersionController have never been instanciated before, and onNewUpdateAvailable was null, An assertion error will be thrown.
  ///
  /// In case AppVersionController was already Instanciated before, you dont have to pass onNewUpdateAvailable.
  static AppVersionController instance({
    OnNewUpdateAvailable? onNewUpdateAvailable,
  }) {
    if (_instance == null) {
      assert(onNewUpdateAvailable != null);
      _instance = AppVersionController._internal();
      _instance!.onNewUpdateAvailable = onNewUpdateAvailable!;
    }
    return _instance!;
  }

  /// This init the controller flow, by setting a 3h periodic timer that checks for new version availabality.
  void init(
      {Duration autoUpdatesCheckerDuration = const Duration(minutes: 10)}) {
    // to avoid Multi '_checkForNewUpdates' Execution.
    assert(autoUpdatesCheckerDuration.inMinutes >= 10);
    // call Asyncronously first then start timer
    _checkForNewUpdates();

    /// init timer - check each 3 hours
    _versionPeriodicTimer = Timer.periodic(
      autoUpdatesCheckerDuration,
      (Timer _t) {
        if (_versionPeriodicTimer == null) {
          _t.cancel();
        }
        _checkForNewUpdates();
        // execute the callback.
      },
    );
  }

  /// Call this to check once if there is any Updates Available,
  ///
  /// through [_isUpdateAvailable().canUpdate]
  Future<VersionStatus?> _isUpdateAvailable() async {
    // Instanciating newVersion
    final NewVersion newVersion = NewVersion(
      iOSId: getPackageName(platform: MezPlatform.IOS),
      androidId: getPackageName(
        platform: MezPlatform.ANDROID,
      ), // packageInfo.packageName // 'com.mezcalmos.customer'
    );

    // Get Version Status
    final VersionStatus? status = await newVersion.getVersionStatus();
    return status;
  }

  /// This is a private func , we keep calling it each 3h in `init`
  Future<void> _checkForNewUpdates() async {
    UpdateType _updateType = UpdateType.Null;
    // Get Version Status
    final VersionStatus? status = await _isUpdateAvailable();

    if (status != null && status.canUpdate) {
      debugPrint("releaseNotes: ${status.releaseNotes}");
      debugPrint('appStoreLink: ${status.appStoreLink}');
      debugPrint('localVersion: ${status.localVersion}');
      debugPrint('storeVersion: ${status.storeVersion}');
      debugPrint('canUpdate ${status.canUpdate.toString()}');
      debugPrint('packageName ${status.canUpdate.toString()}');

      // localVersion
      final VersionSplit _localVersion = VersionSplit.split(
        stringToSplit: status.localVersion,
      );

      // Compare split versions
      _updateType = _localVersion.compareVersions(
        versionToCompare: VersionSplit.split(
          stringToSplit: status.storeVersion,
        ),
      );

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
      final MezAppUpdateInfo? _versionInfos = await _getNewVersionInfos();
      mezDbgPrint("startAppUpdate ==> _versionInfos => $_versionInfos");
      if (_versionInfos != null &&
          _versionInfos.updateAvailability ==
              MezUpdateAvailability.updateAvailable) {
        mezDbgPrint("startAppUpdate ==> 1st if => $_versionInfos");

        if (updateType == UpdateType.Major) {
          try {
            mezDbgPrint(
                "startAppUpdate ==> updateType == UpdateType.Major => $updateType");

            _appUpdateResult = await MezInAppUpdate.performImmediateUpdate();
          } catch (e) {
            // keep null
            Get.snackbar(
              'Ops!',
              e.toString(),
              backgroundColor: Colors.grey[300],
            );
          }
        } else if (updateType == UpdateType.Minor) {
          mezDbgPrint(
              "startAppUpdate ==> updateType == UpdateType.Minor => $updateType");

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
        }
        mezDbgPrint(
            "startAppUpdate ==> returnung == _appUpdateResult => $_appUpdateResult");
        return _appUpdateResult;
      }
    } else if (Platform.isIOS) {
      mezDbgPrint("startAppUpdate ==> isIOS");

      await StoreRedirect.redirect(
        iOSAppId: getPackageName(platform: MezPlatform.IOS),
      );

      return MezAppUpdateResult.redirectedToStore;
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

  void dispose() {
    _versionPeriodicTimer?.cancel();
    _versionPeriodicTimer = null;
  }
}
