import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/components/FloatingCartComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/components/RestaurandCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/components/RestaurantShimmerList.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/components/SearchItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/controllers/ListRestaurantController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ListRestaurantsScreen"]["ListRestaurantScreen"];

class ListRestaurantsScreen extends StatefulWidget {
  const ListRestaurantsScreen({Key? key, this.isRunningOnWeb = false})
      : super(key: key);
  //to check if the app running on web
  final bool? isRunningOnWeb;

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
      floatingActionButton:
          widget.isRunningOnWeb! ? null : FloatingCartComponent(),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              _searchInput(),
              _searchFilter(),
              _sortingSwitcher(),
              Obx(() {
                if (viewController.byRestaurants)
                  return _restaurantList();
                else
                  return _searchedItemsList();
              })
            ],
          )),
    );
  }

  Widget _searchedItemsList() {
    if (viewController.filteredItems.isNotEmpty) {
      return Column(
        children: List.generate(
            viewController.filteredItems.length,
            (int index) =>
                SearchItemCard(item: viewController.filteredItems[index])),
      );
    } else {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              radius: 40,
              child: Icon(
                Icons.search_off_rounded,
                color: Colors.grey.shade600,
                size: 35,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              '${_i18n()["noItemTitle"]}',
              style: Get.textTheme.bodyText1,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${_i18n()["noItemDesc"]}',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
  }

  Widget _searchFilter() {
    return Obx(
      () {
        if (viewController.showFilters) {
          return Container(
            margin: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Flexible(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      viewController
                          .switchSearchType(SearchType.searchByRestaurantName);
                    },
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      decoration: BoxDecoration(
                          color: (viewController.byRestaurants)
                              ? primaryBlueColor
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(18)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.flatware,
                            color: !viewController.byRestaurants
                                ? Colors.grey.shade700
                                : Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              "Restaurants",
                              style: Get.textTheme.bodyText1?.copyWith(
                                color: !viewController.byRestaurants
                                    ? Colors.grey.shade700
                                    : Colors.white,
                              ),
                            ),
                          ),
                          Icon(
                            viewController.byRestaurants
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            color: !viewController.byRestaurants
                                ? Colors.grey.shade700
                                : Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      viewController
                          .switchSearchType(SearchType.searchByItemName);
                    },
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      decoration: BoxDecoration(
                          color: (!viewController.byRestaurants)
                              ? primaryBlueColor
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(18)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.fastfood,
                            color: viewController.byRestaurants
                                ? Colors.grey.shade700
                                : Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              '${_i18n()["meal"]}',
                              style: Get.textTheme.bodyText1?.copyWith(
                                color: viewController.byRestaurants
                                    ? Colors.grey.shade700
                                    : Colors.white,
                              ),
                            ),
                          ),
                          Icon(
                            !viewController.byRestaurants
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            color: viewController.byRestaurants
                                ? Colors.grey.shade700
                                : Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else
          return SizedBox();
      },
    );
  }

  Widget _restaurantList() {
    return Obx(() {
      if (viewController.isLoading.value) {
        return Column(
          children: List.generate(10, (int index) => RestaurantShimmerCard()),
        );
      } else if (viewController.filteredRestaurants.isNotEmpty) {
        return Column(
          children: List.generate(viewController.filteredRestaurants.length,
              (int index) {
            return RestaurantCard(
              restaurant: viewController.filteredRestaurants[index],
              shippingPrice: viewController
                      .filteredRestaurants[index].deliveryCost?.minimumCost ??
                  50,
              onClick: () {
                MezRouter.toNamed<void>(
                    getRestaurantRoute(
                      viewController.filteredRestaurants[index].info.hasuraId,
                    ),
                    arguments: {
                      "restaurant": viewController.filteredRestaurants[index]
                    });
              },
            );
          }),
        );
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/customer/restaurants/noOpenRestaurants.png",
              height: 50.h,
              width: 80.w,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '${_i18n()["noOpenRestaurant"]}',
              style: Get.textTheme.bodyText1,
            )
          ],
        );
      }
    });
  }

  Widget _sortingSwitcher() {
    return Obx(
      () => SwitchListTile(
        value: viewController.showOnlyOpen.value,
        onChanged: (bool v) {
          viewController.changeAlwaysOpenSwitch(v);
          viewController.filter();
        },
        activeColor: primaryBlueColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        title: Text(
          "${_i18n()["showOnlyOpen"]}",
          style: Get.textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _searchInput() {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      style: Get.textTheme.bodyText1,
      onChanged: (String value) {
        viewController.searchQuery.value = value;
        viewController.filter();
        mezDbgPrint(viewController.searchQuery);
      },
      decoration: InputDecoration(
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          hintText: "${_i18n()["search"]}"),
    );
  }
}
