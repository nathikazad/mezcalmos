import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/components/RestaurantOpDrawer.dart';
import 'package:mezcalmos/RestaurantApp/pages/UnauthrizedOpView/controllers/ROpUnauthorizedOpViewController.dart';
import 'package:mezcalmos/RestaurantApp/router/router.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/ServiceProviders/ServiceWaitingForApproval.dart';

class ROpUnauthorizedOpView extends StatefulWidget {
  const ROpUnauthorizedOpView({super.key});

  static Future<void> navigate() {
    return MezRouter.toPath(RestaurantAppRoutes.unAuthorizedRoute);
  }

  @override
  State<ROpUnauthorizedOpView> createState() => _ROpUnauthorizedOpViewState();
}

class _ROpUnauthorizedOpViewState extends State<ROpUnauthorizedOpView> {
  ROpUnauthorizedOpViewController viewController =
      ROpUnauthorizedOpViewController();

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
      drawer: ROpDrawer(),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ServiceWaitingForApproval(),
      ),
    );
  }
}
