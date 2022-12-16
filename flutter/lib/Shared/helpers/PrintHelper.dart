// Usefull when trying to make Sizes adptable!
import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';

void mezDbgPrint(dynamic log, {bool showMilliSeconds = false}) {
  String d = DateFormat('HH:mm:ss').format(DateTime.now());
  String caller = StackTrace.current.toString().split('\n').lastWhere(
        (String element) => element.contains(':mezcalmos/'),
        orElse: () => '',
      );

  if (caller.isNotEmpty) caller = caller.split('/').last.replaceAll(')', '');

  log.toString().split('\n').forEach((str) {
    if (showMilliSeconds) {
      d += ":${DateTime.now().millisecondsSinceEpoch}";
    }

    print("[MZL][$caller][$d] $str\n");
  });
}

void mezcalmosLogger(String text, {bool isError = false}) =>
    mezDbgPrint("[MZL][ GETX ] $text");

void logCrashes({required String crashInfos}) {
  final MainUserInfo? user = Get.find<FirbaseAuthController>().user;
  if (user != null && getAppLaunchMode() == AppLaunchMode.prod) {
    Get.find<FirebaseDb>()
        .firebaseDatabase
        .ref()
        .child('/crashes/${user.id}/${DateTime.now().millisecondsSinceEpoch}/')
        .set(
      <String, dynamic>{
        "platform": Platform.operatingSystem,
        "app": getAppName(),
        "version": getLocalVersionName(),
        "details": crashInfos
      },
    );
  }
}

// This is to get all kind of exception in our code!
void runMainGuarded(Function runMain) {
  runZonedGuarded(() async {
    runMain();
  }, (error, stacktrace) {
    List<String> crashInfo = [];

    mezDbgPrint("========== [ START MEZ EXCEPTION ] ==========");
    mezDbgPrint("\tError :\n");
    for (var line in error.toString().split("\n")) {
      crashInfo.add(line);
      mezDbgPrint(line);
    }
    crashInfo.add("\n\nStackTrace:\n\n");
    mezDbgPrint("\tStackTrace :\n");
    for (var line in stacktrace.toString().split("\n")) {
      crashInfo.add(line);
      mezDbgPrint(line);
    }
    logCrashes(crashInfos: crashInfo.join('\n'));
    mezDbgPrint("========== [ END MEZ EXCEPTION ] ==========");
  });
}
