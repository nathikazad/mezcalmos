import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/ROpDeeplinkHandler.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/RestaurantApp/notificationHandler.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/operatorNodes.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/models/Operators/RestaurantOperator.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class RestaurantWrapper extends StatefulWidget {
  @override
  _RestaurantWrapperState createState() => _RestaurantWrapperState();
}

class _RestaurantWrapperState extends State<RestaurantWrapper> {
  RestaurantOperator? restaurantOperator;
  final ROpDeeplinkHandler rOpDeeplinkHandler = ROpDeeplinkHandler();
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;
  @override
  void initState() {
    mezDbgPrint("RestaurantWrapper::init state");
    Future.wait([rOpDeeplinkHandler.startDynamicLinkCheckRoutine()]);
    Future<void>.microtask(() async {
      mezDbgPrint("RestaurantWrapper::microtask handleState first time");
      await Get.find<RestaurantOpAuthController>().setupRestaurantOperator();
      restaurantOperator =
          Get.find<RestaurantOpAuthController>().operator.value;

      handleState(restaurantOperator);
    });
    if (Get.find<AuthController>().isUserSignedIn) {
      _notificationsStreamListener = initializeShowNotificationsListener();
      Get.find<ForegroundNotificationsController>()
          .startListeningForNotificationsFromFirebase(
              operatorNotificationsNode(
                  uid: Get.find<AuthController>().fireAuthUser!.uid,
                  operatorType: OperatorType.Restaurant),
              restaurantNotificationHandler);
    }
    super.initState();
  }

  void handleState(RestaurantOperator? operator) {
    mezDbgPrint(operator);

    if (operator == null) {
      MezRouter.toNamed(kCreateRestaurant);
    } else if (operator.isWaitingToBeApprovedByOwner) {
      MezRouter.toNamed(kOpUnauth);
    } else {
      MezRouter.toNamed(kTabsView);
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
    super.dispose();
  }
}
