// ignore_for_file: unawaited_futures, inference_failure_on_function_invocation

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/RestaurantApp/notificationHandler.dart';
import 'package:mezcalmos/RestaurantApp/restaurantDeepLinkHandler.dart';
import 'package:mezcalmos/RestaurantApp/router/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/deepLinkHandler.dart';
import 'package:mezcalmos/Shared/firebaseNodes/operatorNodes.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/CreateServiceView.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class RestaurantWrapper extends StatefulWidget {
  @override
  _RestaurantWrapperState createState() => _RestaurantWrapperState();
}

class _RestaurantWrapperState extends State<RestaurantWrapper> {
  Operator? restaurantOperator;

  RestaurantOpAuthController restaurantOpAuthController =
      Get.find<RestaurantOpAuthController>();
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;

  @override
  void initState() {
    mezDbgPrint("RestaurantWrapper::init state");

    Future.microtask(() async {
      await DeepLinkHandler.startDynamicLinkCheckRoutine(
          RestaurantDeepLinkHandler.handleDeeplink);
      restaurantOpAuthController
          .setupRestaurantOperator()
          .then((_) => handleState());
    });
    _setupNotifications();
    super.initState();
  }

  Future<void> handleState() async {
    mezDbgPrint(
        "🫡 Start routing process 🫡 =>${restaurantOpAuthController.operator.value?.toJson()}");

    if (restaurantOpAuthController.operator.value == null) {
      CreateServiceView.navigate(
          serviceProviderType: cModels.ServiceProviderType.Restaurant);
    } else if (restaurantOpAuthController
        .operator.value!.isWaitingToBeApprovedByOwner) {
      MezRouter.toPath(RestaurantAppRoutes.unAuthorizedRoute);
    } else {
      MezRouter.toPath(RestaurantAppRoutes.tabsRoute);
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
              restaurantNotificationHandler);
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
