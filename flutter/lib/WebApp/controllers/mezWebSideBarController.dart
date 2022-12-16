import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/WebApp/widgets/EndWebSideBar.dart';
import 'package:mezcalmos/WebApp/widgets/SideWebBarWidget/SideWebBarWidget.dart';

class MezWebSideBarController extends GetxController {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  final Widget frontDrawerContent = SideWebBar();
  final Widget endDrawerContent = EndWebSideBar();

  void openWebDrawer() {
    mezDbgPrint("🚪 ===> the drawer just opend");
    drawerKey.currentState!.openDrawer();
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
