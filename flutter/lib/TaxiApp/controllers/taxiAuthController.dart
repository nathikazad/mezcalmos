import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/helpers/databaseHelper.dart';
import 'package:mezcalmos/TaxiApp/models/TaxiDriver.dart';
// import 'package:mezcalmos/TaxiApp/controllers/orderController.dart';

class TaxiAuthController extends GetxController {
  Rxn<TaxiDriver> _model = Rxn<TaxiDriver>();
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();

  String? get currentOrderId => _model.value?.currentOrder ?? null;
  bool? get authorizedTaxi => _model.value?.isAuthorized ?? false;
  bool? get isLooking => _model.value?.isLooking ?? false;

  late StreamSubscription<Event> _taxiAuthListener;

  @override
  void onInit() async {
    super.onInit();

    print(_authController.user);
    if (_authController.user != null) {
      _taxiAuthListener = _databaseHelper.firebaseDatabase
          .reference()
          .child(taxiAuthNode(_authController.user?.uid ?? ''))
          .onValue
          .listen((event) {
        _model.value = TaxiDriver.fromJson(event.snapshot.value);
      });
    }
  }

  void detachListeners() {
    _taxiAuthListener
        .cancel()
        .then((value) => print(
            "A listener was disposed on TaxiAuthController::detachListeners !"))
        .catchError((err) => print(
            "Error happend while trying to dispose TaxiAuthController::detachListeners !"));
  }

  @override
  void dispose() {
    detachListeners();
    super.dispose();
    print("--------------------> OrderController Auto Disposed !");
  }
}
