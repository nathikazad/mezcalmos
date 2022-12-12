import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/RestaurantOperator.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class RestaurantWrapper extends StatefulWidget {
  @override
  _RestaurantWrapperState createState() => _RestaurantWrapperState();
}

class _RestaurantWrapperState extends State<RestaurantWrapper> {
  RestaurantOperator? restaurantOperator;

  @override
  void initState() {
    mezDbgPrint("RestaurantWrapper::init state");
    Future<void>.microtask(() async {
      mezDbgPrint("RestaurantWrapper::microtask handleState first time");
      await Get.find<RestaurantOpAuthController>().setupRestaurantOperator();
      restaurantOperator =
          Get.find<RestaurantOpAuthController>().operator.value;

      handleState(restaurantOperator);
    });
    super.initState();
  }

  void handleState(RestaurantOperator? operator) {
    mezDbgPrint(operator);

    if (operator == null) {
      Get.toNamed(kCreateRestaurant);
    } else {
      Get.toNamed(kTabsView);
    }
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("RestaurantWrapper:: build");
    return Scaffold(
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        backgroundColor: Colors.white,
        appBar: mezcalmosAppBar(AppBarLeftButtonType.Menu,
            onClick: () => Get.find<SideMenuDrawerController>().openMenu()),
        body: MezLogoAnimation(centered: true));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
