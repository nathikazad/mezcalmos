import 'dart:async';
import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/Shared/controllers/AuthController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/WebApp/controllers/mezWebSideBarController.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/resturentListView/components/RestaurantShimmerGrid.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/resturentListView/components/RestaurantShimmerList.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/resturentListView/components/listViewBody.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/resturentListView/components/restaurantCardForDesktopAndTablet.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/resturentListView/components/restaurantCardForMobile.dart';
import 'package:mezcalmos/WebApp/screens/components/installAppBarComponent.dart';
import 'package:mezcalmos/WebApp/screens/components/webAppBarComponent.dart';
import 'package:mezcalmos/WebApp/widgets/SideWebBarWidget/SideWebBarWidget.dart';
import 'package:mezcalmos/WebApp/widgets/mezBottomBar.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/widgets/mezLoaderWidget.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/webHelpers/StringHelper.dart';
import 'package:mezcalmos/WebApp/webHelpers/setUpHelper.dart';

import 'package:qlevar_router/qlevar_router.dart';

import '../../../../CustomerApp/pages/Restaurants/ListRestaurantsScreen/controllers/ListRestaurantController.dart';
import '../../../widgets/mezOverly.dart';

class RestaurantsListView extends StatefulWidget {
  RestaurantsListView({Key? key}) : super(key: key);

  @override
  State<RestaurantsListView> createState() => _RestaurantsListViewState();
}

class _RestaurantsListViewState extends State<RestaurantsListView> {
  Rx<bool> isControllerIntilized = false.obs;
  final ScrollController controller = ScrollController();
  final MezWebSideBarController mezWebSideBarController =
      MezWebSideBarController();

  ListRestaurantsController viewController = ListRestaurantsController();

  Future<bool> waitWhile2(Future<bool> test(),
      [Duration pollInterval = Duration.zero]) async {
    var completer = new Completer<bool>();
    check() async {
      var val = await test();
      if (val) {
        mezDbgPrint("the test is @@@@complate 😃😃😃😃😃😃😃 ${val}");
        completer.complete(true);
      } else {
        mezDbgPrint("the test is not @@@@complate 😃😃😃😃😃😃😃 ${val}");
        new Timer(pollInterval, check);
      }
    }

    check();
    return completer.future;
  }

  Future<bool> _InitillaizeAllControllers() async {
    return waitWhile2(() {
      return setupFirebase(
          launchMode: typeMode.toLaunchMode(),
          func: () {
            Get.put<RestaurantsInfoController>(
              RestaurantsInfoController(),
              permanent: true,
            );
            //  Get.put<ListRestaurantsController>(ListRestaurantsController());
          });
    }, Duration(milliseconds: 500))
        .then((value) {
      mezDbgPrint("🔴🔴🔴🔴🔴🔴🔴🔴 the value@@@@@@ is $value");
      return value;
    });
  }

  @override
  void initState() {
    _InitillaizeAllControllers().then((value) {
      isControllerIntilized = true.obs;
      mezDbgPrint(
          " 🧪  🧪  🧪  🧪  🧪  @22222 the isControllerIntilized just changed ${isControllerIntilized.value}  🧪  🧪  🧪  🧪 ");
      viewController.init();
      setState(() {});

      return value;
    });
    // print("the current lang is ${QR.params["lang"]} ");
    // Get.put<LanguageController>(LanguageController());
    // mezDbgPrint(
    //     "]]]]]]]]]] inIt  resturants list 🍔 test 🧪  and time 📅 ${DateTime.now().toString()}");
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   mezDbgPrint(
    //       "]]]]]]]]]] build done resturants list 🍔 test 🧪  and time 📅 ${DateTime.now().toString()} and duration ${_.inMilliseconds}");
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    mezDbgPrint("this is just called list of restaurants 🔥");
    mezDbgPrint(
        "]]]]]]]]]] build  resturants list 🍔 test 🧪  and time 📅 ${DateTime.now().toString()}");
    mezDbgPrint(
        " 🛂🛂🛂🛂🛂🛂 the controller is intialized %} ${Get.isRegistered<AuthController>()}");
    // final AuthController _authcontroller = Get.put<AuthController>(
    //   AuthController(signInCallback, signOutCallback),
    //   permanent: true,
    // );
    final LanguageController Lcontroller = Get.find<LanguageController>();

    return Obx(
      () => (isControllerIntilized.value == true)
          ? Scaffold(
              key: mezWebSideBarController.drawerKey,
              endDrawer: mezWebSideBarController.endDrawerContent,
              drawer: mezWebSideBarController.frontDrawerContent,
              bottomNavigationBar: MezBottomBar(),
              appBar: InstallAppBarComponent(),
              // type:
              // leadingFunction: _authcontroller.isUserSignedIn != false
              //     ? () {
              //         _key.currentState!.openDrawer();
              //       }
              //     : null,

              body: Scaffold(
                  appBar: WebAppBarComponent(
                      mezWebSideBarController: mezWebSideBarController,
                      automaticallyGetBack: false,
                      type: Get.find<AuthController>().isUserSignedIn != false
                          ? WebAppBarType.WithCartActionButton.obs
                          : WebAppBarType.WithSignInActionButton.obs),
                  body: ListRestauBody(
                    viewController: viewController,
                  )),
            )
          : Scaffold(
              body: Center(child: MezLoaderWidget()),
            ),
    );
    //   return FutureBuilder<bool>(
    //       future: setupFirebase(
    //           launchMode: typeMode.toLaunchMode(),
    //           func: () {
    //             Get.put<ListRestaurantsController>(ListRestaurantsController());
    //           }),
    //       builder: (context, snapShot) {
    //         if (snapShot.hasData && snapShot.data == true) {

    //           //  MezPrint();
    //           mezDbgPrint(_authcontroller.fireAuthUser?.uid != null
    //               ? WebAppBarType.WithCartActionButton.toString()
    //               : WebAppBarType.WithSignInActionButton.toString());
    //           var xLang = QR.params["lang"].toString().contains("es")
    //               ? LanguageType.ES
    //               : LanguageType.EN;
    //           print("xLang is now ${xLang}");
    //           if (mounted) {
    //             Future.delayed(Duration(seconds: 1)).then((value) {
    //               Lcontroller.changeLangForWeb(xLang);
    //             });
    //           }
    //           ListRestaurantsController viewController =
    //               ListRestaurantsController();

    //           // return Scaffold(
    //           //   appBar: InstallAppBarComponent(),
    //           //   drawer: drawerController.frontDrawerContent,
    //           //   endDrawer: drawerController.endDrawerContent,
    //           //   //bottomNavigationBar: MezBottomBar(),
    //           // );

    //           return Scaffold(
    //               key: mezWebSideBarController.drawerKey,
    //               appBar: InstallAppBarComponent(),
    //               drawer: mezWebSideBarController.frontDrawerContent,
    //               endDrawer: mezWebSideBarController.endDrawerContent,
    //               bottomNavigationBar: MezBottomBar(),
    //               body: LayoutBuilder(
    //                 builder: (context, constraints) {
    //                   return
    //                       //  Obx(
    //                       //   () =>
    //                       Scaffold(

    //                     body: Scaffold(
    //                       //appBar: ,
    //                       appBar: AppBar(
    //                         leading: null,
    //                         automaticallyImplyLeading: false,
    //                         title: Obx(
    //                           () => Text(
    //                             Lcontroller.strings["CustomerApp"]["pages"]
    //                                     ["Restaurants"]["ListRestaurantsScreen"]
    //                                 ["ListRestaurantScreen"]["restaurants"],
    //                             style: GoogleFonts.montserrat(
    //                                 textStyle: TextStyle(
    //                               fontWeight: (MezCalmosResizer.isMobile(
    //                                           context) ||
    //                                       MezCalmosResizer.isSmallMobile(context))
    //                                   ? FontWeight.w500
    //                                   : FontWeight.w600,
    //                               fontSize: 17,
    //                               color: Colors.black,
    //                             )),
    //                           ),
    //                         ),
    //                         centerTitle: true,
    //                       ),

    //                       body: SingleChildScrollView(
    //                         controller: controller,
    //                         child: Column(
    //                           children: [
    //                             _searchInput(context),
    //                             _sortingSwitcher(context),
    //                             _restaurantList(context)
    //                             //  buildListOFCardsForDesktopAndTablet(context)
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                     // ),
    //                   );
    //                 },
    //               ));
    //         } else {
    //           return Scaffold(
    //             body: Center(child: MezLoaderWidget()),
    //           );
    //         }
    //       });
    // }

    // Widget _restaurantList(BuildContext context) {
    //   var size = MediaQuery.of(context).size;
    //   var t = int.parse(
    //       ((size.width - kToolbarHeight - 24 / Get.height) / size.width * 0.4)
    //           .toStringAsFixed(2)
    //           .split('.')[1]);
    //   var x = double.parse(
    //     ("1." + (t).toString()),
    //   );
    //   print("this is the resualt $x");
    //   /*24 is for notification bar on Android*/
    //   final double itemHeight = (size.width - kToolbarHeight - 24) / 6;
    //   final double itemWidth = size.width / 3;
    //   var viewController = Get.find<ListRestaurantsController>();

    //   return Obx(() {
    //     if (viewController.isLoading.value) {
    //       if (MezCalmosResizer.isSmallMobile(context) ||
    //           MezCalmosResizer.isMobile(context)) {
    //         return Padding(
    //           padding: EdgeInsets.symmetric(
    //             horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context),
    //           ),
    //           child: Container(
    //               child: Center(
    //             child: MezLoaderWidget(),
    //           )),
    //           // child: Column(
    //           //   children:
    //           //       List.generate(10, (int index) => RestaurantShimmerCard()),
    //           // ),
    //         );
    //       } else {
    //         return Padding(
    //           padding: EdgeInsets.symmetric(
    //               horizontal:
    //                   MezCalmosResizer.getWepPageHorizontalPadding(context)),

    //           child: Container(
    //               child: Center(
    //             child: MezLoaderWidget(),
    //           )),
    //           // child: GridView.count(
    //           //   shrinkWrap: true,
    //           //   crossAxisCount: MezCalmosResizer.isSmallTablet(context) ? 2 : 3,
    //           //   childAspectRatio: x,
    //           //   children:
    //           //       List.generate(10, (int index) => RestaurantShimmerGrid()),
    //           // ),
    //         );
    //       }
    //     } else {
    //       if (MezCalmosResizer.isDesktop(context) ||
    //           MezCalmosResizer.isSmallTablet(context) ||
    //           MezCalmosResizer.isTablet(context)) {
    //         return Padding(
    //           padding: EdgeInsets.symmetric(
    //               horizontal:
    //                   MezCalmosResizer.getWepPageHorizontalPadding(context)),
    //           child: GridView.builder(
    //             shrinkWrap: true,
    //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //               crossAxisCount: MezCalmosResizer.isSmallTablet(context) ? 2 : 3,
    //               childAspectRatio: x,
    //             ),
    //             //itemCount: viewController.filteredRestaurants.length,
    //             itemCount: viewController.filteredRestaurants.length,
    //             itemBuilder: (BuildContext context, int index) {
    //               return RestaurantCardForDesktopAndTablet(
    //                 shippingPrice: viewController.baseShippingPrice,
    //                 onClick: () {
    //                   QR.to(
    //                     "/restaurants/${viewController.filteredRestaurants[index].info.hasuraId}${getLangParam()}",
    //                   );
    //                 },
    //                 restaurant: viewController.filteredRestaurants[index],
    //               );
    //             },
    //           ),
    //         );
    //       } else {
    //         return Padding(
    //           padding: EdgeInsets.symmetric(
    //               horizontal:
    //                   MezCalmosResizer.getWepPageHorizontalPadding(context) + 5),
    //           child: ListView.builder(
    //             controller: controller,
    //             shrinkWrap: true,
    //             itemBuilder: (context, index) {
    //               return RestaurantCardForMobile(
    //                 restaurant: viewController.filteredRestaurants[index],
    //                 shippingPrice: viewController.baseShippingPrice,
    //                 onClick: () {
    //                   QR.to(
    //                     "/restaurants/${viewController.filteredRestaurants[index].info.hasuraId}${getLangParam()}",
    //                   );
    //                   ;
    //                 },
    //               );
    //             },
    //             itemCount: viewController.filteredRestaurants.length,
    //           ),
    //         );
    //       }
    //     }
    //   });
    // }

    // Widget _sortingSwitcher(BuildContext context) {
    //   LanguageController lang = Get.find<LanguageController>();
    //   var viewController = Get.find<ListRestaurantsController>();
    //   return Obx(
    //     () => Container(
    //       padding: (MezCalmosResizer.isMobile(context) ||
    //               MezCalmosResizer.isSmallMobile(context))
    //           ? EdgeInsets.symmetric(
    //               horizontal:
    //                   MezCalmosResizer.getWepPageHorizontalPadding(context))
    //           : EdgeInsets.symmetric(
    //               horizontal:
    //                   MezCalmosResizer.getWepPageHorizontalPadding(context)),
    //       child: SwitchListTile(
    //         value: viewController.showOnlyOpen.value,
    //         onChanged: (bool v) {
    //           viewController.changeAlwaysOpenSwitch(v);
    //           viewController.filterRestaurants();
    //         },
    //         activeColor: primaryBlueColor,
    //         contentPadding: const EdgeInsets.symmetric(horizontal: 5),
    //         title: Obx(
    //           () => Text(
    //             lang.strings["CustomerApp"]["pages"]["Restaurants"]
    //                     ["ListRestaurantsScreen"]["ListRestaurantScreen"]
    //                 ["showOnlyOpen"],
    //             style: GoogleFonts.montserrat(
    //                 fontSize: 14,
    //                 fontWeight: FontWeight.w600,
    //                 color: Color.fromRGBO(73, 73, 73, 1)),
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    // }

    // Widget _searchInput(BuildContext context) {
    //   LanguageController lang = Get.find<LanguageController>();

    //   // lang.changeLangForWeb(LanguageType.ES);
    //   // lang.update();
    //   var viewController = Get.find<ListRestaurantsController>();
    //   return Container(
    //     padding: EdgeInsets.symmetric(
    //       horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context) + 10,
    //       vertical: 20,
    //     ),
    //     child: Obx(
    //       () => TextFormField(
    //           textAlignVertical: TextAlignVertical.center,
    //           style: Get.textTheme.bodyText1!.copyWith(fontSize: 13),
    //           onChanged: (String value) {
    //             print("this is a test");
    //             viewController.searchQuery.value = value;
    //             viewController.filterRestaurants();
    //             print(viewController.searchQuery);
    //           },
    //           decoration: InputDecoration(
    //             contentPadding: (MezCalmosResizer.isMobile(context) ||
    //                     MezCalmosResizer.isSmallMobile(context))
    //                 ? EdgeInsets.only(top: 3.0)
    //                 : EdgeInsets.only(top: 10.0),
    //             prefixIcon: Icon(
    //               Icons.search,
    //               color: Colors.black,
    //             ),
    //             hintStyle: GoogleFonts.montserrat(
    //                 textStyle: TextStyle(color: Colors.black, fontSize: 13)),
    //             hintText: lang.strings["CustomerApp"]["pages"]["Restaurants"]
    //                 ["ListRestaurantsScreen"]["ListRestaurantScreen"]["search"],
    //           )),
    //     ),
    //   );
    // }
  }
}
