import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mezcalmos/Shared/widgets/MezUpgrader/MezUpgraderMessage.dart';
import 'package:mezcalmos/Shared/widgets/MezUpgrader/MezUpgraderUtils.dart';

/*
* Created By Mirai Devs.
* On 4/1/2022.
*/

class UpgradeBase extends StatefulWidget {
  /// The appcast configuration ([AppcastConfiguration]) used by [Appcast].
  final AppcastConfiguration? appcastConfig;

  /// The localized messages used for display in MezUpgrader.
  final MezUpgraderMessages? messages;

  /// For debugging, always force the upgrade to be available.
  final bool? debugDisplayAlways;

  /// For debugging, display the upgrade at least once once.
  final bool? debugDisplayOnce;

  /// For debugging, display logging statements.
  final bool? debugLogging;

  /// Duration until alerting user again after later.
  Duration get durationToAlertAgain => MezUpgrader().durationUntilAlertAgain;

  /// Called when the ignore button is tapped or otherwise activated.
  /// Return false when the default behavior should not execute.
  final BoolCallback? onIgnore;

  /// Called when the ignore button is tapped or otherwise activated.
  /// Return false when the default behavior should not execute.
  final BoolCallback? onLater;

  /// Called when the ignore button is tapped or otherwise activated.
  /// Return false when the default behavior should not execute.
  final BoolCallback? onUpdate;

  /// Called when the user taps outside of the dialog and [canDismissDialog]
  /// is false. Also called when the back button is pressed. Return true for
  /// the screen to be popped. Not used by [UpgradeCard].
  final BoolCallback? shouldPopScope;

  /// Provide an HTTP Client that can be replaced for mock testing.
  final http.Client? client;

  /// Hide or show Ignore button on dialog (default: true)
  final bool? showIgnore;

  /// Hide or show Later button on dialog (default: true)
  final bool? showLater;

  /// Hide or show release notes (default: true)
  final bool? showReleaseNotes;

  /// Can alert dialog be dismissed on tap outside of the alert dialog. Not used by [UpgradeCard]. (default: false)
  final bool? canDismissDialog;

  /// The country code that will override the system locale. Optional. Used only for iOS.
  final String? countryCode;

  /// The minimum app version supported by this app. Earlier versions of this app
  /// will be forced to update to the current version. Optional.
  final String? minAppVersion;

  /// The upgrade dialog style. Optional. Used only on UpgradeAlert. (default: material)
  final UpgradeDialogStyle? dialogStyle;

  UpgradeBase({
    Key? key,
    this.appcastConfig,
    this.messages,
    this.debugDisplayAlways = false,
    this.debugDisplayOnce = false,
    this.debugLogging = false,
    Duration? durationToAlertAgain = const Duration(days: 3),
    this.onIgnore,
    this.onLater,
    this.onUpdate,
    this.shouldPopScope,
    this.client,
    this.showIgnore,
    this.showLater,
    this.showReleaseNotes,
    this.canDismissDialog,
    this.countryCode,
    this.minAppVersion,
    this.dialogStyle = UpgradeDialogStyle.material,
  }) : super(key: key) {
    if (appcastConfig != null) {
      MezUpgrader().appcastConfig = appcastConfig;
    }
    if (messages != null) {
      MezUpgrader().messages = messages;
    }
    if (client != null) {
      MezUpgrader().client = client;
    }
    if (debugDisplayAlways != null) {
      MezUpgrader().debugDisplayAlways = debugDisplayAlways!;
    }
    if (debugDisplayOnce != null) {
      MezUpgrader().debugDisplayOnce = debugDisplayOnce!;
    }
    if (debugLogging != null) {
      MezUpgrader().debugLogging = debugLogging!;
    }
    if (durationToAlertAgain != null) {
      MezUpgrader().durationUntilAlertAgain = durationToAlertAgain;
    }
    if (onIgnore != null) {
      MezUpgrader().onIgnore = onIgnore;
    }
    if (onLater != null) {
      MezUpgrader().onLater = onLater;
    }
    if (onUpdate != null) {
      MezUpgrader().onUpdate = onUpdate;
    }
    if (shouldPopScope != null) {
      MezUpgrader().shouldPopScope = shouldPopScope;
    }
    if (showIgnore != null) {
      MezUpgrader().showIgnore = showIgnore!;
    }
    if (showLater != null) {
      MezUpgrader().showLater = showLater!;
    }
    if (showReleaseNotes != null) {
      MezUpgrader().showReleaseNotes = showReleaseNotes!;
    }
    if (canDismissDialog != null) {
      MezUpgrader().canDismissDialog = canDismissDialog!;
    }
    if (countryCode != null) {
      MezUpgrader().countryCode = countryCode;
    }
    if (minAppVersion != null) {
      MezUpgrader().minAppVersion = minAppVersion;
    }
    if (dialogStyle != null) {
      MezUpgrader().dialogStyle = dialogStyle;
    }
  }

  Widget? build(BuildContext context, UpgradeBaseState state) {
    return null;
  }

  @override
  UpgradeBaseState createState() => UpgradeBaseState();
}

class UpgradeBaseState extends State<UpgradeBase> {
  final _initialized = MezUpgrader().initialize();

  Future<bool> get initialized => _initialized;

  @override
  Widget build(BuildContext context) => widget.build(context, this)!;

  void forceUpdateState() {
    setState(() {});
  }
}
