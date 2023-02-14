import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
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

  bool get hasInternet => _hasInternet;

  Future<void> networkCheck() async {
    final Connectivity connectivity = Connectivity();
    final ConnectivityResult result = await connectivity.checkConnectivity();
    _hasInternet = _hasInternetOptions.contains(result);
    Connectivity().onConnectivityChanged.listen((ConnectivityResult event) {
      _hasInternet = _hasInternetOptions.contains(event);
      if (!_hasInternet) {
        MezRouter.toNamed<void>(kNoInternetRoute);
      }
    });
  }

  Future<void> tryAgain() async {
    if (_hasInternet) {
      Get.back();
    }
  }
}
