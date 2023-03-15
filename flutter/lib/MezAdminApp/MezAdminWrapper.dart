import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/controllers/mezAdminAuthController.dart';
import 'package:mezcalmos/MezAdminApp/models/MezAdmin.dart';
import 'package:mezcalmos/MezAdminApp/notificationHandler.dart';
import 'package:mezcalmos/MezAdminApp/router/router.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/mezAdminNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart'
    as MezNotification;
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

    final MezAdmin? _admin = _adminAuthController.admin;
    if (_admin != null) {
      MezRouter.toNamed(MezAdminRoutes.kTabsViewRoute);
    } else {
      _adminAuthController.getMezAdmin().then((value) {
        if (_adminAuthController.admin != null) {
          MezRouter.toNamed(MezAdminRoutes.kTabsViewRoute);
        }
      });
    }
    Get.find<ForegroundNotificationsController>()
        .startListeningForNotificationsFromFirebase(
            mezAdminNotificationsNode(userId), mezAdminNotificationHandler);

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
