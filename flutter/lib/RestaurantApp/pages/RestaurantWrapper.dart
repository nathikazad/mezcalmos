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
import 'package:mezcalmos/Shared/models/Notification.dart' as MezNotification;
import 'package:mezcalmos/Shared/models/Operators/RestaurantOperator.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
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

  @override
  void initState() {
    // Get.put(RestaurantInfoController(), permanent: true);

    mezDbgPrint("RestaurantWrapper::init state");
    Future.microtask(() async {
      mezDbgPrint("RestaurantWrapper::microtask handleState first time");
      RestaurantOperator? restaurantOperator =
          Get.find<RestaurantOpAuthController>().operator.value;
      if (restaurantOperator == null)
        restaurantOperator = await Get.find<RestaurantOpAuthController>()
            .operatorInfoStream
            .first;
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
      // ignore: unawaited_futures, inference_failure_on_function_invocation
      Get.toNamed(kCurrentOrdersListView);
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
    _locationStreamSub?.cancel();
    _locationStreamSub = null;
    super.dispose();
  }
}
