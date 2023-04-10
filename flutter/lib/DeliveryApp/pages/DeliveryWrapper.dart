import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/deliveryDeepLinkHandler.dart';
import 'package:mezcalmos/DeliveryApp/notificationHandler.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/deepLinkHandler.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/deliveryNodes.dart';
import 'package:mezcalmos/Shared/helpers/NotificationsHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class DeliveryWrapper extends StatefulWidget {
  @override
  _DeliveryWrapperState createState() => _DeliveryWrapperState();
}

class _DeliveryWrapperState extends State<DeliveryWrapper> {
  final DeliveryDeepLinkHandler _deepLinkHandler = DeliveryDeepLinkHandler();
  DeliveryAuthController _deliveryAuthController =
      Get.find<DeliveryAuthController>();
  final String userId = Get.find<AuthController>().fireAuthUser!.uid;
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;
  StreamSubscription<bool>? _locationStreamSub;
  @override
  void initState() {
    mezDbgPrint("DeliveryWrapper::init state");
    Future(() async {
      await DeepLinkHandler.startDynamicLinkCheckRoutine(
          DeliveryDeepLinkHandler.handleDeeplink);
      // ignore: unawaited_futures
      _deliveryAuthController.setupDeliveryDriver().then((_) => handleState());
    });

    MezRouter.registerReturnToViewCallback(SharedRoutes.kHomeRoute, () {
      handleState();
    });

    _notificationsStreamListener = initializeShowNotificationsListener();

    Get.find<ForegroundNotificationsController>()
        .startListeningForNotificationsFromFirebase(
            deliveryDriverNotificationsNode(userId),
            deliveryDriverNotificationHandler);
    super.initState();
  }

  void handleState() {
    if (_deliveryAuthController.driver != null &&
        _deliveryAuthController.driver!.deliveryDriverState.isAuthorized) {
      mezDbgPrint("DeliveryWrapper::handleState going to incoming orders");

      MezRouter.toNamed(DeliveryAppRoutes.kCurrentOrdersListRoute);
    } else {
      MezRouter.toNamed(DeliveryAppRoutes.kDriverUnAuthRoute);
      mezDbgPrint("DeliveryWrapper::handleState going to unauthorized");
    }
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("DeliveryWrapper:: build");
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
    _locationStreamSub?.cancel();
    _locationStreamSub = null;
    super.dispose();
  }
}
