import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/controllers/mezAdminAuthController.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/MezAdminApp/pages/Orders/AdminOrdersListView.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/AdminServiceView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["MezAdmin"]["pages"]
    ['AdminTabsView'];

class AdminTabsView extends StatefulWidget {
  const AdminTabsView({super.key});

  @override
  State<AdminTabsView> createState() => _AdminTabsViewState();
}

class _AdminTabsViewState extends State<AdminTabsView>
    with TickerProviderStateMixin {
  MezAdminAuthController opAuthController = Get.find<MezAdminAuthController>();
  AdminTabsViewController viewController = AdminTabsViewController();
  @override
  void initState() {
    viewController.init(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          key: Get.find<SideMenuDrawerController>().getNewKey(),
          drawer: MezSideMenu(),
          bottomNavigationBar: _navBar(),
          appBar: _appBar(),
          body: _getBody()),
    );
  }

  Widget _getBody() {
    switch (viewController.bottomTabIndex.value) {
      case 0:
        return AdmiOrdersListView(
          adminTabsViewController: viewController,
        );
      case 1:
        return AdminServicesView(
          adminTabsViewController: viewController,
        );

      default:
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Text("Error"),
          ),
        );
    }
  }

  Widget _navBar() {
    return BottomNavigationBar(
        iconSize: 23,
        selectedLabelStyle: context.txt.bodyLarge,
        unselectedLabelStyle: context.txt.bodyMedium,
        selectedItemColor: primaryBlueColor,
        currentIndex: viewController.bottomTabIndex.value,
        onTap: (int v) {
          viewController.bottomTabIndex.value = v;
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: '${_i18n()["orders"]}',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service),
            label: '${_i18n()["services"]}',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sms),
            label: '${_i18n()["messages"]}',
          ),
        ]);
  }

  PreferredSizeWidget _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(viewController.getAppbarHeight),
      child: MezcalmosAppBar(
        AppBarLeftButtonType.Menu,
        title: viewController.getTitle(),
        showNotifications: true,
        tabBar: viewController.showAppBarTabs
            ? TabBar(
                //isScrollable: true,
                controller: viewController.appbarTabsController,
                labelColor: primaryBlueColor,
                unselectedLabelColor: Colors.grey.shade800,
                labelStyle: context.txt.bodyLarge,
                unselectedLabelStyle: context.txt.bodyMedium,
                onTap: (int value) {
                  viewController.selectedServiceProviderType.value =
                      viewController.serviceTypes[value];
                  //  viewController.selectedServiceProviderType.refresh();
                },
                tabs: List.generate(
                    viewController.serviceTypes.length,
                    (int index) => Tab(
                          child: Icon(
                            viewController.serviceTypes[index].toIcon(),
                          ),
                        )))
            : null,
      ),
    );
  }
}
