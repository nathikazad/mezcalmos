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
    _internetStatusStreamController.add(await checkForInternet());
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) async {
      try {
        _internetStatusStreamController.add(await checkForInternet());
      } catch (e) {
        _internetStatusStreamController.add(InternetStatus.Offline);
      }
    });
    Connectivity().onConnectivityChanged.listen((ConnectivityResult c) async {
      _internetStatusStreamController.add(await checkForInternet());
    });
  }

  Future<InternetStatus> checkForInternet([ConnectivityResult? event]) async {
    List<Future<bool>> futures = <Future<bool>>[
      _pingServer(sNetworkCheckUrl1),
      _pingServer(firebaseDbUrl),
      _pingServer(hasuraDbUrl),
      MezEnv.appLaunchMode == AppLaunchMode.prod
          ? _pingServer(firebaseFunctionsProdUrl)
          : _pingServer(firebaseFunctionsStageUrl)
    ];
    final Stopwatch stopwatch = Stopwatch()..start();
    final List<bool> results = await Future.wait(futures)
        .timeout(Duration(seconds: 5), onTimeout: () => <bool>[false]);
    if (results.contains(false)) {
      return InternetStatus.Offline;
    } else {
      if (stopwatch.elapsed.inMilliseconds < 3000)
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
