import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/operatorNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/models/Operators/RestaurantOperator.dart';

class RestaurantOpAuthController extends GetxController {
  Rxn<RestaurantOperator> operator = Rxn();
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();
  RestaurantInfoController _restaurantInfoController =
      Get.find<RestaurantInfoController>();
  OrderController _orderController = Get.find<OrderController>();
  BackgroundNotificationsController _notificationsController =
      Get.find<BackgroundNotificationsController>();
  String? restaurantId;

  RestaurantOperatorState? get restaurantOperatorState => operator.value?.state;
  Stream<RestaurantOperator?> get operatorInfoStream => operator.stream;

  StreamSubscription<Event>? _restaurantOperatorNodeListener;

  bool _checkedAppVersion = false;
  String? _previousStateValue = "init";

  @override
  void onInit() {
    // ------------------------------------------------------------------------
    mezDbgPrint("RestaurantAuthController: init $hashCode");
    mezDbgPrint(
        "RestaurantAuthController: calling handle state change first time");
    setupRestaurantOperator(Get.find<AuthController>().fireAuthUser!);
    super.onInit();
  }

  Future<void> setupRestaurantOperator(User user) async {
    mezDbgPrint("RestaurantAuthController: handle state change user value");
    mezDbgPrint(user);
    // mezDbgPrint(_authController.fireAuthUser);

    mezDbgPrint(
        "RestaurantAuthController: restaurantNode =======>>>>>> init ${operatorStateNode(operatorType: OperatorType.Restaurant, uid: user.uid)}");
    await _restaurantOperatorNodeListener?.cancel();
    _restaurantOperatorNodeListener = null;

    await _databaseHelper.firebaseDatabase
        .reference()
        .child(operatorAuthNode(
            operatorType: OperatorType.Restaurant, uid: user.uid))
        .once()
        .then((DataSnapshot value) => mezDbgPrint(value.value));
    // mezDbgPrint("Listening");
    _restaurantOperatorNodeListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(operatorAuthNode(
            operatorType: OperatorType.Restaurant, uid: user.uid))
        .onValue
        .listen((Event event) async {
      if (event.snapshot.value.toString() == _previousStateValue) {
        return;
      }
      _previousStateValue = event.snapshot.value.toString();

      if (event.snapshot.value != null) {
        operator.value =
            RestaurantOperator.fromData(user.uid, event.snapshot.value);

        saveAppVersionIfNecessary();
        unawaited(saveNotificationToken());
        if (restaurantId != operator.value!.state.restaurantId) {
          // init controllers with new id
          restaurantId = operator.value!.state.restaurantId;
          await _orderController.init(restaurantId!);
          await _restaurantInfoController.init(restaurantId!);
        }
      }
    });
  }

  Future<void> saveNotificationToken() async {
    final String? deviceNotificationToken =
        await _notificationsController.getToken();
    if (deviceNotificationToken != null) {
      unawaited(_databaseHelper.firebaseDatabase
          .reference()
          .child(operatorNotificationInfoNode(
              operatorType: OperatorType.Restaurant,
              uid: _authController.fireAuthUser!.uid))
          .set(<String, String>{
        'deviceNotificationToken': deviceNotificationToken
      }));
    }
  }

  void saveAppVersionIfNecessary() {
    if (_checkedAppVersion == false) {
      final String version = GetStorage().read(getxAppVersion);
      _databaseHelper.firebaseDatabase
          .reference()
          .child(operatorAppVersionNode(
              operatorType: OperatorType.Restaurant,
              uid: _authController.fireAuthUser!.uid))
          .set(version);
      _checkedAppVersion = true;
    }
  }

  @override
  void onClose() {
    mezDbgPrint(
        "[+] RestaurantAuthController::dispose ---------> Was invoked ! $hashCode");

    _restaurantOperatorNodeListener?.cancel();
    _restaurantOperatorNodeListener = null;
    super.onClose();
  }
}
