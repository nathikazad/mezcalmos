import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/TaxiApp/controllers/TaxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/router.dart';

class TaxiWrapper extends StatefulWidget {
  const TaxiWrapper({Key? key}) : super(key: key);

  @override
  _TaxiWrapperState createState() => _TaxiWrapperState();
}

class _TaxiWrapperState extends State<TaxiWrapper> {
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;

  StreamSubscription<bool>? _locationStreamSub;

  AuthController _authController = Get.find<AuthController>();
  TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();

  @override
  void initState() {
    mezDbgPrint("TaxiWrapper::init state");
    handleState();
    super.initState();
  }

  Future<void> handleState() async {
    await _taxiAuthController.setupDeliveryDriver();
    if (_taxiAuthController.driver != null &&
        _taxiAuthController.driver!.deliveryDriverState.isAuthorized) {
      mezDbgPrint("DeliveryWrapper::handleState going to incoming orders");

      unawaited(MezRouter.toPath(TaxiAppRoutes.kCurrentOrdersListRoute));
    } else {
      mezDbgPrint("DeliveryWrapper::handleState going to unauthorized");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        backgroundColor: Colors.white,
        appBar: MezcalmosAppBar(AppBarLeftButtonType.Menu),
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
