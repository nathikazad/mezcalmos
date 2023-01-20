import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/BottomNavBar.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Drivers/CompanyDriversScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/CurrentDeliveryOrdersList.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/ServiceProfile/ServiceProfile.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/pages/DeliveryCostSetting/DeliveryCostSettingView.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  String title = "Orders";
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        switch (_tabController.index) {
          case 0:
            setState(() {
              title = "Orders";
            });
            break;

          case 1:
            setState(() {
              title = "Drivers";
            });
            break;
          case 2:
            setState(() {
              title = "Delivery Cost";
            });
            break;
          case 3:
            setState(() {
              title = "Service Profile";
            });
            break;
          default:
            break;
        }
      }
    });
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
          title: title,
          showNotifications: true,
          autoBack: false,
        ),
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        body: TabBarView(
          controller: _tabController,
          children: [
            // CURENT ORDERS TAB
            ListDeliveryOrdersTabView(),

            // Drivers ---------
            CompanyDriversScreen(),
            // Cost
            DeliveryCostSettingView(),
            // company profile
            ServiceProfileScreen(),
          ],
        ),
      ),
    );
  }
}
