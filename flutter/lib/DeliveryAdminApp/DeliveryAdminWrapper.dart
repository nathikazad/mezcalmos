// ignore_for_file: unawaited_futures, inference_failure_on_function_invocation

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryAdminAuth.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class DeliveryAdminWrapper extends StatefulWidget {
  const DeliveryAdminWrapper({super.key});

  @override
  State<DeliveryAdminWrapper> createState() => _DeliveryAdminWrapperState();
}

class _DeliveryAdminWrapperState extends State<DeliveryAdminWrapper> {
  Operator? restaurantOperator;

  DeliveryOpAuthController deliveryOpAuthController =
      Get.find<DeliveryOpAuthController>();
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;
  @override
  void initState() {
    mezDbgPrint("RestaurantWrapper::init state");

    deliveryOpAuthController.setupDeliveryOperator().then((_) => handleState());

    _setupNotifications();
    super.initState();
  }

  Future<void> handleState() async {
    mezDbgPrint(
        "🫡 Start routing process 🫡 =>${deliveryOpAuthController.operator.value?.toJson()}");

    if (deliveryOpAuthController.operator.value == null) {
      // MezRouter.toNamed(kCreateRestaurant);
    } else if (deliveryOpAuthController
        .operator.value!.isWaitingToBeApprovedByOwner) {
      //  MezRouter.toNamed(kOpUnauth);
    } else {
      MezRouter.toNamed(DeliveryAdminRoutes.kDeliveryOpHomeScreenRoute);
    }
  }

  void _setupNotifications() {
    // if (Get.find<AuthController>().isUserSignedIn) {
    //   mezDbgPrint("Setup notifs listener 🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀 ");
    //   _notificationsStreamListener?.cancel();
    //   _notificationsStreamListener = initializeShowNotificationsListener();
    //   Get.find<ForegroundNotificationsController>()
    //       .startListeningForNotificationsFromFirebase(
    //           operatorNotificationsNode(
    //               uid: Get.find<AuthController>().fireAuthUser!.uid,
    //               operatorType: OperatorType.Restaurant),
    //           );
    // }
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
