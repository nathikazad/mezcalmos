import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/helpers/GeneralPurposeHelper.dart';
import 'package:mez_services_web_app/helpers/setUpHelper.dart';
import 'package:mez_services_web_app/routes/AppRoutes.dart';
import 'package:mez_services_web_app/screens/resturentListView/components/RestaurantShimmerList.dart';
import 'package:mez_services_web_app/screens/resturentListView/components/restaurantCardForDesktopAndTablet.dart';
import 'package:mez_services_web_app/screens/resturentListView/components/restaurantCardForMobile.dart';
import 'package:mez_services_web_app/screens/resturentListView/controller/ListRestaurantController.dart';
import 'package:mez_services_web_app/services/values/constants.dart';
import 'package:mez_services_web_app/services/widgets/mezCalmosResizer.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../components/installAppBarComponent.dart';

class RestaurantsListView extends StatefulWidget {
  RestaurantsListView({Key? key}) : super(key: key);

  @override
  State<RestaurantsListView> createState() => _RestaurantsListViewState();
}

class _RestaurantsListViewState extends State<RestaurantsListView> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: InstallAppBarComponent(),
    //   body: ,
    // );
    return FutureBuilder<bool>(
        future: setupFirebase(
            launchMode: typeMode.toLaunchMode(),
            func: () {
              Get.put<ListRestaurantsController>(ListRestaurantsController());
            }),
        builder: (context, snapShot) {
          if (snapShot.hasData && snapShot.data == true) {
            final LanguageController Lcontroller =
                Get.find<LanguageController>();
            ListRestaurantsController viewController =
                ListRestaurantsController();
            return Scaffold(
                appBar: InstallAppBarComponent(),
                body: LayoutBuilder(
                  builder: (context, constraints) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text(
                          "Restaurants",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            color: Colors.black,
                          )),
                        ),
                        centerTitle: true,
                      ),
                      body: SingleChildScrollView(
                        child: Column(
                          children: [
                            _searchInput(context),
                            _sortingSwitcher(context),
                            _restaurantList(context)
                            //  buildListOFCardsForDesktopAndTablet(context)
                          ],
                        ),
                      ),
                    );
                  },
                ));
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }

  Widget _restaurantList(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.width - kToolbarHeight - 24) / 4;
    final double itemWidth = size.width / 4;
    var viewController = Get.find<ListRestaurantsController>();

    return Obx(() {
      if (viewController.isLoading.value) {
        return Column(
          children: List.generate(10, (int index) => RestaurantShimmerCard()),
        );
      } else {
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
                childAspectRatio: 1.05,
              ),
              itemCount: viewController.filteredRestaurants.length,
              itemBuilder: (BuildContext context, int index) {
                return RestaurantCardForDesktopAndTablet(
                  shippingPrice: viewController.baseShippingPrice,
                  onClick: () {
                    QR.to(
                      "/restaurants/${viewController.filteredRestaurants[index].info.id}",
                    );
                  },
                  restaurant: viewController.filteredRestaurants[index],
                );
              },
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    MezCalmosResizer.getWepPageHorizontalPadding(context)),
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return RestaurantCardForMobile(
                  restaurant: viewController.filteredRestaurants[index],
                  shippingPrice: viewController.baseShippingPrice,
                  onClick: () {
                    QR.to(
                      "/restaurants/${viewController.filteredRestaurants[index].info.id}",
                    );
                    ;
                  },
                );
              },
              itemCount: viewController.filteredRestaurants.length,
            ),
          );
        }
      }
    });
  }

  Widget _sortingSwitcher(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();
    var viewController = Get.find<ListRestaurantsController>();
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(
            horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context)),
        child: SwitchListTile(
          value: viewController.showOnlyOpen.value,
          onChanged: (bool v) {
            viewController.changeAlwaysOpenSwitch(v);
            viewController.filterRestaurants();
          },
          activeColor: primaryBlueColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          title: Obx(
            () => Text(
              lang.strings["CustomerApp"]["pages"]["Restaurants"]
                      ["ListRestaurantsScreen"]["ListRestaurantScreen"]
                  ["showOnlyOpen"],
              style: Get.textTheme.bodyText2
                  ?.copyWith(fontWeight: FontWeight.w700, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchInput(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context),
        vertical: 20,
      ),
      child: Obx(
        () => TextFormField(
            textAlignVertical: TextAlignVertical.center,
            style: Get.textTheme.bodyText1!.copyWith(fontSize: 13),
            onChanged: (String value) {
              print("this is a test");
              // viewController.searchQuery.value = value;
              // viewController.filterRestaurants();
              // mezDbgPrint(viewController.searchQuery);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 8.0),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey.shade300,
              ),
              hintStyle: TextStyle(color: Colors.grey.shade300, fontSize: 13),
              hintText: lang.strings["CustomerApp"]["pages"]["Restaurants"]
                  ["ListRestaurantsScreen"]["ListRestaurantScreen"]["search"],
            )),
      ),
    );
  }
}
