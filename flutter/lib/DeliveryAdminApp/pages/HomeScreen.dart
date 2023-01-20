import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/BottomNavBar.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryAdminAuth.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrdersListViews/DvOpCurrentOrders.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/ServiceProfile/ServiceProfile.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/DeliveryCostSetting/DeliveryCostSettingView.dart';
import 'package:mezcalmos/Shared/pages/ServiceDriversList/ServiceDriversListView.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar:
            DeliveryOpBottomNavBar(tabController: _tabController),
        appBar: mezcalmosAppBar(
          AppBarLeftButtonType.Menu,
          showNotifications: true,
          autoBack: false,
        ),
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        body: TabBarView(
          controller: _tabController,
          children: [
            // CURENT ORDERS TAB
            DvOpCurrentOrdersListView(
              canGoBack: false,
            ),

            // Drivers ---------
            ServiceDriversListView(
              serviceProviderId: Get.find<DeliveryOpAuthController>().companyId,
              serviceProviderType: ServiceProviderType.Delivery_company,
              showAppBar: false,
            ),
            // Cost
            DeliveryCostSettingView(
              serviceProviderId: Get.find<DeliveryOpAuthController>().companyId,
              serviceProviderType: ServiceProviderType.Delivery_company,
              showAppBar: false,
            ),
            // company profile
            ServiceProfileScreen(),
          ],
        ),
      ),
    );
  }
}
