import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/controllers/mezAdminAuthController.dart';
import 'package:mezcalmos/MezAdminApp/models/MezAdmin.dart';
import 'package:mezcalmos/MezAdminApp/notificationHandler.dart';
import 'package:mezcalmos/MezAdminApp/router/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/mezAdminNodes.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class MezAdminWrapper extends StatefulWidget {
  const MezAdminWrapper({super.key});

  @override
  State<MezAdminWrapper> createState() => _MezAdminWrapperState();
}

class _MezAdminWrapperState extends State<MezAdminWrapper> {
  final String userId = Get.find<AuthController>().fireAuthUser!.uid;
  MezAdminAuthController _adminAuthController =
      Get.find<MezAdminAuthController>();
  StreamSubscription<MezNotification.Notification>?
      _notificationsStreamListener;
  @override
  void initState() {
    mezDbgPrint("[MMM] => MezAdminWrapper :: INIT");

    _adminAuthController.getMezAdmin().then((MezAdmin? admin) {
      if (admin != null) {
        Get.find<ForegroundNotificationsController>()
            .startListeningForNotificationsFromFirebase(
                mezAdminNotificationsNode(userId), mezAdminNotificationHandler);
        MezRouter.toNamed(MezAdminRoutes.kTabsViewRoute);
      } else {
        showErrorSnackBar(
            duration: Duration(seconds: 2),
            errorText:
                "There is no mez admin with this id : ${Get.find<AuthController>().hasuraUserId}");
        Get.find<AuthController>().signOut();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MezLogoAnimation(centered: true));
  }
}
