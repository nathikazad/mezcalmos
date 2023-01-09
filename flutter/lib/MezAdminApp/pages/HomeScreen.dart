import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/components/BottomNavBar.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminMessagesListScreen.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServiceProvidersListScreen.dart';
import 'package:mezcalmos/MezAdminApp/pages/Orders/CurrentDeliveryOrdersList.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServiceProfile/ServiceProfile.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  RxnInt _specificProviderId = RxnInt();

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
              title = "Services";
            });
            break;
          case 2:
            setState(() {
              title = "Messages";
            });
            break;
          case 3:
            setState(() {
              title = "Profile";
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
            MezAdminBottomNavBar(tabController: _tabController),
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
            Obx(
              () => ListDeliveryOrdersTabView(
                  specificServiceId: _specificProviderId.value),
            ),

            // Drivers ---------
            ServiceProvidersListScreen(
              onOrdersClick: (int serviceId) {
                setState(() {
                  _specificProviderId.value = serviceId;
                });
                _tabController.animateTo(0);
              },
            ),
            // Cost
            AdminMessagesListScreen(),
            // company profile
            ServiceProfileScreen(),
          ],
        ),
      ),
    );
  }
}
