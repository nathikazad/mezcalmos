import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/ROpMenuView.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/ROpCurrentOrders.dart';
import 'package:mezcalmos/RestaurantApp/pages/TabsView/controllers/ROpTabsViewViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceProfileView/ServiceProfileView.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpTabsViewView'];

class ROpTabsViewView extends StatefulWidget {
  const ROpTabsViewView({super.key});

  @override
  State<ROpTabsViewView> createState() => _ROpTabsViewViewState();
}

class _ROpTabsViewViewState extends State<ROpTabsViewView> {
  RestaurantOpAuthController opAuthController =
      Get.find<RestaurantOpAuthController>();
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
        if (opAuthController.restaurantId != null) {
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
        return ROpCurrentOrdersListView(
          canGoBack: false,
        );

      case 1:
        return ROpMenuView(
          restID: opAuthController.restaurantId!,
          canGoBack: false,
        );
      case 2:
        return ServiceProfileView(
          serviceId: opAuthController.restaurantId,
          serviceDetailsId:
              opAuthController.operator.value!.state.serviceProviderDetailsId,
          deliveryDetailsId:
              opAuthController.operator.value!.state.deliveryDetailsId,
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
              selectedLabelStyle: context.txt.bodyLarge,
              unselectedLabelStyle: context.txt.bodyMedium,
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
                    icon: Icon(Icons.flatware),
                    label: '${_i18n()["menu"]}',
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
