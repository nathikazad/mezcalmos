// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/env_example.dart';

enum InternetStatus { Online, Slow, Offline }

class ConnectivityHelper {
  ConnectivityHelper._privateConstructor();

  static final ConnectivityHelper _instance =
      ConnectivityHelper._privateConstructor();

  static ConnectivityHelper get instance => _instance;

  // static late StreamController<InternetStatus> _internetStatusStreamController;
  static StreamController<InternetStatus> _internetStatusStreamController =
      StreamController<InternetStatus>.broadcast();

  static Stream<InternetStatus> get internetStatusStream =>
      _internetStatusStreamController.stream;
  Timer? _timer;
  Future<void> startCheckingInternet() async {
    // _internetStatusStreamController =
    // StreamController<InternetStatus>.broadcast();
    mezDbgPrint("NETWORK CHECKER");
    // ignore: unawaited_futures
    checkConnectivity();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult c) async {
      _internetStatusStreamController.add(await checkForInternet());
    });
  }

  Future<void> checkConnectivity() async {
    mezDbgPrint("Checking connectivity");
    bool onlineMode = true;
    try {
      final InternetStatus internetStatus = await checkForInternet();
      mezDbgPrint(internetStatus);
      _internetStatusStreamController.add(internetStatus);
      onlineMode = internetStatus != InternetStatus.Offline;
    } catch (e) {
      _internetStatusStreamController.add(InternetStatus.Offline);
      onlineMode = false;
    }
    _timer?.cancel();
    _timer = Timer(Duration(seconds: (onlineMode) ? 10 : 1), checkConnectivity);
  }

  Future<InternetStatus> checkForInternet([ConnectivityResult? event]) async {
    final List<Future<bool>> futures = <Future<bool>>[
      _pingServer(sNetworkCheckUrl1),
      _pingServer(firebaseDbUrl),
      _pingServer(hasuraDbUrl),
      MezEnv.appLaunchMode == AppLaunchMode.prod
          ? _pingServer(firebaseFunctionsProdUrl)
          : _pingServer(firebaseFunctionsStageUrl)
    ];
    final Stopwatch stopwatch = Stopwatch()..start();
    final List<bool> results = await Future.wait(futures)
        .timeout(Duration(seconds: 10), onTimeout: () => <bool>[false]);
    if (results.contains(false)) {
      return InternetStatus.Offline;
    } else {
      mezDbgPrint(stopwatch.elapsed.inMilliseconds);
      if (stopwatch.elapsed.inMilliseconds < 5000)
        return InternetStatus.Online;
      else
        return InternetStatus.Slow;
    }
  }

  Future<bool> _pingServer(String pingUrl) async {
    try {
      await http.get(Uri.parse(pingUrl));
      return Future<bool>.delayed(Duration.zero, () => true);
    } catch (e) {
      mezDbgPrint(e);
      return false;
    }
  }
}
