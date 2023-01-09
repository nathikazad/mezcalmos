import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/components/SearchItemCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/resturentListView/components/restaurantCardForDesktopAndTablet.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/resturentListView/components/restaurantCardForMobile.dart';
import 'package:mezcalmos/WebApp/webHelpers/StringHelper.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/widgets/mezLoaderWidget.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../../CustomerApp/pages/Restaurants/ListRestaurantsScreen/controllers/ListRestaurantController.dart';
import '../../../../values/constants.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ListRestaurantsScreen"]["ListRestaurantScreen"];

class ListRestauBody extends StatefulWidget {
  ListRestauBody({Key? key, required this.viewController}) : super(key: key);
  final ListRestaurantsController viewController;

  @override
  State<ListRestauBody> createState() => _ListRestauBodyState();
}

class _ListRestauBodyState extends State<ListRestauBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            _searchInput(context),
            _searchFilter(),
            _sortingSwitcher(),
            Obx(() {
              if (widget.viewController.byRestaurants)
                return _restaurantList();
              else
                return _searchedItemsList();
            })
          ],
        ));
  }

  Widget _searchedItemsList() {
    if (widget.viewController.filteredItems.isNotEmpty) {
      return Column(
        children: List.generate(
            widget.viewController.filteredItems.length,
            (int index) => SearchItemCard(
                item: widget.viewController.filteredItems[index])),
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

  Widget _searchInput(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();

    // lang.changeLangForWeb(LanguageType.ES);
    // lang.update();
    var viewController = Get.find<ListRestaurantsController>();
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context) + 10,
        vertical: 20,
      ),
      child: Obx(
        () => TextFormField(
            textAlignVertical: TextAlignVertical.center,
            style: Get.textTheme.bodyText1!.copyWith(fontSize: 13),
            onChanged: (String value) {
              viewController.searchQuery.value = value;
              viewController.filter();
              mezDbgPrint(viewController.searchQuery);
              // print("this is a test");
              // viewController.searchQuery.value = value;
              // viewController.filter();
              // print(viewController.searchQuery);
            },
            decoration: InputDecoration(
              contentPadding: (MezCalmosResizer.isMobile(context) ||
                      MezCalmosResizer.isSmallMobile(context))
                  ? EdgeInsets.only(top: 3.0)
                  : EdgeInsets.only(top: 10.0),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              hintStyle: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.black, fontSize: 13)),
              hintText: lang.strings["CustomerApp"]["pages"]["Restaurants"]
                  ["ListRestaurantsScreen"]["ListRestaurantScreen"]["search"],
            )),
      ),
    );
  }

  Widget _restaurantList() {
    var size = MediaQuery.of(context).size;
    var t = int.parse(
        ((size.width - kToolbarHeight - 24 / Get.height) / size.width * 0.4)
            .toStringAsFixed(2)
            .split('.')[1]);
    var x = double.parse(
      ("1." + (t).toString()),
    );
    print("this is the resualt $x");
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.width - kToolbarHeight - 24) / 6;
    final double itemWidth = size.width / 3;

    return Obx(() {
      if (widget.viewController.isLoading.value) {
        if (MezCalmosResizer.isSmallMobile(context) ||
            MezCalmosResizer.isMobile(context)) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context),
            ),
            child: Container(
                child: Center(
              child: MezLoaderWidget(),
            )),
            // child: Column(
            //   children:
            //       List.generate(10, (int index) => RestaurantShimmerCard()),
            // ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    MezCalmosResizer.getWepPageHorizontalPadding(context)),

            child: Container(
                child: Center(
              child: MezLoaderWidget(),
            )),
            // child: GridView.count(
            //   shrinkWrap: true,
            //   crossAxisCount: MezCalmosResizer.isSmallTablet(context) ? 2 : 3,
            //   childAspectRatio: x,
            //   children:
            //       List.generate(10, (int index) => RestaurantShimmerGrid()),
            // ),
          );
        }
      } else if (widget.viewController.filteredRestaurants.isNotEmpty) {
        if (MezCalmosResizer.isDesktop(context) ||
            MezCalmosResizer.isSmallTablet(context) ||
            MezCalmosResizer.isTablet(context)) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    MezCalmosResizer.getWepPageHorizontalPadding(context)),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MezCalmosResizer.isSmallTablet(context) ? 2 : 3,
                childAspectRatio: x,
              ),
              //itemCount: viewController.filteredRestaurants.length,
              itemCount: widget.viewController.filteredRestaurants.length,
              itemBuilder: (BuildContext context, int index) {
                return RestaurantCardForDesktopAndTablet(
                  shippingPrice: widget.viewController.baseShippingPrice,
                  onClick: () {
                    QR.to(
                      "/restaurants/${widget.viewController.filteredRestaurants[index].info.hasuraId}${getLangParam()}",
                    );
                  },
                  restaurant: widget.viewController.filteredRestaurants[index],
                );
              },
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    MezCalmosResizer.getWepPageHorizontalPadding(context) + 5),
            child: ListView.builder(
              // controller: controller,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return RestaurantCardForMobile(
                  restaurant: widget.viewController.filteredRestaurants[index],
                  shippingPrice: widget.viewController.baseShippingPrice,
                  onClick: () {
                    QR.to(
                      "/restaurants/${widget.viewController.filteredRestaurants[index].info.hasuraId}${getLangParam()}",
                    );
                    ;
                  },
                );
              },
              itemCount: widget.viewController.filteredRestaurants.length,
            ),
          );
        }
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   "assets/images/customer/restaurants/noOpenRestaurants.png",
            //   height: 50.h,
            //   width: 80.w,
            // ),
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
        value: widget.viewController.showOnlyOpen.value,
        onChanged: (bool v) {
          widget.viewController.changeAlwaysOpenSwitch(v);
          widget.viewController.filter();
          setState(() {});
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

  Widget _searchFilter() {
    return Obx(
      () {
        if (widget.viewController.showFilters) {
          return Container(
            margin: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Flexible(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      widget.viewController
                          .switchSearchType(SearchType.searchByRestaurantName);
                    },
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      decoration: BoxDecoration(
                          color: (widget.viewController.byRestaurants)
                              ? primaryBlueColor
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(18)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.flatware,
                            color: !widget.viewController.byRestaurants
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
                                color: !widget.viewController.byRestaurants
                                    ? Colors.grey.shade700
                                    : Colors.white,
                              ),
                            ),
                          ),
                          Icon(
                            widget.viewController.byRestaurants
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            color: !widget.viewController.byRestaurants
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
                      widget.viewController
                          .switchSearchType(SearchType.searchByItemName);
                    },
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      decoration: BoxDecoration(
                          color: (!widget.viewController.byRestaurants)
                              ? primaryBlueColor
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(18)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.fastfood,
                            color: widget.viewController.byRestaurants
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
                                color: widget.viewController.byRestaurants
                                    ? Colors.grey.shade700
                                    : Colors.white,
                              ),
                            ),
                          ),
                          Icon(
                            !widget.viewController.byRestaurants
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            color: widget.viewController.byRestaurants
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
}
