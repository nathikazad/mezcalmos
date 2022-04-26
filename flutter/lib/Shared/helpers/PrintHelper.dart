// Usefull when trying to make Sizes adptable!
import 'dart:async';
import 'package:intl/intl.dart';

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

// This is to get all kind of exception in our code!
void runMainGuarded(Function runMain) {
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
