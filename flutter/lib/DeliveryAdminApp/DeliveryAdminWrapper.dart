import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryAdminAuth.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/DeliveryOperator.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class DeliveryAdminWrapper extends StatefulWidget {
  const DeliveryAdminWrapper({super.key});

  @override
  State<DeliveryAdminWrapper> createState() => _DeliveryAdminWrapperState();
}

class _DeliveryAdminWrapperState extends State<DeliveryAdminWrapper> {
  DeliveryOperatorAuthController _adminAuthController =
      Get.find<DeliveryOperatorAuthController>();
  @override
  void initState() {
    Future<void>.microtask(() {
      final DeliveryOperator? _operator = _adminAuthController.deliveryOperator;
      if (_operator != null) {
        mezDbgPrint("+ Operator is not null ==> ${_operator.status}");
        handleAuthorization(_operator.status);
      } else {
        mezDbgPrint("+ Operator is null!");

        _adminAuthController.operatorStream.first.then((DeliveryOperator? _op) {
          mezDbgPrint("+ Operator :: from :: OpStream :: ${_op?.status}!");
          handleAuthorization(_op?.status);
        });
      }
    });
    // final String userId = Get.find<AuthController>().fireAuthUser!.uid;
    // _notificationsStreamListener = initializeShowNotificationsListener();
    // Get.find<ForegroundNotificationsController>()
    //     .startListeningForNotificationsFromFirebase(
    //   adminNotificationsNode(userId),
    //   deliveryAdminNotificationHandler,
    // );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void handleAuthorization(String? status) {
    switch (status) {
      case "approved":
        if (MezRouter.currentRoute()?.name == kNotAuthorizedOperator)
          MezRouter.offNamed(kDeliveryOpHomeScreen);
        else
          MezRouter.toNamed(kDeliveryOpHomeScreen);
        break;
      default:
        MezRouter.toNamed(kNotAuthorizedOperator);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MezLogoAnimation(centered: true));
  }
}
