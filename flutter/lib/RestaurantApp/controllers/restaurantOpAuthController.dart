import 'dart:async';

import 'package:flutter/material.dart' as Material;
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/graphql/notifications/hsNotificationInfo.dart';
import 'package:mezcalmos/Shared/graphql/restaurant_operator/hsRestaurantOperator.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/NotificationInfo.dart';

class RestaurantOpAuthController extends GetxController {
  Rxn<Operator> operator = Rxn();
  final int operatorUserId = Get.find<AuthController>().hasuraUserId!;
  AuthController _authController = Get.find<AuthController>();
  // RestaurantInfoController _restaurantInfoController =
  //     Get.find<RestaurantInfoController>();
  BackgroundNotificationsController _notificationsController =
      Get.find<BackgroundNotificationsController>();
  RxnInt _restaurantId = RxnInt();
  int? get restaurantId => _restaurantId.value;

  OperatorState? get restaurantOperatorState => operator.value?.state;
  Stream<Operator?> get operatorInfoStream => operator.stream;

  StreamSubscription? _restaurantOperatorNodeListener;
  StreamSubscription<MainUserInfo>? _userInfoStreamListener;
  final AppLifeCycleController _appLifeCycleController =
      Get.find<AppLifeCycleController>();

  String? _appLifeCyclePauseCallbackId;
  String? _appLifeCycleResumeCallbackId;

  bool _checkedAppVersion = false;
  String? _previousStateValue = "init";

  @override
  void onInit() {
    // ------------------------------------------------------------------------
    mezDbgPrint("RestaurantAuthController: init $hashCode");
    mezDbgPrint(
        "RestaurantAuthController: calling handle state change first time");
    // Todo @m66are remove this restaurant id hard code

    setupRestaurantOperator().then((value) {
      if (operator.value?.info.hasuraId != null) {
        saveNotificationToken();
      }
    });

    super.onInit();
  }

  Future<void> setupRestaurantOperator() async {
    // final RestaurantOperatorState? operatorState =
    //     await get_operator_state(operatorId: operatorUserId, withCache: false);
    // final UserInfo operatorInfo =
    //     await get_user_by_hasura_id(hasuraId: operatorUserId);
    operator.value = await get_restaurant_operator(userId: operatorUserId);
    if (operator.value != null) {
      _restaurantId.value = operator.value!.state.serviceProviderId;
    }

    mezDbgPrint("👑👑 Restaurant Operator :: ${operator.value?.toJson()}");
  }

  Future<void> saveNotificationToken() async {
    final String? deviceNotificationToken =
        await _notificationsController.getToken();
    final NotificationInfo? notifInfo =
        await get_notif_info(userId: operator.value!.info.hasuraId);
    mezDbgPrint("inside save notif token=====>>>😍");
    mezDbgPrint("inside save notif token=====>>>${notifInfo?.token}");
    try {
      if (notifInfo != null &&
          deviceNotificationToken != null &&
          notifInfo.token != deviceNotificationToken) {
        mezDbgPrint("🫡🫡 Updating notification info 🫡🫡");
        // ignore: unawaited_futures
        update_notif_info(
            notificationInfo: NotificationInfo(
                userId: operatorUserId,
                appType: "restaurant",
                id: notifInfo.id,
                token: deviceNotificationToken));
      } else if (deviceNotificationToken != null && notifInfo == null) {
        mezDbgPrint("🫡🫡 Saving notification info for the first time 🫡🫡");
        // ignore: unawaited_futures
        insert_notif_info(
            userId: operatorUserId,
            token: deviceNotificationToken,
            appType: "restaurant");
      }
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  @override
  void onClose() {
    mezDbgPrint(
        "[+] RestaurantAuthController::dispose ---------> Was invoked ! $hashCode");
    if (_appLifeCyclePauseCallbackId != null)
      _appLifeCycleController.removeCallbackIdOfState(
          Material.AppLifecycleState.paused, _appLifeCyclePauseCallbackId);
    if (_appLifeCycleResumeCallbackId != null)
      _appLifeCycleController.removeCallbackIdOfState(
          Material.AppLifecycleState.resumed, _appLifeCycleResumeCallbackId);

    _restaurantOperatorNodeListener?.cancel();
    _restaurantOperatorNodeListener = null;
    super.onClose();
  }
}
