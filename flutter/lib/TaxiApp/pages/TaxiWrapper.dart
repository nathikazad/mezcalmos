import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/NotificationsDisplayer.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/TaxiApp/components/taxiAppBar.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/models/TaxiDriver.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as MezNotification;
import 'package:mezcalmos/TaxiApp/notificationHandler.dart';
import 'package:mezcalmos/TaxiApp/router.dart';

class TaxiWrapper extends StatefulWidget {
  @override
  _TaxiWrapperState createState() => _TaxiWrapperState();
}

class _TaxiWrapperState extends State<TaxiWrapper> {
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;
  StreamSubscription<bool>? _locationStreamSub;

  @override
  void initState() {
    Future.microtask(() {
      mezDbgPrint("TaxiWrapper::microtask handleState first time");
      TaxiState? taxiState = Get.find<TaxiAuthController>().taxiState;
      if (taxiState != null)
        handleState(taxiState);
      else
        Get.find<TaxiAuthController>()
            .stateStream
            .first
            .then((taxiState) => handleState(taxiState));
    });
    String userId = Get.find<AuthController>().fireAuthUser!.uid;
    _notificationsStreamListener = initializeShowNotificationsListener();
    listenForLocationPermissions();
    Get.find<FBNotificationsController>()
        .startListeningForNotificationsFromFirebase(
            notificationsNode(userId), taxiNotificationHandler);
    super.initState();
  }

  void listenForLocationPermissions() {
    _locationStreamSub?.cancel();
    _locationStreamSub = Get.find<SettingsController>().locationPermissionStream
        // .distinct()
        .listen((locationPermission) {
      if (locationPermission == false &&
          Get.currentRoute != kLocationPermissionPage) {
        Get.toNamed(kLocationPermissionPage);
      }
    });
  }

  void handleState(TaxiState? state) async {
    mezDbgPrint(state);
    if (state != null) {
      mezDbgPrint("Current order ====> ${state.currentOrder}");
      mezDbgPrint("isAuthorized ====> ${state.isAuthorized}");
      mezDbgPrint("isLooking ====> ${state.isLooking}");

      mezDbgPrint("TaxiWrapper::handleState ${state.toJson().toString()}");
      if (!state.isAuthorized) {
        mezDbgPrint("TaxiWrapper::handleState going to unauthorized");
        Get.toNamed(kUnauthorizedRoute);
      } else if (state.currentOrder != null) {
        mezDbgPrint("TaxiWrapper::handleState going to current order");
        Get.toNamed(kCurrentOrderPage);
      } else {
        mezDbgPrint("TaxiWrapper::handleState going to incoming orders");
        Get.toNamed(kOrdersListPage);
      }
    } else {
      mezDbgPrint("TaxiWrapper::handleState state is null, ERROR");
    }
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("TaxiWrapper:: build");
    return Scaffold(
        key: Get.find<SideMenuDraweController>().getNewKey(),
        drawer: MezSideMenu(),
        backgroundColor: Colors.white,
        appBar: taxiAppBar(AppBarLeftButtonType.Menu),
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
