import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/models/TaxiDriver.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as MezNotification;
import 'package:mezcalmos/TaxiApp/router.dart';
import 'package:soundpool/soundpool.dart';

class TaxiWrapper extends StatefulWidget {
  @override
  _TaxiWrapperState createState() => _TaxiWrapperState();
}

class _TaxiWrapperState extends State<TaxiWrapper> {
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;

  @override
  void initState() {
    String userId = Get.find<AuthController>().fireAuthUser!.uid;
    _notificationsStreamListener = Get.find<FBNotificationsController>()
        .notificationsStream
        .listen((notification) {
      mezDbgPrint("TaxiWrapper: ${notification.toJson()}");
      if (DateTime.now().difference(notification.timestamp) <
          Duration(minutes: 10)) {
        _displayNotification(notification);
      }
    });
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
    Get.find<FBNotificationsController>()
        .startListeningForNotifications(notificationsNode(userId));
    super.initState();
  }

  void handleState(TaxiState? state) {
    if (state != null) {
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
        appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
            "menu", Get.find<SideMenuDraweController>().openMenu),
        body: MezLogoAnimation(centered: true));
  }

  @override
  void dispose() {
    _notificationsStreamListener?.cancel();
    _notificationsStreamListener = null;
    super.dispose();
  }

  void _displayNotification(MezNotification.Notification notification) async {
    Soundpool pool = Soundpool.fromOptions(
        options: SoundpoolOptions(streamType: StreamType.notification));

    int soundId = await rootBundle
        .load("assets/sounds/notif-alert.mp3")
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);

    mezDbgPrint(notification.imgUrl);
    notificationSnackBar(notification.imgUrl, notification.title,
        notification.body, notification.formattedTime, () async {
      mezDbgPrint("Notification route ===> ${notification.linkUrl} !");
      // Get.back();
      Get.toNamed(notification.linkUrl);
    });
  }
}
