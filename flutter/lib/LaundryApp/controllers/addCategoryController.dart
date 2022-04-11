import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/AddCategoryScreen/components/pages/AddCategoryPage.dart';

/*
* Created By Mirai Devs.
* On 4/11/2022.
*/

// ignore_for_file: constant_identifier_names
enum SelectedTab {
  English,
  Spanish,
}

class AddCategoryController extends GetxController {
  /// TextEditingController English
  final TextEditingController categoryNameControllerEnglish =
      TextEditingController();
  final TextEditingController categoryPricingControllerEnglish =
      TextEditingController();

  /// TextEditingController Spanish
  final TextEditingController categoryNameControllerSpanish =
      TextEditingController();
  final TextEditingController categoryPricingControllerSpanish =
      TextEditingController();

  /// Tabs
  List<Widget> tabs = <Widget>[];

  /// Pages
  List<Widget> tabPages = <Widget>[];

  /// TabController
  TabController? tabController;

  void getTabs() {
    tabs = <Tab>[
      Tab(
        text: SelectedTab.English.name,
      ),
      Tab(
        text: SelectedTab.Spanish.name,
      ),
    ];
  }

  void getTabPages() {
    tabPages = <Widget>[
      AddCategoryPage(
        categoryNameController: categoryNameControllerEnglish,
        categoryPricingController: categoryPricingControllerEnglish,
        selectedTab: SelectedTab.English,
      ),
      AddCategoryPage(
        categoryNameController: categoryNameControllerSpanish,
        categoryPricingController: categoryPricingControllerSpanish,
        selectedTab: SelectedTab.Spanish,
      ),
    ];
  }
}
