import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class SideMenuDrawerController extends GetxController {
  GlobalKey<ScaffoldState>? _scaffoldKey;
  List<SideMenuItem>? sideMenuItems;
  String? pastOrdersRoute;

  GlobalKey<ScaffoldState>? getNewKey() {
    _scaffoldKey =
        new GlobalKey<ScaffoldState>(debugLabel: '___ScaffoldStateKey___');

    return _scaffoldKey;
  }

  @override
  void onInit() {
    super.onInit();

    mezDbgPrint(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<< [ SideMenuDrawerController Initialized ] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
  }

  void openMenu() {
    mezDbgPrint("Openning side menu");
    if (_scaffoldKey?.currentState?.isEndDrawerOpen == false) {
      mezDbgPrint("Openning side menu");
      _scaffoldKey?.currentState?.openDrawer();
    } else {
      _scaffoldKey?.currentState?.openEndDrawer();
    }
  }

  void closeMenu() {
    _scaffoldKey?.currentState?.openEndDrawer();
  }

  @override
  void onClose() {
    mezDbgPrint(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<< [ SideMenuDrawerController Closed ] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    super.onClose();
  }
}
