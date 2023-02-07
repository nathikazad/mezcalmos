import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryOpAuthController.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/LaundryOpAdminView.dart';
import 'package:mezcalmos/LaundryApp/pages/OrdersListViews/LaundryOpCurrentOrders.dart';
import 'package:mezcalmos/LaundryApp/pages/ProfileView/LaundryProfileView.dart';
import 'package:mezcalmos/RestaurantApp/pages/TabsView/controllers/ROpTabsViewViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['LaundryTabsView'];

class LaundryTabsView extends StatefulWidget {
  const LaundryTabsView({super.key});

  @override
  State<LaundryTabsView> createState() => _LaundryTabsViewState();
}

class _LaundryTabsViewState extends State<LaundryTabsView> {
  LaundryOpAuthController opAuthController =
      Get.find<LaundryOpAuthController>();
  ROpTabsViewViewController tabsViewViewController =
      ROpTabsViewViewController();
  @override
  void initState() {
    super.initState();
  }

  RxInt _index = RxInt(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _navBar(),
      body: Obx(() {
        if (opAuthController.laundryId != null) {
          return _getBody();
        } else {
          return MezLogoAnimation(
            centered: true,
          );
        }
      }),
    );
  }

  Widget _getBody() {
    switch (_index.value) {
      case 0:
        return LaundryOpCurrentOrdersListView(
          canGoBack: false,
        );
      case 2:
        return LaundryOpAdminView(
          laundryId: opAuthController.laundryId!,
        );
      case 3:
        return LaundryProfileView(
          laundryId: opAuthController.laundryId!,
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
    return Obx(
      () => tabsViewViewController.showTabs.value
          ? BottomNavigationBar(
              selectedLabelStyle: Get.textTheme.bodyLarge,
              unselectedLabelStyle: Get.textTheme.bodyMedium,
              currentIndex: _index.value,
              onTap: (int v) {
                _index.value = v;
              },
              type: BottomNavigationBarType.fixed,
              items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.history),
                    label: '${_i18n()["orders"]}',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.people),
                    label: '${_i18n()["feed"]}',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.checkroom),
                    label: '${_i18n()["services"]}',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: '${_i18n()["profile"]}',
                  ),
                ])
          : SizedBox(),
    );
  }
}
