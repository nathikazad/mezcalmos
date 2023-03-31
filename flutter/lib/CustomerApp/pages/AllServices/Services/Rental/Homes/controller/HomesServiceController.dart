import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../HomesServiceListView/HomesServiceListView.dart';
import 'package:flutter/material.dart';

enum HomeServiceView {
  Home,
  Agency,
}

class HomesServiceController {
  Rx<HomeServiceView> currentSelectedView = HomeServiceView.Home.obs;

  void toggleView(Enum value) {
    if (currentSelectedView.value == value) {
      return;
    }
    if (value == HomeServiceView.Home) {
      currentSelectedView.value = HomeServiceView.Home;
    } else {
      currentSelectedView.value = HomeServiceView.Agency;
    }
  }

  void dispose() {
    currentSelectedView.close();
  }
}
