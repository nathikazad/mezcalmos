import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class AdminTabsViewController {
// instances //

  late TabController appbarTabsController;
// vars//
  List<ServiceProviderType> serviceTypes = [
    ServiceProviderType.Restaurant,
    ServiceProviderType.Laundry,
    ServiceProviderType.Delivery_company
  ];
  // obs //
  Rx<ServiceProviderType> selectedServiceProviderType =
      Rx(ServiceProviderType.Restaurant);
  RxInt bottomTabIndex = RxInt(0);
// getters
  bool get showAppBarTabs =>
      bottomTabIndex.value == 0 || bottomTabIndex.value == 1;

  double get getAppbarHeight =>
      showAppBarTabs ? kToolbarHeight * 2 : kToolbarHeight;
  // methods //
  void init({required TickerProvider vsync}) {
    appbarTabsController =
        TabController(length: serviceTypes.length, vsync: vsync);
  }

  String getTitle() {
    switch (bottomTabIndex.value) {
      case 0:
        return "Orders";

        break;
      case 1:
        return "Services";

        break;
      case 2:
        return "Messages";

        break;
      default:
        return "";
    }
  }
}
