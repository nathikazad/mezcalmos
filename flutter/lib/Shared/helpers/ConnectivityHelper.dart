// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:dart_ping/dart_ping.dart';

enum InternetStatus { Online, Slow, Offline }

class ConnectivityHelper {
  ConnectivityHelper._privateConstructor();

  static final ConnectivityHelper _instance =
      ConnectivityHelper._privateConstructor();

  static ConnectivityHelper get instance => _instance;

  final List<ConnectivityResult> _hasInternetOptions = [
    ConnectivityResult.mobile,
    ConnectivityResult.wifi,
    ConnectivityResult.ethernet,
  ];

  static late StreamController<InternetStatus> _internetStatusStreamController;

  static Stream<InternetStatus> get internetStatusStream =>
      _internetStatusStreamController.stream;

  AppLaunchMode _appLaunchMode = AppLaunchMode.prod;

  Future<void> networkCheck() async {
    _internetStatusStreamController =
        StreamController<InternetStatus>.broadcast();
    mezDbgPrint("NETWORK CHECKER");
    const String _tmpLmode =
        String.fromEnvironment('LMODE', defaultValue: "prod");
    _appLaunchMode = _tmpLmode.toLaunchMode();
    _internetStatusStreamController.add(await checkForInternet());
    Timer.periodic(const Duration(seconds: 10), (timer) async {
      try {
        _internetStatusStreamController.add(await checkForInternet());
      } catch (e) {
        _internetStatusStreamController.add(InternetStatus.Offline);
      }
    });
    Connectivity().onConnectivityChanged.listen((c) async {
      _internetStatusStreamController.add(await checkForInternet());
    });
  }

  Future<InternetStatus> checkForInternet([ConnectivityResult? event]) async {
    List<Future<bool>> futures = <Future<bool>>[];
    futures.add(_pingServer(sNetworkCheckUrl1));
    futures.add(_pingServer(firebaseDbUrl));
    futures.add(_pingServer(hasuraDbUrl));
    if (_appLaunchMode == AppLaunchMode.prod)
      futures.add(_pingServer(firebaseFunctionsProdUrl));
    else if (_appLaunchMode == AppLaunchMode.stage)
      futures.add(_pingServer(firebaseFunctionsStageUrl));
    final Stopwatch stopwatch = Stopwatch()..start();
    final List<bool> results = await Future.wait(futures)
        .timeout(Duration(seconds: 5), onTimeout: () => <bool>[false]);
    // mezDbgPrint('ping() executed in ${stopwatch.elapsed.inMilliseconds}');
    if (results.contains(true)) {
      if (stopwatch.elapsed.inMilliseconds < 3000)
        return InternetStatus.Online;
      else
        return InternetStatus.Slow;
    } else {
      return InternetStatus.Offline;
    }
  }

  Future<bool> _pingServer(String pingUrl) async {
    try {
      final Ping result = Ping('google.com', count: 5);

      return result.toString().isNotEmpty;
      // final List<InternetAddress> result =
      //     await InternetAddress.lookup(pingUrl);
      // return result.isNotEmpty;
      // @abhishek
      // figure out a different way to ping maybe network_check package
      // also check it works when user is not signed
      return Future<bool>.delayed(Duration.zero, () => true);
    } on SocketException catch (_) {
      return false;
    }
  }
}
