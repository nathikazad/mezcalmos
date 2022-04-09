import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/operatorNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/LaundryOperator.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';

class LaundryOpAuthController extends GetxController {
  Rxn<LaundryOperator> operator = Rxn();
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();
  LaundryInfoController _laundryInfoController =
      Get.find<LaundryInfoController>();
  OrderController _orderController = Get.find<OrderController>();
  BackgroundNotificationsController _notificationsController =
      Get.find<BackgroundNotificationsController>();
  String? laundryId;

  LaundryOperatorState? get laundryOperatorState => operator.value?.state;
  Stream<LaundryOperator?> get operatorInfoStream => operator.stream;

  StreamSubscription<Event>? _LaundryOperatorNodeListener;

  bool _checkedAppVersion = false;
  String? _previousStateValue = "init";

  @override
  void onInit() {
    // ------------------------------------------------------------------------
    mezDbgPrint("LaundryAuthController: init $hashCode");
    mezDbgPrint(
        "LaundryAuthController: calling handle state change first time");
    setupLaundryOperator(Get.find<AuthController>().fireAuthUser!);
    super.onInit();
  }

  Future<void> setupLaundryOperator(User user) async {
    mezDbgPrint("LaundryAuthController: handle state change user value");
    mezDbgPrint(user);
    // mezDbgPrint(_authController.fireAuthUser);

    mezDbgPrint(
        "LaundryAuthController: laundryNode =======>>>>>> init ${operatorStateNode(operatorType: OperatorType.Laundry, uid: user.uid)}");
    await _LaundryOperatorNodeListener?.cancel();
    _LaundryOperatorNodeListener = null;

    await _databaseHelper.firebaseDatabase
        .reference()
        .child(
            operatorAuthNode(operatorType: OperatorType.Laundry, uid: user.uid))
        .once()
        .then((value) => mezDbgPrint(value.value));
    // mezDbgPrint("Listening");
    _LaundryOperatorNodeListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(
            operatorAuthNode(operatorType: OperatorType.Laundry, uid: user.uid))
        .onValue
        .listen((Event event) async {
      mezDbgPrint(
          "[++++++ = === ==] LaundryAuthController$hashCode: _LaundryOperatorStateNodeListener event => ${event.snapshot.value}");
      if (event.snapshot.value.toString() == _previousStateValue) {
        mezDbgPrint(
            'LaundryAuthController:: same state event fired again, skipping it');
        return;
      }
      _previousStateValue = event.snapshot.value.toString();

      if (event.snapshot.value != null) {
        mezDbgPrint(event.snapshot.value);
        operator.value =
            LaundryOperator.fromData(user.uid, event.snapshot.value);

        mezDbgPrint(
            "/////////////////////////////////////////////${operator.value?.toJson()}////////////////////////////////////////////////////");

        saveAppVersionIfNecessary();
        unawaited(saveNotificationToken());
        if (laundryId != operator.value!.state.laundryId) {
          // init controllers with new id
          laundryId = operator.value!.state.laundryId;
          await _orderController.init(laundryId!);
          await _laundryInfoController.init(laundryId!);
        }
      }
    });
  }

  Future<void> saveNotificationToken() async {
    mezDbgPrint(
        "LaundryAuthController  Messaging Token>> ${await _notificationsController.getToken()}");
    final String? deviceNotificationToken =
        await _notificationsController.getToken();
    if (deviceNotificationToken != null) {
      unawaited(_databaseHelper.firebaseDatabase
          .reference()
          .child(operatorNotificationInfoNode(
              operatorType: OperatorType.Laundry,
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
              operatorType: OperatorType.Laundry,
              uid: _authController.fireAuthUser!.uid))
          .set(version);
      _checkedAppVersion = true;
    }
  }

  @override
  void onClose() {
    mezDbgPrint(
        "[+] LaundryAuthController::dispose ---------> Was invoked ! $hashCode");

    _LaundryOperatorNodeListener?.cancel();
    _LaundryOperatorNodeListener = null;
    super.onClose();
  }
}
