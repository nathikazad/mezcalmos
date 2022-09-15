// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
// import 'package:new_version/new_version.dart';
import 'package:store_redirect/store_redirect.dart';
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final String pkgName = getPackageName();
    _newVersion = NewVersion(
      iOSId: pkgName,
      androidId: pkgName, // packageInfo.packageName // 'com.mezcalmos.customer'
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
      mezDbgPrint("[xsaadx] : OnNewUpdateAvailable => $onNewUpdateAvailable");

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
    mezDbgPrint("releaseNotes: ${status?.releaseNotes}");
    mezDbgPrint('appStoreLink: ${status?.appStoreLink}');
    mezDbgPrint('localVersion: ${status?.localVersion}');
    mezDbgPrint('storeVersion: ${status?.storeVersion}');
    mezDbgPrint('canUpdate ${status?.canUpdate.toString()}');
    mezDbgPrint('packageName ${status?.canUpdate.toString()}');
    if (status != null && status.canUpdate) {
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
        androidAppId: getPackageName(),
      );
    });
  }

  void dispose() {
    _versionPeriodicTimer?.cancel();
    _versionPeriodicTimer = null;
  }
}

/// Information about the app's current version, and the most recent version
/// available in the Apple App Store or Google Play Store.
class VersionStatus {
  /// The current version of the app.
  final String localVersion;

  /// The most recent version of the app in the store.
  final String storeVersion;

  /// A link to the app store page where the app can be updated.
  final String appStoreLink;

  /// The release notes for the store version of the app.
  final String? releaseNotes;

  /// Returns `true` if the store version of the application is greater than the local version.
  bool get canUpdate {
    final local = localVersion.split('.').map(int.parse).toList();
    final store = storeVersion.split('.').map(int.parse).toList();

    // Each consecutive field in the version notation is less significant than the previous one,
    // therefore only one comparison needs to yield `true` for it to be determined that the store
    // version is greater than the local version.
    for (var i = 0; i < store.length; i++) {
      // The store version field is newer than the local version.
      if (store[i] > local[i]) {
        return true;
      }

      // The local version field is newer than the store version.
      if (local[i] > store[i]) {
        return false;
      }
    }

    // The local and store versions are the same.
    return false;
  }

  VersionStatus._({
    required this.localVersion,
    required this.storeVersion,
    required this.appStoreLink,
    this.releaseNotes,
  });
}

class NewVersion {
  /// An optional value that can override the default packageName when
  /// attempting to reach the Apple App Store. This is useful if your app has
  /// a different package name in the App Store.
  final String? iOSId;

  /// An optional value that can override the default packageName when
  /// attempting to reach the Google Play Store. This is useful if your app has
  /// a different package name in the Play Store.
  final String? androidId;

  /// Only affects iOS App Store lookup: The two-letter country code for the store you want to search.
  /// Provide a value here if your app is only available outside the US.
  /// For example: US. The default is US.
  /// See http://en.wikipedia.org/wiki/ ISO_3166-1_alpha-2 for a list of ISO Country Codes.
  final String? iOSAppStoreCountry;

  /// An optional value that will force the plugin to always return [forceAppVersion]
  /// as the value of [storeVersion]. This can be useful to test the plugin's behavior
  /// before publishng a new version.
  final String? forceAppVersion;

  NewVersion({
    this.androidId,
    this.iOSId,
    this.iOSAppStoreCountry,
    this.forceAppVersion,
  });

  /// This checks the version status, then displays a platform-specific alert
  /// with buttons to dismiss the update alert, or go to the app store.
  void showAlertIfNecessary({required BuildContext context}) async {
    final VersionStatus? versionStatus = await getVersionStatus();
    if (versionStatus != null && versionStatus.canUpdate) {
      showUpdateDialog(context: context, versionStatus: versionStatus);
    }
  }

  /// This checks the version status and returns the information. This is useful
  /// if you want to display a custom alert, or use the information in a different
  /// way.
  Future<VersionStatus?> getVersionStatus() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (Platform.isIOS) {
      return _getiOSStoreVersion(packageInfo);
    } else if (Platform.isAndroid) {
      return _getAndroidStoreVersion(packageInfo);
    } else {
      debugPrint(
          'The target platform "${Platform.operatingSystem}" is not yet supported by this package.');
    }
  }

  /// This function attempts to clean local version strings so they match the MAJOR.MINOR.PATCH
  /// versioning pattern, so they can be properly compared with the store version.
  String _getCleanVersion(String version) =>
      RegExp(r'\d+\.\d+\.\d+').stringMatch(version) ?? '0.0.0';

  /// iOS info is fetched by using the iTunes lookup API, which returns a
  /// JSON document.
  Future<VersionStatus?> _getiOSStoreVersion(PackageInfo packageInfo) async {
    final id = iOSId ?? packageInfo.packageName;
    final parameters = {"bundleId": "$id"};
    if (iOSAppStoreCountry != null) {
      parameters.addAll({"country": iOSAppStoreCountry!});
    }
    var uri = Uri.https("itunes.apple.com", "/lookup", parameters);
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      debugPrint('Failed to query iOS App Store');
      return null;
    }
    final jsonObj = json.decode(response.body);
    final List results = jsonObj['results'];
    if (results.isEmpty) {
      debugPrint('Can\'t find an app in the App Store with the id: $id');
      return null;
    }
    return VersionStatus._(
      localVersion: _getCleanVersion(packageInfo.version),
      storeVersion:
          _getCleanVersion(forceAppVersion ?? jsonObj['results'][0]['version']),
      appStoreLink: jsonObj['results'][0]['trackViewUrl'],
      releaseNotes: jsonObj['results'][0]['releaseNotes'],
    );
  }

  /// Android info is fetched by parsing the html of the app store page.
  Future<VersionStatus?> _getAndroidStoreVersion(
      PackageInfo packageInfo) async {
    final id = androidId ?? packageInfo.packageName;
    final uri = Uri.https(
        "play.google.com", "/store/apps/details", {"id": "$id", "hl": "en"});
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      debugPrint('Can\'t find an app in the Play Store with the id: $id');
      return null;
    }
    final document = parse(response.body);

    String storeVersion = '0.0.0';
    String? releaseNotes;

    final additionalInfoElements = document.getElementsByClassName('hAyfc');
    if (additionalInfoElements.isNotEmpty) {
      final versionElement = additionalInfoElements.firstWhere(
        (elm) => elm.querySelector('.BgcNfc')!.text == 'Current Version',
      );
      storeVersion = versionElement.querySelector('.htlgb')!.text;

      final sectionElements = document.getElementsByClassName('W4P4ne');
      final releaseNotesElement = sectionElements.firstWhereOrNull(
        (elm) => elm.querySelector('.wSaTQd')!.text == 'What\'s New',
      );
      releaseNotes = releaseNotesElement
          ?.querySelector('.PHBdkd')
          ?.querySelector('.DWPxHb')
          ?.text;
    } else {
      final scriptElements = document.getElementsByTagName('script');
      final infoScriptElement = scriptElements.firstWhere(
        (elm) => elm.text.contains('key: \'ds:5\''),
      );

      final param = infoScriptElement.text
          .substring(20, infoScriptElement.text.length - 2)
          .replaceAll('key:', '"key":')
          .replaceAll('hash:', '"hash":')
          .replaceAll('data:', '"data":')
          .replaceAll('sideChannel:', '"sideChannel":')
          .replaceAll('\'', '"');
      final parsed = json.decode(param);
      final data = parsed['data'];
      print(
          '[MZL]------------------------------------------&&&&&&&&&&&&&&&&&&& ${data[1][2]}');
      print(
          '[MZL]------------------------------------------&&&&&&&&&&&&&&&&&&& ${data[1][2][144]}');
      storeVersion = data[1][2][140][0][0][0];
      releaseNotes = data[1]?[2]?[144]?[1]?[1];
      print(
          '[MZL]------------------------------------------&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& ${storeVersion}');
    }

    return VersionStatus._(
      localVersion: _getCleanVersion(packageInfo.version),
      storeVersion: _getCleanVersion(forceAppVersion ?? storeVersion),
      appStoreLink: uri.toString(),
      releaseNotes: releaseNotes,
    );
  }

  /// Shows the user a platform-specific alert about the app update. The user
  /// can dismiss the alert or proceed to the app store.
  ///
  /// To change the appearance and behavior of the update dialog, you can
  /// optionally provide [dialogTitle], [dialogText], [updateButtonText],
  /// [dismissButtonText], and [dismissAction] parameters.
  void showUpdateDialog({
    required BuildContext context,
    required VersionStatus versionStatus,
    String dialogTitle = 'Update Available',
    String? dialogText,
    String updateButtonText = 'Update',
    bool allowDismissal = true,
    String dismissButtonText = 'Maybe Later',
    VoidCallback? dismissAction,
  }) async {
    final dialogTitleWidget = Text(dialogTitle);
    final dialogTextWidget = Text(
      dialogText ??
          'You can now update this app from ${versionStatus.localVersion} to ${versionStatus.storeVersion}',
    );

    final updateButtonTextWidget = Text(updateButtonText);
    final updateAction = () {
      launchAppStore(versionStatus.appStoreLink);
      if (allowDismissal) {
        Navigator.of(context, rootNavigator: true).pop();
      }
    };

    List<Widget> actions = [
      Platform.isAndroid
          ? TextButton(
              child: updateButtonTextWidget,
              onPressed: updateAction,
            )
          : CupertinoDialogAction(
              child: updateButtonTextWidget,
              onPressed: updateAction,
            ),
    ];

    if (allowDismissal) {
      final dismissButtonTextWidget = Text(dismissButtonText);
      dismissAction = dismissAction ??
          () => Navigator.of(context, rootNavigator: true).pop();
      actions.add(
        Platform.isAndroid
            ? TextButton(
                child: dismissButtonTextWidget,
                onPressed: dismissAction,
              )
            : CupertinoDialogAction(
                child: dismissButtonTextWidget,
                onPressed: dismissAction,
              ),
      );
    }

    await showDialog(
      context: context,
      barrierDismissible: allowDismissal,
      builder: (BuildContext context) {
        return WillPopScope(
            child: Platform.isAndroid
                ? AlertDialog(
                    title: dialogTitleWidget,
                    content: dialogTextWidget,
                    actions: actions,
                  )
                : CupertinoAlertDialog(
                    title: dialogTitleWidget,
                    content: dialogTextWidget,
                    actions: actions,
                  ),
            onWillPop: () => Future.value(allowDismissal));
      },
    );
  }

  /// Launches the Apple App Store or Google Play Store page for the app.
  Future<void> launchAppStore(String appStoreLink) async {
    debugPrint(appStoreLink);
    if (await canLaunch(appStoreLink)) {
      await launch(appStoreLink);
    } else {
      throw 'Could not launch appStoreLink';
    }
  }
}
