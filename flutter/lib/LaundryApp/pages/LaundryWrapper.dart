import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryOpAuthController.dart';
import 'package:mezcalmos/LaundryApp/notificationHandler.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/deliveryNodes.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as MezNotification;
import 'package:mezcalmos/Shared/models/Operators/LaundryOperator.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class LaundryWrapper extends StatefulWidget {
  @override
  _LaundryWrapperState createState() => _LaundryWrapperState();
}

class _LaundryWrapperState extends State<LaundryWrapper> {
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;
  StreamSubscription<bool>? _locationStreamSub;
  @override
  void initState() {
    // Get.put(LaundryInfoController(), permanent: true);

    mezDbgPrint("DeliveryWrapper::init state");
    Future.microtask(() {
      mezDbgPrint("DeliveryWrapper::microtask handleState first time");
      final LaundryOperatorState? laundryOperatorState =
          Get.find<LaundryOpAuthController>().laundryOperatorState;
      mezDbgPrint("deliveryDriverState = $laundryOperatorState");
      if (laundryOperatorState != null) {
        mezDbgPrint("inside if  = $laundryOperatorState");

        handleState(laundryOperatorState);
      } else {
        mezDbgPrint("inside else  = $laundryOperatorState");
        mezDbgPrint("${Get.find<LaundryOpAuthController>().stateStream.first}");

        Get.find<LaundryOpAuthController>()
            .stateStream
            .first
            .then((LaundryOperatorState? _laundryOpState) {
          mezDbgPrint("inside else -> then  = $_laundryOpState");
          handleState(_laundryOpState);
        });
      }
    });

    final String userId = Get.find<AuthController>().fireAuthUser!.uid;
    _notificationsStreamListener = initializeShowNotificationsListener();
    listenForLocationPermissions();
    Get.find<ForegroundNotificationsController>()
        .startListeningForNotificationsFromFirebase(
            deliveryDriverNotificationsNode(userId),
            laundryNotificationHandler);
    super.initState();
  }

  void listenForLocationPermissions() {
    _locationStreamSub?.cancel();
    _locationStreamSub = Get.find<LocationController>().locationPermissionStream
        // .distinct()
        .listen((bool locationPermission) {
      if (locationPermission == false &&
          Get.currentRoute != kLocationPermissionPage) {
        Get.toNamed(kLocationPermissionPage);
      }
    });
  }

  void handleState(LaundryOperatorState? state) async {
    mezDbgPrint(state);
    if (state != null) {
      // mezDbgPrint("Current order ====> ${state.currentOrder}");
      // mezDbgPrint("isAuthorized ====> ${state.isAuthorized}");
      // mezDbgPrint("isLooking ====> ${state.isLooking}");

      // mezDbgPrint("DeliveryWrapper::handleState ${state.toJson().toString()}");
      // if (!state.isAuthorized) {
      //   mezDbgPrint("DeliveryWrapper::handleState going to unauthorized");
      //   Get.toNamed(kUnauthorizedRoute);
      //   // } else if (state.currentOrder != null) {
      //   //   mezDbgPrint("DeliveryWrapper::handleState going to current order");
      //   //   Get.toNamed(kCurrentOrderRoute);
      // } else {
      //   mezDbgPrint("DeliveryWrapper::handleState going to incoming orders");
      mezDbgPrint(
          "----------------- STAAAAAAAARTTTTT --------------------------");
      await Get.toNamed(kDashboardView);
      // }
    } else {
      mezDbgPrint("DeliveryWrapper::handleState state is null, ERROR");
    }
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("DeliveryWrapper:: build");
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
