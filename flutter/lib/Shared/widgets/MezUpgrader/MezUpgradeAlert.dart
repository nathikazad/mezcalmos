/*
* Created By Mirai Devs.
* On 4/1/2022.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mezcalmos/Shared/widgets/MezUpgrader/MezUpgradeBase.dart';
import 'package:mezcalmos/Shared/widgets/MezUpgrader/MezUpgraderMessage.dart';
import 'package:mezcalmos/Shared/widgets/MezUpgrader/MezUpgraderUtils.dart';

/// A widget to display the upgrade dialog.
class MezUpgradeAlert extends UpgradeBase {
  MezUpgradeAlert({
    Key? key,
    AppcastConfiguration? appcastConfig,
    MezUpgraderMessages? messages,
    bool? debugAlwaysUpgrade,
    bool? debugDisplayOnce,
    bool? debugLogging,
    Duration? durationToAlertAgain,
    BoolCallback? onIgnore,
    BoolCallback? onLater,
    BoolCallback? onUpdate,
    BoolCallback? shouldPopScope,
    http.Client? client,
    bool? showIgnore,
    bool? showLater,
    bool? showReleaseNotes,
    bool? canDismissDialog,
    String? countryCode,
    String? minAppVersion,
    UpgradeDialogStyle? dialogStyle,
  }) : super(
          key: key,
          appcastConfig: appcastConfig,
          messages: messages,
          debugDisplayAlways: debugAlwaysUpgrade,
          debugDisplayOnce: debugDisplayOnce,
          debugLogging: debugLogging,
          durationToAlertAgain: durationToAlertAgain,
          onIgnore: onIgnore,
          onLater: onLater,
          onUpdate: onUpdate,
          shouldPopScope: shouldPopScope,
          client: client,
          showIgnore: showIgnore,
          showLater: showLater,
          showReleaseNotes: showReleaseNotes,
          canDismissDialog: canDismissDialog,
          countryCode: countryCode,
          minAppVersion: minAppVersion,
          dialogStyle: dialogStyle,
        );

  @override
  Widget build(BuildContext context, UpgradeBaseState state) {
    if (MezUpgrader().debugLogging) {
      print('upgrader: build UpgradeAlert');
    }

    return FutureBuilder(
        future: state.initialized,
        builder: (BuildContext context, AsyncSnapshot<bool> processed) {
          if (processed.connectionState == ConnectionState.done &&
              processed.data != null &&
              processed.data!) {
            MezUpgrader().checkVersion(context: context);
          }
          return SizedBox.shrink();
        });
  }

  void show() {}
}
