import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class SideMenuDraweController extends GetxController {
  GlobalKey<ScaffoldState>? _scaffoldKey;

  GlobalKey<ScaffoldState>? getNewKey() {
    _scaffoldKey =
        new GlobalKey<ScaffoldState>(debugLabel: '___ScaffoldStateKey___');

    return _scaffoldKey;
  }

  @override
  void onInit() {
    mezDbgPrint(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<< [ SideMenuDrawerController Initialized ] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    super.onInit();
  }

  void openMenu() {
    mezDbgPrint("Opened menu  ${_scaffoldKey?.currentState?.toString()}! ");
    _scaffoldKey?.currentState?.openDrawer();
  }

  void cloeseMenu() {
    mezDbgPrint("Closed menu!");
    _scaffoldKey?.currentState?.openEndDrawer();
  }

  @override
  void onClose() {
    mezDbgPrint(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<< [ SideMenuDrawerController Closed ] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    super.onClose();
  }
}
