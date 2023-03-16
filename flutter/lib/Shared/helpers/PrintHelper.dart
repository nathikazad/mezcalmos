// Usefull when trying to make Sizes adptable!
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/env.dart';

void mezDbgPrint(log, {bool showMilliSeconds = false}) {
  String d = DateFormat('HH:mm:ss').format(DateTime.now());
  String caller = StackTrace.current.toString().split('\n').lastWhere(
        (String element) => element.contains(':mezcalmos/'),
        orElse: () => '',
      );

  if (caller.isNotEmpty) caller = caller.split('/').last.replaceAll(')', '');

  log.toString().split('\n').forEach((String str) {
    if (showMilliSeconds) {
      d += ":${DateTime.now().millisecondsSinceEpoch}";
    }

    print("[MZL][$caller][$d] $str\n");
  });
}

void logLongString(String s) {
  if (s.length <= 0) return;
  const int n = 700;
  int startIndex = 0;
  int endIndex = n;
  while (startIndex < s.length) {
    if (endIndex > s.length) endIndex = s.length;
    mezDbgPrint(s.substring(startIndex, endIndex) + "\n --END -- \n");
    startIndex += n;
    endIndex = startIndex + n;
  }
}

void logToken(String s) {
  s.split(".").forEach((String element) {
    mezDbgPrint(element);
  });
}

void mezcalmosLogger(String text, {bool isError = false}) =>
    mezDbgPrint("[MZL][ GETX ] $text");

void logCrashes({required String crashInfos}) {
  final UserInfo? user = Get.find<AuthController>().user;
  if (user != null && MezEnv.appLaunchMode == AppLaunchMode.prod) {
    Get.find<FirebaseDb>()
        .firebaseDatabase
        .ref()
        .child(
            '/crashes/${user.firebaseId}/${DateTime.now().millisecondsSinceEpoch}/')
        .set(
      <String, dynamic>{
        "platform": kIsWeb ? "Web" : Platform.operatingSystem,
        "app": PlatformOSHelper.getAppName,
        "version": PlatformOSHelper.getAppVersion,
        "details": crashInfos
      },
    );
  }
}

// This is to get all kind of exception in our code!
void runMainGuarded(Function runMain) {
  runZonedGuarded(() async {
    runMain();
  }, (Object error, StackTrace stacktrace) {
    final List<String> crashInfo = [];

    mezDbgPrint("========== [ START MEZ EXCEPTION ] ==========");
    mezDbgPrint("\tError :\n");
    for (String line in error.toString().split("\n")) {
      crashInfo.add(line);
      mezDbgPrint(line);
    }
    crashInfo.add("\n\nStackTrace:\n\n");
    mezDbgPrint("\tStackTrace :\n");
    for (String line in stacktrace.toString().split("\n")) {
      crashInfo.add(line);
      mezDbgPrint(line);
    }
    logCrashes(crashInfos: crashInfo.join('\n'));
    mezDbgPrint("========== [ END MEZ EXCEPTION ] ==========");
  });
}

void throwError(error) {
  throw Exception(" ======🛑 Error 🛑=====  \n $error   ");
}
