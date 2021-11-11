import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/AdminNotifications.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/utilities/NotificationsDisplayer.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/DeliveryAdminApp/constants/databaseNodes.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/adminAuthController.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/Admin.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as MezNotification;

class AdminWrapper extends StatefulWidget {
  @override
  _AdminWrapperState createState() => _AdminWrapperState();
}

class _AdminWrapperState extends State<AdminWrapper> {
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;

  @override
  void initState() {
    Future.microtask(() {
      mezDbgPrint("AdminWrapper::microtask handleState first time");
      Admin? admin = Get.find<AdminAuthController>().admin;
      if (admin != null)
        handleAuthorization(admin.authorized);
      else
        Get.find<AdminAuthController>()
            .adminStream
            .first
            .then((admin) => handleAuthorization(admin?.authorized ?? false));
    });
    String userId = Get.find<AuthController>().fireAuthUser!.uid;
    _notificationsStreamListener = initializeShowNotificationsListener();
    Get.find<FBNotificationsController>()
        .startListeningForNotificationsFromFirebase(
            notificationsNode(userId), deliveryAdminNotificationHandler);
    super.initState();
  }

  void handleAuthorization(bool authorized) {
    if (authorized) {
      mezDbgPrint("AdminWrapper::handleState going to in process orders");
      Get.toNamed(kOrdersRoute);
    } else {
      mezDbgPrint("AdminWrapper::handleState going to unauthorized");
      Get.toNamed(kUnauthorizedRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("AdminWrapper:: build");
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
}
