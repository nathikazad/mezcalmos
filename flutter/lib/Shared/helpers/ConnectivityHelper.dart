import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
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

  bool _hasInternet = false;
  bool _pingedConnection = false;

  bool get hasInternet => _hasInternet;

  Future<void> networkCheck() async {
    final Connectivity connectivity = Connectivity();
    final ConnectivityResult result = await connectivity.checkConnectivity();
    _hasInternet = _hasInternetOptions.contains(result);

    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult event) async {
      _hasInternet = _hasInternetOptions.contains(event);
      if (_hasInternet) {
        try {
          final List<InternetAddress> result =
              await InternetAddress.lookup(sNetworkCheckUrl);
          _pingedConnection = result.isNotEmpty;
        } on SocketException catch (_) {
          _pingedConnection = false;
        }
        _hasInternet = _pingedConnection;
      }

      if (!_hasInternet) {
        if (!isCurrentRoute(kNoInternetRoute)) {
          MezRouter.toNamed<void>(kNoInternetRoute);
        }
      } else {
        if (isCurrentRoute(kNoInternetRoute)) {
          Get.back();
        }
      }
    });
  }
}
