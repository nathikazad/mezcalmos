// ignore_for_file: unawaited_futures, inference_failure_on_function_invocation

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/CreateServiceView.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class BusinessWarpper extends StatefulWidget {
  const BusinessWarpper({super.key});

  @override
  State<BusinessWarpper> createState() => _BusinessWarpperState();
}

class _BusinessWarpperState extends State<BusinessWarpper> {
  Operator? restaurantOperator;

  BusinessOpAuthController deliveryOpAuthController =
      Get.find<BusinessOpAuthController>();
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;
  @override
  void initState() {
    mezDbgPrint(" 👋👋👋👋👋👋👋 Business ::init state 👋👋👋👋👋👋👋 ");

    deliveryOpAuthController
        .setupBusinessOperator()
        .whenComplete(() => handleState());

    _setupNotifications();
    super.initState();
  }

  Future<void> handleState() async {
    mezDbgPrint(
        "🫡 Start routing process 🫡 =>${deliveryOpAuthController.operator.value?.toJson()}");

    if (deliveryOpAuthController.operator.value?.isAuthorized == true) {
      //  MezRouter.toNamed(DeliveryAdminRoutes.kDeliveryOpTabsView);
    } else {
      CreateServiceView.navigate(
          serviceProviderType: cModels.ServiceProviderType.Business);
    }
  }

  void _setupNotifications() {
    // if (Get.find<AuthController>().isUserSignedIn) {
    //   mezDbgPrint("Setup notifs listener 🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀 ");
    //   _notificationsStreamListener?.cancel();
    //   _notificationsStreamListener = initializeShowNotificationsListener();
    //   Get.find<ForegroundNotificationsController>()
    //       .startListeningForNotificationsFromFirebase(
    //     operatorNotificationsNode(
    //         uid: Get.find<AuthController>().fireAuthUser!.uid,
    //         operatorType: OperatorType.Business),
    //     deliveryAdminNotificationHandler,
    //   );
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
