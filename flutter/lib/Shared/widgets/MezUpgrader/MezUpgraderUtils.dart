/*
* Created By Mirai Devs.
* On 4/1/2022.
*/

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mezcalmos/Shared/widgets/MezUpgrader/MezAppcast.dart';
import 'package:mezcalmos/Shared/widgets/MezUpgrader/MezUpgraderMessage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

/// Signature of callbacks that have no arguments and return bool.
typedef BoolCallback = bool Function();

/// There are two different dialog styles: Cupertino and Material
enum UpgradeDialogStyle { cupertino, material }

/// A class to define the configuration for the appcast. The configuration
/// contains two parts: a URL to the appcast, and a list of supported OS
/// names, such as "android", "ios".
class AppCastConfiguration {
  final List<String>? supportedOS;
  final String? url;

  AppCastConfiguration({
    this.supportedOS,
    this.url,
  });
}

/// A singleton class to configure the upgrade dialog.
class MezUpgrade {
  static MezUpgrade _singleton = MezUpgrade._internal();

  /// The appcast configuration ([AppCastConfiguration]) used by [Appcast].
  /// When an appcast is configured for iOS, the iTunes lookup is not used.
  AppCastConfiguration? appCastConfig;

  /// Provide an Appcast that can be replaced for mock testing.
  Appcast? appCast;

  /// Provide an HTTP Client that can be replaced for mock testing.
  http.Client? client = http.Client();

  /// Duration until alerting user again
  Duration durationUntilAlertAgain = const Duration(days: 3);

  /// For debugging, always force the upgrade to be available.
  bool debugDisplayAlways = true;

  /// For debugging, display the upgrade at least once once.
  bool debugDisplayOnce = false;

  /// Enable print statements for debugging.
  bool debugLogging = false;

  /// The localized messages used for display in upgrader.
  MezUpgraderMessages? messages;

  final String notInitializedExceptionMessage =
      'initialize() not called. Must be called first.';

  /// Called when the ignore button is tapped or otherwise activated.
  /// Return false when the default behavior should not execute.
  BoolCallback? onIgnore;

  /// Called when the later button is tapped or otherwise activated.
  /// Return false when the default behavior should not execute.
  BoolCallback? onLater;

  /// Called when the update button is tapped or otherwise activated.
  /// Return false when the default behavior should not execute.
  BoolCallback? onUpdate;

  /// Called when the user taps outside of the dialog and [canDismissDialog]
  /// is false. Also called when the back button is pressed. Return true for
  /// the screen to be popped. Not used by [UpgradeCard].
  BoolCallback? shouldPopScope;

  /// Hide or show Ignore button on dialog (default: true)
  bool showIgnore = true;

  /// Hide or show Later button on dialog (default: true)
  bool showLater = true;

  /// Hide or show release notes (default: true)
  bool showReleaseNotes = true;

  /// The upgrade dialog style. Optional. Used only on UpgradeAlert. (default: material)
  UpgradeDialogStyle? dialogStyle = UpgradeDialogStyle.material;

  /// The target platform.
  TargetPlatform platform = defaultTargetPlatform;

  String? _appStoreVersion;
  String? _appStoreListingURL;

  String? _updateAvailable;
  DateTime? _lastTimeAlerted;
  String? _lastVersionAlerted;
  String? _userIgnoredVersion;

  factory MezUpgrade() {
    return _singleton;
  }

  MezUpgrade._internal();

  Future<bool> initialize() async {
    messages ??= MezUpgraderMessages();
    await _getSavedPrefs();

    return true;
  }

  String message() {
    String msg = messages!.message(UpgraderMessage.body)!;
    msg = msg.replaceAll('{{appName}}', 'app Name');
    msg =
        msg.replaceAll('{{currentAppStoreVersion}}', 'currentAppStoreVersion');
    msg = msg.replaceAll(
        '{{currentInstalledVersion}}', 'currentInstalledVersion');
    return msg;
  }

  /// Only called by [UpgradeAlert].
  Widget checkVersion({required BuildContext context}) {
    return WillPopScope(
      onWillPop: () async => false,
      child: dialogStyle == UpgradeDialogStyle.material
          ? _alertDialog(
              messages!.message(UpgraderMessage.title)!,
              message(),
              '_releaseNotes',
              context,
            )
          : _cupertinoAlertDialog(
              messages!.message(UpgraderMessage.title)!,
              message(),
              '_releaseNotes',
              context,
            ),
    );
    // Future.delayed(
    //   const Duration(milliseconds: 0),
    //   () {
    //     _showDialog(
    //       context: context,
    //       title: messages!.message(UpgraderMessage.title),
    //       message: message(),
    //       releaseNotes: '_releaseNotes',
    //       canDismissDialog: true,
    //     );
    //   },
    // );
  }

  void _showDialog({
    required BuildContext context,
    required String? title,
    required String message,
    required String? releaseNotes,
    required bool canDismissDialog,
  }) {
    showDialog(
      barrierDismissible: canDismissDialog,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: dialogStyle == UpgradeDialogStyle.material
              ? _alertDialog(title!, message, releaseNotes, context)
              : _cupertinoAlertDialog(title!, message, releaseNotes, context),
        );
      },
    );
  }

  AlertDialog _alertDialog(
    String title,
    String message,
    String? releaseNotes,
    BuildContext context,
  ) {
    Widget? notes;
    if (releaseNotes != null) {
      notes = Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Release Notes:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              releaseNotes,
              maxLines: 15,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    }
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(message),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(messages!.message(UpgraderMessage.prompt)!),
            ),
            if (notes != null) notes,
          ],
        ),
      ),
      actions: <Widget>[
        if (showIgnore)
          TextButton(
            child: Text(
              messages!.message(UpgraderMessage.buttonTitleIgnore)!,
            ),
            onPressed: () => onUserIgnored(context, true),
          ),
        if (showLater)
          TextButton(
            child: Text(
              messages!.message(UpgraderMessage.buttonTitleLater)!,
            ),
            onPressed: () => onUserLater(context, true),
          ),
        TextButton(
          child: Text(
            messages!.message(UpgraderMessage.buttonTitleUpdate)!,
          ),
          onPressed: () => onUserUpdated(context, true),
        ),
      ],
    );
  }

  CupertinoAlertDialog _cupertinoAlertDialog(
    String title,
    String message,
    String? releaseNotes,
    BuildContext context,
  ) {
    Widget? notes;
    if (releaseNotes != null) {
      notes = Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Release Notes:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              releaseNotes,
              maxLines: 14,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    }
    return CupertinoAlertDialog(
      title: Text(title),
      content: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(message),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(messages!.message(UpgraderMessage.prompt)!),
          ),
          if (notes != null) notes,
        ],
      ),
      actions: <Widget>[
        if (showIgnore)
          CupertinoDialogAction(
            child: Text(messages!.message(UpgraderMessage.buttonTitleIgnore)!),
            onPressed: () => onUserIgnored(context, true),
          ),
        if (showLater)
          CupertinoDialogAction(
            child: Text(messages!.message(UpgraderMessage.buttonTitleLater)!),
            onPressed: () => onUserLater(context, true),
          ),
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text(messages!.message(UpgraderMessage.buttonTitleUpdate)!),
          onPressed: () => onUserUpdated(context, true),
        ),
      ],
    );
  }

  void onUserIgnored(BuildContext context, bool shouldPop) {
    // If this callback has been provided, call it.
    bool doProcess = true;
    if (onIgnore != null) {
      doProcess = onIgnore!();
    }

    if (shouldPop) {
      Navigator.of(context).pop();
      if (Get.isDialogOpen!) {
        Get.back();
      }
    }
  }

  void onUserLater(BuildContext context, bool shouldPop) {
    // If this callback has been provided, call it.
    bool doProcess = true;
    if (onLater != null) {
      doProcess = onLater!();
    }

    if (shouldPop) {
      Navigator.of(context).pop();
      if (Get.isDialogOpen!) {
        Get.back();
      }
    }
  }

  void onUserUpdated(BuildContext context, bool shouldPop) {
    if (debugLogging) {
      print('upgrader: button tapped: update now');
    }

    // If this callback has been provided, call it.
    bool doProcess = true;
    if (onUpdate != null) {
      doProcess = onUpdate!();
    }

    if (doProcess) {
      _sendUserToAppStore();
    }

    if (shouldPop) {
      Navigator.of(context).pop();
      if (Get.isDialogOpen!) {
        Get.back();
      }
    }
  }

  Future<bool> clearSavedSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userIgnoredVersion');
    await prefs.remove('lastTimeAlerted');
    await prefs.remove('lastVersionAlerted');

    _userIgnoredVersion = null;
    _lastTimeAlerted = null;
    _lastVersionAlerted = null;

    return true;
  }

  Future<bool> _saveIgnored() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    _userIgnoredVersion = _appStoreVersion;
    await prefs.setString('userIgnoredVersion', _userIgnoredVersion!);
    return true;
  }

  Future<bool> saveLastAlerted() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _lastTimeAlerted = DateTime.now();
    await prefs.setString('lastTimeAlerted', _lastTimeAlerted.toString());

    _lastVersionAlerted = _appStoreVersion;
    await prefs.setString('lastVersionAlerted', _lastVersionAlerted!);

    return true;
  }

  Future<bool> _getSavedPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? lastTimeAlerted = prefs.getString('lastTimeAlerted');
    if (lastTimeAlerted != null) {
      _lastTimeAlerted = DateTime.parse(lastTimeAlerted);
    }

    _lastVersionAlerted = prefs.getString('lastVersionAlerted');

    _userIgnoredVersion = prefs.getString('userIgnoredVersion');

    return true;
  }

  void _sendUserToAppStore() async {
    if (_appStoreListingURL == null || _appStoreListingURL!.isEmpty) {
      if (debugLogging) {
        print('upgrader: empty _appStoreListingURL');
      }
      return;
    }

    if (debugLogging) {
      print('upgrader: launching: $_appStoreListingURL');
    }

    if (await canLaunch(_appStoreListingURL!)) {
      try {
        await launch(_appStoreListingURL!);
      } catch (e) {
        if (debugLogging) {
          print('upgrader: launch to app store failed: $e');
        }
      }
    }
  }
}
