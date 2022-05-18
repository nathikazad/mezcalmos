import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/components/FloatingCartComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/components/RestaurandCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/components/RestaurantShimmerList.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/controllers/ListRestaurantController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ListRestaurantsScreen"]["ListRestaurantScreen"];

class ListRestaurantsScreen extends StatefulWidget {
  const ListRestaurantsScreen({Key? key}) : super(key: key);

  @override
  _ListRestaurantsScreenState createState() => _ListRestaurantsScreenState();
}

class _ListRestaurantsScreenState extends State<ListRestaurantsScreen> {
  /// RestaurantsInfoController

  ListRestaurantsController viewController = ListRestaurantsController();
  @override
  void initState() {
    // TODO: implement initState
    viewController.init();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppBar(
        title: "${_i18n()['restaurants']}",
        autoBack: true,
      ),
      floatingActionButton: FloatingCartComponent(),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [_searchInput(), _sortingSwitcher(), _restaurantList()],
          )),
    );
  }

  Widget _restaurantList() {
    return Obx(() {
      if (viewController.isLoading.value) {
        return Column(
          children: List.generate(10, (int index) => RestaurantShimmerCard()),
        );
      } else {
        return Column(
          children: List.generate(
              viewController.getData().length,
              (int index) => RestaurantCard(
                    restaurant: viewController.getData()[index],
                    onClick: () {
                      Get.toNamed<void>(
                        getRestaurantRoute(
                            viewController.getData()[index].info.id),
                        arguments: viewController.getData()[index],
                      );
                    },
                  )),
        );
      }
    });
  }

  Widget _sortingSwitcher() {
    return Obx(
      () => SwitchListTile(
        value: viewController.showOnlyOpen.value,
        onChanged: (bool v) {
          viewController.switchOnlyOpen();
        },
        activeColor: customerAppColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        title: Text("Show only open restaurents"),
      ),
    );
  }

  Widget _searchInput() {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      style: Get.textTheme.bodyText1,
      onChanged: (String value) {
        viewController.searchRestaurant(value);

        mezDbgPrint(viewController.searchQuerry);
      },
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.search), hintText: "Search restaurants"),
    );
  }
}
