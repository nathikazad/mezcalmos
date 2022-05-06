// ignore_for_file: constant_identifier_names

import 'dart:async';
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
  late final NewVersion _newVersion;
  NewVersion get newVersionInstance => _newVersion;
// this is tom implement singleton instead of using GetxController just to use Get.find ..
  static AppVersionController? _instance;

  /// never call thos from outside

  AppVersionController._internal() {
    // intanciating our NewVersion.
    _newVersion = NewVersion(
      iOSId: getPackageName(platform: MezPlatform.IOS),
      androidId: getPackageName(
        platform: MezPlatform.ANDROID,
      ), // packageInfo.packageName // 'com.mezcalmos.customer'
    );
  }

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
      _instance = AppVersionController._internal()
        ..onNewUpdateAvailable = onNewUpdateAvailable!;
    }

    return _instance!;
  }

  /// This init the controller flow, by setting a 3h periodic timer that checks for new version availabality.
  void init({Duration autoUpdatesCheckerDuration = const Duration(hours: 3)}) {
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

  /// This is a private func , we keep calling it each 3h in `init`
  Future<void> _checkForNewUpdates() async {
    UpdateType _updateType = UpdateType.Null;
    // Get Version Status
    final VersionStatus? status = await _newVersion.getVersionStatus();
    mezDbgPrint("_checkForNewUpdates->status: $status");

    if (status != null && status.canUpdate) {
      mezDbgPrint("releaseNotes: ${status.releaseNotes}");
      mezDbgPrint('appStoreLink: ${status.appStoreLink}');
      mezDbgPrint('localVersion: ${status.localVersion}');
      mezDbgPrint('storeVersion: ${status.storeVersion}');
      mezDbgPrint('canUpdate ${status.canUpdate.toString()}');
      mezDbgPrint('packageName ${status.canUpdate.toString()}');

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

      mezDbgPrint("_updateType -> $_updateType");

      if (_updateType != UpdateType.Null) {
        // we make sure to set this to true.
        onNewUpdateAvailable.call(_updateType, status);
      }
    }
  }

  /// Launch the appStore depending on which Platform!
  Future<void> openStoreAppPage() async {
    await openOsStore(openIosStoreFunction: () async {
      await StoreRedirect.redirect(
        iOSAppId: getAppStoreId(),
        androidAppId: getPackageName(platform: getPlatformType()),
      );
    });
  }

  void dispose() {
    _versionPeriodicTimer?.cancel();
    _versionPeriodicTimer = null;
  }
}
