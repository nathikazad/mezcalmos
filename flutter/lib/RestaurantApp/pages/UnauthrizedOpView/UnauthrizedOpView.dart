import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/components/RestaurantOpDrawer.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/components/ROpWaitingForApproval.dart';
import 'package:mezcalmos/RestaurantApp/pages/UnauthrizedOpView/controllers/ROpUnauthorizedOpViewController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class ROpUnauthorizedOpView extends StatefulWidget {
  const ROpUnauthorizedOpView({super.key});

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
      appBar: mezcalmosAppBar(
        AppBarLeftButtonType.Menu,
        showNotifications: true,
      ),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: ROpDrawer(),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ROpWaitingForApproval(),
      ),
    );
  }
}
