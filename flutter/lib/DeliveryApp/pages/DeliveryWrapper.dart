import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/components/deliveryAppBar.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/notificationHandler.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/deliveryNodes.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as MezNotification;
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class DeliveryWrapper extends StatefulWidget {
  @override
  _DeliveryWrapperState createState() => _DeliveryWrapperState();
}

class _DeliveryWrapperState extends State<DeliveryWrapper> {
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;
  StreamSubscription<bool>? _locationStreamSub;
  @override
  void initState() {
    mezDbgPrint("DeliveryWrapper::init state");
    Future.microtask(() {
      mezDbgPrint("DeliveryWrapper::microtask handleState first time");
      DeliveryDriverState? deliveryDriverState =
          Get.find<DeliveryAuthController>().deliveryDriverState;
      mezDbgPrint("deliveryDriverState = $deliveryDriverState");
      if (deliveryDriverState != null) {
        mezDbgPrint("inside if  = $deliveryDriverState");

        handleState(deliveryDriverState);
      } else {
        mezDbgPrint("inside else  = $deliveryDriverState");
        mezDbgPrint("${Get.find<DeliveryAuthController>().stateStream.first}");

        Get.find<DeliveryAuthController>()
            .stateStream
            .first
            .then((_deliveryDriverState) {
          mezDbgPrint("inside else -> then  = $_deliveryDriverState");
          handleState(_deliveryDriverState);
        });
      }
    });

    String userId = Get.find<AuthController>().fireAuthUser!.uid;
    _notificationsStreamListener = initializeShowNotificationsListener();
    listenForLocationPermissions();
    Get.find<ForegroundNotificationsController>()
        .startListeningForNotificationsFromFirebase(
            deliveryDriverNotificationsNode(userId),
            deliveryDriverNotificationHandler);
    super.initState();
  }

  void listenForLocationPermissions() {
    _locationStreamSub?.cancel();
    _locationStreamSub = Get.find<LocationController>().locationPermissionStream
        // .distinct()
        .listen((locationPermission) {
      if (locationPermission == false &&
          Get.currentRoute != kLocationPermissionPage) {
        Get.toNamed(kLocationPermissionPage,
            arguments: {"withBackground": true});
      }
    });
  }

  void handleState(DeliveryDriverState? state) {
    mezDbgPrint(state);
    if (state != null) {
      // mezDbgPrint("Current order ====> ${state.currentOrder}");
      // mezDbgPrint("isAuthorized ====> ${state.isAuthorized}");
      // mezDbgPrint("isLooking ====> ${state.isLooking}");

      mezDbgPrint("DeliveryWrapper::handleState ${state.toJson().toString()}");
      if (!state.isAuthorized) {
        mezDbgPrint("DeliveryWrapper::handleState going to unauthorized");
        Get.toNamed(kUnauthorizedRoute);
        // } else if (state.currentOrder != null) {
        //   mezDbgPrint("DeliveryWrapper::handleState going to current order");
        //   Get.toNamed(kCurrentOrderRoute);
      } else {
        mezDbgPrint("DeliveryWrapper::handleState going to incoming orders");
        Get.toNamed(kCurrentOrdersListRoute);
      }
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
        appBar: deliveryAppBar(AppBarLeftButtonType.Menu,
            function: () => Get.find<SideMenuDrawerController>().openMenu()),
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
