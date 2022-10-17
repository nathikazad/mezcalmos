import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/RestaurantApp/notificationHandler.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/operatorNodes.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/models/Operators/RestaurantOperator.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/pages/SomethingWentWrong.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class RestaurantWrapper extends StatefulWidget {
  @override
  _RestaurantWrapperState createState() => _RestaurantWrapperState();
}

class _RestaurantWrapperState extends State<RestaurantWrapper> {
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;
  StreamSubscription<bool>? _locationStreamSub;
  StreamSubscription<RestaurantOperator?>? _operatorInfoStreanSub;
  RestaurantOperator? restaurantOperator;

  Stream<RestaurantOperator?> operatorInfoStream() async* {
    yield* Stream<Future>.periodic(Duration(seconds: 5), (int iter) {
      return Get.find<RestaurantOpAuthController>()
          .operatorInfoStream
          .asBroadcastStream()
          .first
          .timeout(
            Duration(seconds: 20),
            onTimeout: () => null,
          );
    }).asyncMap((event) async => restaurantOperator = await event);
  }

  void _operatorInfoStreamListener() {
    _operatorInfoStreanSub = operatorInfoStream().listen((event) {
      if (Get.currentRoute != kUserProfile && event == null) {
        Get.toNamed<void>(kSomethingWentWrongScreen);
      } else if (event != null &&
          Get.currentRoute == kSomethingWentWrongScreen) {
        Get.back<void>();
      }
    });
  }

  @override
  void initState() {
    // Get.put(RestaurantInfoController(), permanent: true);

    mezDbgPrint("RestaurantWrapper::init state");
    Future<void>.microtask(() async {
      mezDbgPrint("RestaurantWrapper::microtask handleState first time");

      restaurantOperator =
          Get.find<RestaurantOpAuthController>().operator.value;
      mezDbgPrint("RESTAURANT OPERATOR ==> $restaurantOperator");
      if (restaurantOperator == null)
        restaurantOperator = await Get.find<RestaurantOpAuthController>()
            .operatorInfoStream
            .first
            .timeout(Duration(seconds: 20), onTimeout: () => null);
      if (restaurantOperator == null) _operatorInfoStreamListener();
      mezDbgPrint("RestaurantWrapper::microtask data received");
      handleState(restaurantOperator);
    });

    final String userId = Get.find<AuthController>().fireAuthUser!.uid;
    _notificationsStreamListener = initializeShowNotificationsListener();
    Get.find<ForegroundNotificationsController>()
        .startListeningForNotificationsFromFirebase(
      operatorNotificationsNode(
          uid: userId, operatorType: OperatorType.Restaurant),
      restaurantNotificationHandler,
    );
    super.initState();
  }

  void handleState(RestaurantOperator? operator) {
    mezDbgPrint(operator);
    if (operator != null && operator.state.restaurantId != null) {
      // ignore: unawaited_futures, inference_faQilure_on_function_invocation
      Get.toNamed<void>(kCurrentOrdersListView);
    } else {
      mezDbgPrint("RestaurantWrappper::handleState state is null, ERROR");
    }
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("RestaurantWrapper:: build");
    return Scaffold(
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        backgroundColor: Colors.white,
        appBar: mezcalmosAppBar(AppBarLeftButtonType.Menu,
            onClick: () => Get.find<SideMenuDrawerController>().openMenu()),
        body: MezLogoAnimation(centered: true));
  }

  @override
  void dispose() {
    _notificationsStreamListener?.cancel();
    _notificationsStreamListener = null;
    _operatorInfoStreanSub?.cancel();
    _operatorInfoStreanSub = null;
    _locationStreamSub?.cancel();
    _locationStreamSub = null;
    super.dispose();
  }
}
