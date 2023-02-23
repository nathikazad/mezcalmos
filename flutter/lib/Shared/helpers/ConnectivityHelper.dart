import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

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

  Timer? _internetIsBackTimer;

  Future<void> networkCheck() async {
    mezDbgPrint("NETWORK CHECKER");
    checkForInternet();
    final Connectivity connectivity = Connectivity();
    final ConnectivityResult result = await connectivity.checkConnectivity();
    Connectivity().onConnectivityChanged.listen(checkForInternet);
  }

  void checkForInternet([ConnectivityResult? event]) async {
    bool _hasInternet = await pingServers();
    mezDbgPrint("Has Internet $_hasInternet");

    if (!_hasInternet) {
      if (!isCurrentRoute(kNoInternetRoute)) {
        mezDbgPrint("No internet going so going to no internet page");
        unawaited(MezRouter.toNamed<void>(kNoInternetRoute));
      }
      if (_internetIsBackTimer == null) {
        mezDbgPrint("Starting timer");
        _internetIsBackTimer =
            Timer.periodic(const Duration(seconds: 5), (timer) {
          checkForInternet();
        });
      }
    } else {
      if (isCurrentRoute(kNoInternetRoute)) {
        mezDbgPrint("Internet is back so going to back");
        MezRouter.back<Null>();
      }
      if (_internetIsBackTimer != null) {
        mezDbgPrint("Cancelling timer");
        _internetIsBackTimer?.cancel();
        _internetIsBackTimer = null;
      }
    }
  }

  Future<bool> pingServers() async {
    List<Future<bool>> futures = <Future<bool>>[];
    futures.add(_pingServer(sNetworkCheckUrl1));
    futures.add(_pingServer(sNetworkCheckUrl2));
    final List<bool> results = await Future.wait(futures);
    return results.contains(true);
  }

  Future<bool> _pingServer(String pingUrl) async {
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup(pingUrl);
      return result.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
