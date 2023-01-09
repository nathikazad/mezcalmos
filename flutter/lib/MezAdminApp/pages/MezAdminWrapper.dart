import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/controllers/mezAdminAuthController.dart';
import 'package:mezcalmos/MezAdminApp/models/MezAdmin.dart';
import 'package:mezcalmos/MezAdminApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class MezAdminWrapper extends StatefulWidget {
  const MezAdminWrapper({super.key});

  @override
  State<MezAdminWrapper> createState() => _MezAdminWrapperState();
}

class _MezAdminWrapperState extends State<MezAdminWrapper> {
  MezAdminAuthController _adminAuthController =
      Get.find<MezAdminAuthController>();
  @override
  void initState() {
    mezDbgPrint("[MMM] => MezAdminWrapper :: INIT");
    Future<void>.microtask(() {
      final MezAdmin? _admin = _adminAuthController.admin;
      if (_admin != null) {
        MezRouter.toNamed(kDeliveryOpHomeScreen);
      } else {
        _adminAuthController.adminStream.first.then((MezAdmin? _mAdmin) {
          if (_mAdmin != null &&
              !MezRouter.isRouteInStack(kDeliveryOpHomeScreen)) {
            MezRouter.toNamed(kDeliveryOpHomeScreen);
          }
        });
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
