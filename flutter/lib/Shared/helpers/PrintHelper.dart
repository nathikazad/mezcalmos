// Usefull when trying to make Sizes adptable!
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

void mezDbgPrint(dynamic log) {
  String d = DateFormat('HH:mm:ss').format(DateTime.now());
  String caller = StackTrace.current.toString().split('\n').lastWhere(
      (element) => element.contains(':mezcalmos/'),
      orElse: () => '');

  if (caller != '') caller = caller.split('/').last.replaceAll(')', '');

  log.toString().split('\n').forEach((str) {
    print("[MZL][$caller][$d] $str\n");
  });
}

void mezcalmosLogger(String text, {bool isError = false}) =>
    mezDbgPrint("[MZL][ GETX ] $text");

// This is to get all kind of exception in our code!
runMainGuarded(Function runMain) {
  ScreenUtil.init(BoxConstraints(maxHeight: Get.height, maxWidth: Get.width),
      splitScreenMode: false, minTextAdapt: true);
  runZonedGuarded(() async {
    runMain();
  }, (error, stacktrace) {
    mezDbgPrint("========== [ START MEZ EXCEPTION ] ==========");
    mezDbgPrint("\tError :\n");
    for (var line in error.toString().split("\n")) {
      mezDbgPrint(line);
    }
    mezDbgPrint("\tStackTrace :\n");
    for (var line in stacktrace.toString().split("\n")) {
      mezDbgPrint(line);
    }
    mezDbgPrint("========== [ END MEZ EXCEPTION ] ==========");
  });
}
