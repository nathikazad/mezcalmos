import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/taxiNodes.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/DeliveryApp/components/DeliveryAppBar.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/models/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as MezNotification;
import 'package:mezcalmos/DeliveryApp/notificationHandler.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';

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
      DeliveryDriverState? taxiState =
          Get.find<DeliveryAuthController>().deliveryDriverState;
      mezDbgPrint("taxiState = $taxiState");
      if (taxiState != null) {
        mezDbgPrint("inside if  = $taxiState");

        handleState(taxiState);
      } else {
        mezDbgPrint("inside else  = $taxiState");
        Get.find<DeliveryAuthController>().stateStream.first.then((_taxiState) {
          mezDbgPrint("inside else -> then  = $_taxiState");
          handleState(_taxiState);
        });
      }
    });

    String userId = Get.find<AuthController>().fireAuthUser!.uid;
    _notificationsStreamListener = initializeShowNotificationsListener();
    listenForLocationPermissions();
    Get.find<ForegroundNotificationsController>()
        .startListeningForNotificationsFromFirebase(
            taxiNotificationsNode(userId), taxiNotificationHandler);
    super.initState();
  }

  void listenForLocationPermissions() {
    _locationStreamSub?.cancel();
    _locationStreamSub = Get.find<LocationController>().locationPermissionStream
        // .distinct()
        .listen((locationPermission) {
      if (locationPermission == false &&
          Get.currentRoute != kLocationPermissionPage) {
        Get.toNamed(kLocationPermissionPage);
      }
    });
  }

  void handleState(DeliveryDriverState? state) async {
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
        appBar: DeliveryAppBar(AppBarLeftButtonType.Menu,
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
