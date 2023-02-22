import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';

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
        if (!MezRouter.isCurrentRoute(SharedRoutes.kNoInternetRoute)) {
          unawaited(MezRouter.toNamed<void>(SharedRoutes.kNoInternetRoute));
        }
      } else {
        if (MezRouter.isCurrentRoute(SharedRoutes.kNoInternetRoute)) {
          MezRouter.back<Null>();
        }
      }
    });
  }
}
