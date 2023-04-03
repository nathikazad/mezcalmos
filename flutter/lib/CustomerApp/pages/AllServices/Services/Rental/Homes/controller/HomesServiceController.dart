import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../HomesListView/HomesListView.dart';
import 'package:flutter/material.dart';

enum HomeServiceViewEnum {
  Home,
  Agency,
}

class HomesServiceController {
  Rx<HomeServiceViewEnum> currentSelectedView = HomeServiceViewEnum.Home.obs;

  void toggleView(Enum value) {
    if (currentSelectedView.value == value) {
      return;
    }
    if (value == HomeServiceViewEnum.Home) {
      currentSelectedView.value = HomeServiceViewEnum.Home;
    } else {
      currentSelectedView.value = HomeServiceViewEnum.Agency;
    }
  }

  void dispose() {
    currentSelectedView.close();
  }
}
