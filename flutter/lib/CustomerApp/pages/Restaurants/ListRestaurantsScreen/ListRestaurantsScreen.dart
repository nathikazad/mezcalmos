import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/components/FloatingCartComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/components/RestaurandCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/components/RestaurantShimmerList.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/controllers/ListRestaurantController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:sizer/sizer.dart';

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
            children: [
              _searchInput(),
              _searchFilter(),
              _sortingSwitcher(),
              Obx(() {
                if (viewController.byRestaurants)
                  return _restaurantList();
                else
                  return Column(
                    children: List.generate(
                        viewController.filteredItems.length,
                        (int index) =>
                            _itemCard(viewController.filteredItems[index])),
                  );
              })
            ],
          )),
    );
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
                              "Meal",
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
          return Container();
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
              shippingPrice: viewController.baseShippingPrice,
              onClick: () {
                Get.toNamed<void>(
                  getRestaurantRoute(
                      viewController.filteredRestaurants[index].info.id),
                  arguments: viewController.filteredRestaurants[index],
                );
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
            color: Colors.grey.shade300,
          ),
          hintStyle: TextStyle(
            color: Colors.grey.shade300,
          ),
          hintText: "${_i18n()["search"]}"),
    );
  }

  Widget _itemCard(Item item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 7),
      child: InkWell(
        onTap: () {
          if (item.restaurant != null && item.id != null) {
            Get.toNamed(
              getItemRoute(item.restaurant!.info.id, item.id!),
              arguments: {
                "mode": ViewItemScreenMode.AddItemMode,
                "showViewRestaurant": true
              },
            );
          }
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          height: 16.h,
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      item.name[userLanguage]!,
                      maxLines: 2,
                      style: Get.textTheme.headline3?.copyWith(fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      item.cost.toPriceString(),
                      style: Get.textTheme.headline3?.copyWith(fontSize: 14.sp),
                    ),
                    Spacer(),
                    Divider(
                      height: 8,
                    ),
                    if (item.restaurant != null)
                      Text(
                        item.restaurant!.info.name,
                        maxLines: 1,
                      )
                  ],
                ),
              ),
              if (item.image != null)
                CachedNetworkImage(
                  imageUrl: item.image!,
                  errorWidget: (BuildContext context, String url, error) {
                    return Container(
                      width: 30.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage(aNoImage), fit: BoxFit.cover)),
                    );
                  },
                  imageBuilder: (BuildContext context,
                      ImageProvider<Object> imageProvider) {
                    return Container(
                      width: 30.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    );
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}
