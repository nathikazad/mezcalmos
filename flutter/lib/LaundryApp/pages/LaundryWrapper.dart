import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryOpAuthController.dart';
import 'package:mezcalmos/LaundryApp/notificationHandler.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/operatorNodes.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class LaundryWrapper extends StatefulWidget {
  @override
  _LaundryWrapperState createState() => _LaundryWrapperState();
}

class _LaundryWrapperState extends State<LaundryWrapper> {
  Operator? restaurantOperator;

  LaundryOpAuthController laundryOpAuthController =
      Get.find<LaundryOpAuthController>();
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;
  @override
  void initState() {
    mezDbgPrint("LaundryWrapper::init state");

    Future.microtask(() async {
      //   await rOpDeeplinkHandler.startDynamicLinkCheckRoutine();
      await laundryOpAuthController
          .setupLaundryOperator()
          .then((_) => handleState());
    });
    _setupNotifications();
    super.initState();
  }

  Future<void> handleState() async {
    mezDbgPrint(
        "🫡 Start routing process 🫡 =>${laundryOpAuthController.operator.value?.toJson()}");

    if (laundryOpAuthController.operator.value == null) {
      // todo navigate to unauth
      // navigateToCreateService(
      //     serviceProviderType: ServiceProviderType.Restaurant);
    } else {
      await MezRouter.toNamed(LaundryAppRoutes.kLaundryTabsViewRoute);
    }
  }

  void _setupNotifications() {
    if (Get.find<AuthController>().isUserSignedIn) {
      mezDbgPrint("Setup notifs listener 🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀 ");
      _notificationsStreamListener?.cancel();
      _notificationsStreamListener = initializeShowNotificationsListener();
      Get.find<ForegroundNotificationsController>()
          .startListeningForNotificationsFromFirebase(
              operatorNotificationsNode(
                  uid: Get.find<AuthController>().fireAuthUser!.uid,
                  operatorType: OperatorType.Restaurant),
              laundryNotificationHandler);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        backgroundColor: Colors.white,
        appBar: MezcalmosAppBar(AppBarLeftButtonType.Menu,
            onClick: () => Get.find<SideMenuDrawerController>().openMenu()),
        body: MezLogoAnimation(centered: true));
  }

  @override
  void dispose() {
    _notificationsStreamListener?.cancel();
    _notificationsStreamListener = null;
    super.dispose();
  }
}
