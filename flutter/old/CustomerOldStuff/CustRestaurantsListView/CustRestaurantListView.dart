import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/components/CustShowOnlyOpenService.dart';
import 'package:mezcalmos/CustomerApp/components/FloatingCartComponent.dart';
import 'package:mezcalmos/CustomerApp/components/MezServicesMapView.dart';
// import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessFilterSheet.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantView/CustRestaurantView.dart';
import 'package:mezcalmos/CustomerApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../CustomerOldStuff/CustRestaurantsListView/components/RestaurantCard.dart';
import '../../../../../../CustomerOldStuff/CustRestaurantsListView/components/RestaurantShimmerList.dart';
import '../../../../../../CustomerOldStuff/CustRestaurantsListView/components/SearchItemCard.dart';
import '../../../../../../CustomerOldStuff/CustRestaurantsListView/controllers/CustRestaurantListViewController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ListRestaurantsScreen"]["ListRestaurantScreen"];

class CustRestaurantListView extends StatefulWidget {
  const CustRestaurantListView({Key? key}) : super(key: key);
  static Future<void> navigate() {
    return MezRouter.toNamed(RestaurantRoutes.foodListRoute);
  }

  @override
  _CustRestaurantListViewState createState() => _CustRestaurantListViewState();
}

class _CustRestaurantListViewState extends State<CustRestaurantListView> {
  /// RestaurantsInfoController

  CustRestaurantListViewController viewController =
      CustRestaurantListViewController();

  @override
  void initState() {
    viewController.init(context: context);
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("${_i18n()['restaurants']}"),
        // ),
        // appBar: MezcalmosAppBar(
        //   AppBarLeftButtonType.Back,
        //   onClick: MezRouter.back,
        //   title: "${_i18n()['restaurants']}",
        // ),

        appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
            onClick: MezRouter.back,
            actionIcons: <Widget>[
              FloatingCartComponent(
                cartType: CartType.restaurant,
              ),
            ],
            titleWidget: Obx(() => Text(
                  viewController.isMapView
                      ? '${_i18n()['map']}'
                      : '${_i18n()['restaurants']}',
                ))),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => MezButton(
                width: 52.5.mezW,
                height: 42.5,
                onClick: () async {
                  viewController.switchView();
                },
                icon: viewController.isMapView ? Icons.list : Icons.room,
                label: viewController.isMapView
                    ? '${_i18n()['viewAsList']}'
                    : '${_i18n()['viewOnMap']}',
                borderRadius: 50,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Obx(() {
          if (viewController.isMapView) {
            return _mapView();
          }
          return SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _searchInput(),
                  _searchFilter(),
                  // _sortingSwitcher(),
                  _filterButton(context),
                  Obx(() {
                    if (viewController.isLoading.value) {
                      return const CircularProgressIndicator();
                    }
                    if (viewController.byRestaurants)
                      return Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: _restaurantList(),
                      );
                    else
                      return _searchedItemsList();
                  })
                ],
              ));
        }));
  }

  Widget _filterButton(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(top: 10),
      color: Color(0xFFF0F0F0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () async {
          // FilterInput? data = await cusShowBusinessFilerSheet(
          //     isRestaurant: true,
          //     context: context,
          //     filterInput: viewController.filterInput,
          //     defaultFilterInput: viewController.defaultFilters());
          // if (data != null) {
          //   viewController.filter(data);
          // }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.filter_alt,
                color: Colors.black,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${_i18n()['filter']}:',
              ),
              SizedBox(
                width: 3,
              ),
              Flexible(
                child: Text(
                  "${_i18n()["offerOnly"]}",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mapView() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Obx(() => CustSwitchOpenService(
                label: '${_i18n()["showOnlyOpenRestaurants"]}',
                showOnlyOpen: viewController.showOnlyOpenOnMap,
                onChange: (bool value) async {
                  await viewController.setOnlyOpenOnMap();
                },
              )),
          Obx(
            () => Expanded(
              child: MezServicesMapView(
                mGoogleMapController: viewController.mapController,
                fetchNewData: (LatLng? mapCenter, double? distance) async {
                  await viewController.fetchMapViewRentals(
                      fromLoc: mapCenter, distance: distance);
                  return viewController.restaurantsMarkers.toList();
                },
                markers: viewController.restaurantsMarkers.value,
              ),
            ),
          ),
        ]);
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
          children: <Widget>[
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
              style: context.txt.bodyLarge,
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
    // Padding(
    //   padding: const EdgeInsets.only(bottom: 5),
    //   child: Row(
    //     children: [
    //       Flexible(
    //         child: MezButton(
    //           label:
    //               '${_i18n()[viewController.rentalCategory.toFirebaseFormatString()]}',
    //           height: 35,
    //           onClick: () async {
    //             viewController.showBusiness.value = false;
    //           },
    //           icon: firstButtonIcon,
    //           borderRadius: 35,
    //           backgroundColor:
    //               viewController.showBusiness.isTrue ? Color(0xFFF0F0F0) : null,
    //           textColor: viewController.showBusiness.isTrue
    //               ? Colors.grey.shade800
    //               : null,
    //         ),
    //       ),
    //       SizedBox(
    //         width: 10,
    //       ),
    //       Flexible(
    //         child: MezButton(
    //           label: '${_i18n()['store']}',
    //           height: 35,
    //           onClick: () async {
    //             viewController.showBusiness.value = true;
    //           },
    //           icon: secondButtonIcon,
    //           borderRadius: 35,
    //           backgroundColor: viewController.showBusiness.isFalse
    //               ? Color(0xFFF0F0F0)
    //               : null,
    //           textColor: viewController.showBusiness.isFalse
    //               ? Colors.grey.shade800
    //               : null,
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    return Obx(() => Container(
          margin: const EdgeInsets.only(bottom: 10, top: 15),
          child: Row(
            children: <Widget>[
              Flexible(
                child: MezButton(
                  label: '${_i18n()["restaurants"]}',
                  height: 35,
                  onClick: () async {
                    viewController
                        .switchSearchType(SearchType.searchByRestaurantName);
                  },
                  icon: Icons.flatware,
                  borderRadius: 35,
                  backgroundColor:
                      !viewController.byRestaurants ? Color(0xFFF0F0F0) : null,
                  textColor: !viewController.byRestaurants
                      ? Colors.grey.shade800
                      : null,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Flexible(
                child: MezButton(
                  label: '${_i18n()["meals"]}',
                  height: 35,
                  onClick: () async {
                    viewController
                        .switchSearchType(SearchType.searchByItemName);
                  },
                  icon: Icons.fastfood,
                  borderRadius: 35,
                  backgroundColor:
                      viewController.byRestaurants ? Color(0xFFF0F0F0) : null,
                  textColor: viewController.byRestaurants
                      ? Colors.grey.shade800
                      : null,
                ),
              ),
            ],
          ),
        ));
  }

  Widget _restaurantList() {
    mezDbgPrint(viewController.filteredRestaurants.length);
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
              customerLocation: viewController.customerLocation,
              onClick: () => CustRestaurantView.navigate(
                restaurantId:
                    viewController.filteredRestaurants[index].info.hasuraId,
              ),
            );
          }),
        );
      } else {
        return Center(
          child: Column(
            children: <Widget>[
              //give space when its bigger size.
              SizedBox(
                height: 20,
              ),
              Container(
                child: Image.asset(
                  "assets/images/customer/restaurants/noOpenRestaurants.png",
                  height: 35.h,
                  width: 65.w,
                ),
              ),
              Text(
                '${_i18n()["noOpenRestaurant"]}',
                style: context.txt.bodyLarge,
              )
            ],
          ),
        );
      }
    });
  }

  // Widget _sortingSwitcher() {
  //   return Obx(() => CustSwitchOpenService(
  //         label: '${_i18n()["showOnlyOpenRestaurants"]}',
  //         showOnlyOpen: viewController.showOnlyOpen.value,
  //         onChange: (bool value) {
  //           viewController.changeAlwaysOpenSwitch(value);
  //           viewController.filter(viewController.filterInput);
  //         },
  //       ));
  // }

  Widget _searchInput() {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      style: context.txt.bodyLarge,
      onChanged: (String value) {
        viewController.searchQuery.value = value;
        viewController.filter(viewController.filterInput);
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
}
