import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/UnAuthView/controllers/BusinessOpUnauthViewController.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/ServiceProviders/ServiceWaitingForApproval.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]["pages"]
    ["LaundryUnauthView"];

class BusinessOpUnauthView extends StatefulWidget {
  const BusinessOpUnauthView({super.key});
  static Future<void> navigate() async {
    await MezRouter.toPath(BusinessOpRoutes.kUnauthorizedOperatorRoute);
  }

  @override
  State<BusinessOpUnauthView> createState() => _BusinessOpUnauthViewState();
}

class _BusinessOpUnauthViewState extends State<BusinessOpUnauthView> {
  BusinessOpUnauthViewController viewController =
      BusinessOpUnauthViewController();
  @override
  void initState() {
    viewController.init();
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Menu,
        showNotifications: false,
      ),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: MezSideMenu(),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ServiceWaitingForApproval(),
      ),
    );
  }
}
