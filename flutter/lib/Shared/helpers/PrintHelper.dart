// Usefull when trying to make Sizes adptable!
import 'dart:async';

import 'package:amplitude_flutter/amplitude.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/env.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void mezlog(log, {bool showMilliseconds = false}) {
  final String timeStamp = DateFormat('HH:mm:ss').format(DateTime.now());
  String caller = StackTrace.current
      .toString()
      .split('\n')
      .lastWhere(
        (String element) => element.contains('mezcalmos/'),
        orElse: () => '',
      )
      .split("                           ")[0];

  if (caller.isNotEmpty) {
    caller = caller.split('/').last.replaceAll(')', '');
  }

  final List<String> logLines = log.toString().split('\n');

  mezDbgPrint('===================================');
  mezDbgPrint('🌟 MezLog 🌟');
  mezDbgPrint('👉 Caller: $caller');
  mezDbgPrint('⏰ Timestamp: $timeStamp');

  for (final String line in logLines) {
    final String formattedLine = '[MZL][$caller][$timeStamp] $line';
    print(formattedLine);
  }

  if (showMilliseconds) {
    final int milliseconds = DateTime.now().millisecondsSinceEpoch;
    mezDbgPrint('Milliseconds: $milliseconds');
  }

  mezDbgPrint('===================================');
}

void mezDbgPrint(log, {bool showMilliSeconds = false}) {
  String d = DateFormat('HH:mm:ss').format(DateTime.now());
  String caller = StackTrace.current
      .toString()
      .split('\n')
      .lastWhere(
        (String element) => element.contains('mezcalmos/'),
        orElse: () => '',
      )
      .split("                           ")[0];

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
    mezDbgPrint(s.substring(startIndex, endIndex));
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

void logCrashes(Object error, StackTrace? stacktrace) {
  mezDbgPrint("🔴 Logging crash $error");
  mezDbgPrint("🔴 $stacktrace");
  if (MezEnv.appLaunchMode == AppLaunchMode.prod) {
    Sentry.captureException(
      error,
      stackTrace: stacktrace,
    );
  }
}

void logEventToServer(String message, {Map<String, dynamic>? debugData}) {
  if (MezEnv.appLaunchMode == AppLaunchMode.prod) {
    Sentry.addBreadcrumb(
      Breadcrumb(message: message, type: "debug", data: debugData),
    );
    Amplitude.getInstance().logEvent(message, eventProperties: debugData);
    mezDbgPrint("🍞🍞🍞🍞 $message");
  }
}

// This is to get all kind of exception in our code!
void runMainGuarded(Function runMain) {
  runZonedGuarded(() async {
    runMain();
  }, (Object error, StackTrace stacktrace) {
    // FirebaseCrashlytics.instance.recordError(error, stacktrace);
    Sentry.captureException(
      error,
      stackTrace: stacktrace,
    );
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
    // logCrashes(crashInfos: crashInfo.join('\n'));
    mezDbgPrint("========== [ END MEZ EXCEPTION ] ==========");
  });
}

void throwError(error) {
  throw Exception(" ======🛑 Error 🛑=====  \n $error   ");
}

void runMainGuardedWithSentry(Function runMain) {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SentryFlutter.init(
      (SentryFlutterOptions options) {
        options.dsn =
            'https://40855a9cdecd4413a253cb845876cc4d@o4505547552718848.ingest.sentry.io/4505547567071232';
        options.tracesSampleRate = 1.0;
      },
      appRunner: runMain(),
    );
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
    logCrashes(error, stacktrace);
    mezDbgPrint("========== [ END MEZ EXCEPTION ] ==========");
  });
}
