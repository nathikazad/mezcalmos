import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenuDraweController extends GetxController {

GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();


  void openMenu()
  {
      print("Opened menu!"+scaffoldKey.currentState.toString());
      scaffoldKey.currentState?.openDrawer();
  }

  void cloeseMenu()
   {
    print("Closed menu!");
    scaffoldKey.currentState?.openEndDrawer();
   }
}

