import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/WebApp/widgets/EndWebSideBar.dart';
import 'package:mezcalmos/WebApp/widgets/SideWebBarWidget/SideWebBarWidget.dart';
import 'package:qlevar_router/qlevar_router.dart';

class MezWebSideBarController {
  GlobalKey<ScaffoldState> drawerKey = new GlobalKey<ScaffoldState>(
      debugLabel: '${Random().nextDouble() * 250}');

  final Widget frontDrawerContent = SideWebBar();
  final Widget endDrawerContent = EndWebSideBar();

  void openWebDrawer() {
    mezDbgPrint("🚪 ===> the drawer just opend");
    try {
      drawerKey.currentState!.openDrawer();
    } catch (e) {
      mezDbgPrint('🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺 ${e.toString()}');
    }
  }

  void openWebEndDrawer() {
    mezDbgPrint("🚪 ===> the end  drawer just opend");
    drawerKey.currentState!.openEndDrawer();
  }

  void closeWebDrawer() {
    mezDbgPrint("🚪 ===> the drawer just closed");
    drawerKey.currentState!.closeDrawer();
  }

  void closeWebEndDrawer() {
    mezDbgPrint("🚪 ===> the end drawer just closed");
    drawerKey.currentState!.closeEndDrawer();
  }
}
