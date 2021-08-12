import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenuDraweController extends GetxController {
  GlobalKey<ScaffoldState>? _scaffoldKey;

  GlobalKey<ScaffoldState>? getNewKey() {
    _scaffoldKey =
        new GlobalKey<ScaffoldState>(debugLabel: '___ScaffoldStateKey___');

    return _scaffoldKey;
  }

  @override
  void onInit() {
    print(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<< [ SideMenuDrawerController Initialized ] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    super.onInit();
  }

  void openMenu() {
    print("Opened menu  ${_scaffoldKey?.currentState?.toString()}! ");
    _scaffoldKey?.currentState?.openDrawer();
  }

  void cloeseMenu() {
    print("Closed menu!");
    _scaffoldKey?.currentState?.openEndDrawer();
  }

  @override
  void onClose() {
    print(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<< [ SideMenuDrawerController Closed ] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    super.onClose();
  }
}
