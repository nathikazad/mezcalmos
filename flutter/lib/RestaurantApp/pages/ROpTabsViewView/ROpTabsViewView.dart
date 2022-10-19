import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/RestaurantApp/pages/CurrentOrdersList/ROpCurrentOrders.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/ROpDashboardView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/ROpMenuView.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class ROpTabsViewView extends StatefulWidget {
  const ROpTabsViewView({super.key});

  @override
  State<ROpTabsViewView> createState() => _ROpTabsViewViewState();
}

class _ROpTabsViewViewState extends State<ROpTabsViewView> {
  RestaurantOpAuthController opAuthController =
      Get.find<RestaurantOpAuthController>();
  @override
  void initState() {
    // Future.microtask(() {
    //   if (opAuthController.restaurantId != null) {
    //     Get.put(RestaurantInfoController(), permanent: false);
    //   }
    // });
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
        return ROpCurrentOrdersListView();

      case 1:
        return Scaffold();

      case 2:
        return ROpMenuView(
          restID: opAuthController.restaurantId!,
        );
      case 3:
        return ROpDashboardView(restID: opAuthController.restaurantId!);

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
      () => BottomNavigationBar(
          selectedLabelStyle: Get.textTheme.bodyText1,
          unselectedLabelStyle: Get.textTheme.bodyText2,
          currentIndex: _index.value,
          onTap: (int v) {
            _index.value = v;
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delivery_dining),
              label: "Drivers",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flatware),
              label: "Menu",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ]),
    );
  }
}
