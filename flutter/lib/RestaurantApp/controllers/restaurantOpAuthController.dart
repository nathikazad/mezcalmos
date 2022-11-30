import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/operatorNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/restaurantNodes.dart';
import 'package:mezcalmos/Shared/graphql/restaurantOperator/hsRestaurantOperator.dart';
import 'package:mezcalmos/Shared/graphql/user/hsUser.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/models/Operators/RestaurantOperator.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class RestaurantOpAuthController extends GetxController {
  Rxn<RestaurantOperator> operator = Rxn();
  final int operatorId = Get.find<AuthController>().hasuraUserId!;
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();
  // RestaurantInfoController _restaurantInfoController =
  //     Get.find<RestaurantInfoController>();
  ROpOrderController _orderController = Get.find<ROpOrderController>();
  BackgroundNotificationsController _notificationsController =
      Get.find<BackgroundNotificationsController>();
  String? restaurantId;

  RestaurantOperatorState? get restaurantOperatorState => operator.value?.state;
  Stream<RestaurantOperator?> get operatorInfoStream => operator.stream;

  StreamSubscription? _restaurantOperatorNodeListener;
  StreamSubscription<MainUserInfo>? _userInfoStreamListener;

  bool _checkedAppVersion = false;
  String? _previousStateValue = "init";

  @override
  void onInit() {
    // ------------------------------------------------------------------------
    mezDbgPrint("RestaurantAuthController: init $hashCode");
    mezDbgPrint(
        "RestaurantAuthController: calling handle state change first time");
    // Todo @m66are remove this restaurant id hard code

    setupRestaurantOperator();
    super.onInit();
  }

  Future<void> setupRestaurantOperator() async {
    final RestaurantOperatorState? operatorState =
        await get_operator_state(operatorId: operatorId, withCache: false);
    final UserInfo operatorInfo =
        await get_user_by_hasura_id(hasuraId: operatorId);
    if (operatorState != null) {
      restaurantId = operatorState.restaurantId;
      operator.value = RestaurantOperator(
          state: operatorState,
          info: operatorInfo,
          operatorId: operatorId.toString());
    }
    mezDbgPrint("👑👑 Restaurant Operator :: ${operator.value?.toJson()}");
    // mezDbgPrint("RestaurantAuthController: handle state change user value");
    // mezDbgPrint(user);

    // mezDbgPrint(
    //     "RestaurantAuthController: restaurantNode =======>>>>>> init ${operatorStateNode(operatorType: OperatorType.Restaurant, uid: user.uid)}");
    // await _restaurantOperatorNodeListener?.cancel();
    // _restaurantOperatorNodeListener = null;

    // await _databaseHelper.firebaseDatabase
    //     .reference()
    //     .child(operatorAuthNode(
    //         operatorType: OperatorType.Restaurant, uid: user.uid))
    //     .once()
    //     .then((DatabaseEvent value) => mezDbgPrint(value));
    // // mezDbgPrint("Listening");
    // _restaurantOperatorNodeListener = _databaseHelper.firebaseDatabase
    //     .reference()
    //     .child(operatorAuthNode(
    //         operatorType: OperatorType.Restaurant, uid: user.uid))
    //     .onValue
    //     .listen((DatabaseEvent event) async {
    //   if (event.snapshot.value.toString() == _previousStateValue) {
    //     return;
    //   }
    //   _previousStateValue = event.snapshot.value.toString();

    //   if (event.snapshot.value != null) {
    //     operator.value =
    //         RestaurantOperator.fromData(user.uid, event.snapshot.value);

    //     saveAppVersionIfNecessary();
    //     // TODO user info stream fix @m66are
    //     // await _userInfoStreamListener?.cancel();
    //     // _authController.userInfoStream.listen((MainUserInfo? userInfo) {
    //     //   if (userInfo != null) {
    //     //     _databaseHelper.firebaseDatabase
    //     //         .ref()
    //     //         .child(operatorInfoNode(
    //     //             operatorType: OperatorType.Restaurant, uid: user.uid))
    //     //         .set(userInfo.toFirebaseFormatJson());
    //     //   }
    //     // });
    //     unawaited(saveNotificationToken());
    //     if (restaurantId != operator.value!.state.restaurantId) {
    //       // init controllers with new id
    //       restaurantId = operator.value!.state.restaurantId;
    //       await _orderController.init(restaurantId!);
    //       //  await _restaurantInfoController.init(restaurantId!);
    //     }
    //   }
    // });
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

  void turnOpenOff() {
    _databaseHelper.firebaseDatabase
        .ref()
        .child(restaurantOpenNode(uid: restaurantId!))
        .set(false)
        .catchError((err) {
      mezDbgPrint("Error turning [ isLooking = false ] -> $err");
      MezSnackbar("Error ~", "Failed turning it off!");
    });
  }

  void turnOpenOn() {
    _databaseHelper.firebaseDatabase
        .ref()
        .child(restaurantOpenNode(uid: restaurantId!))
        .set(true)
        .catchError((err) {
      mezDbgPrint("Error turning [ isLooking = true ] -> $err");
      MezSnackbar("Error ~", "Failed turning_listenForLocation it on!");
    });
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
