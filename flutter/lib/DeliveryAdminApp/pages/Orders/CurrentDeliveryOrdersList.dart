import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/BottomNavBar.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class CurrentDeliveryOrdersListView extends StatefulWidget {
  const CurrentDeliveryOrdersListView({super.key});

  @override
  State<CurrentDeliveryOrdersListView> createState() =>
      _CurrentDeliveryOrdersListViewState();
}

class _CurrentDeliveryOrdersListViewState
    extends State<CurrentDeliveryOrdersListView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: DeliveryOpBottomNavBar(),
        appBar: mezcalmosAppBar(
          AppBarLeftButtonType.Menu,
          title: "Orders",
          showNotifications: true,
          autoBack: false,
        ),
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        body: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
