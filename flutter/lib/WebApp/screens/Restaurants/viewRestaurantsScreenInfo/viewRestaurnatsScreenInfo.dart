import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/WebApp/controllers/mezWebSideBarController.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/viewRestaurantsScreen/components/itemSliverAppBar.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/viewRestaurantsScreenInfo/components/restaurantInfoTabForDesktop.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/viewRestaurantsScreenInfo/components/restaurantInfoTabForMobile.dart';
import 'package:mezcalmos/WebApp/screens/components/installAppBarComponent.dart';
import 'package:mezcalmos/WebApp/screens/components/webAppBarComponent.dart';
import 'package:mezcalmos/WebApp/widgets/SideWebBarWidget/SideWebBarWidget.dart';
import 'package:mezcalmos/WebApp/widgets/mezBottomBar.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/widgets/mezLoaderWidget.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/webHelpers/setUpHelper.dart';

import 'package:qlevar_router/qlevar_router.dart';

final df = new DateFormat('hh:mm a');

class ViewRestaurantsScrennInfo extends StatefulWidget {
  const ViewRestaurantsScrennInfo({Key? key}) : super(key: key);

  @override
  State<ViewRestaurantsScrennInfo> createState() =>
      _ViewRestaurantsScrennInfoState();
}

class _ViewRestaurantsScrennInfoState extends State<ViewRestaurantsScrennInfo> {
  Restaurant? restaurant;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final FirbaseAuthController _authcontroller =
      Get.find<FirbaseAuthController>();

  @override
  void didChangeDependencies() {
    _getRestaurant();
    super.didChangeDependencies();
  }

  void _getRestaurant() async {
    setupFirebase(launchMode: typeMode.toLaunchMode()).then((value) {
      Get.find<RestaurantsInfoController>()
          .getRestaurant(QR.params['id'].toString())
          .then((value) {
        if (value != null) {
          setState(() {
            restaurant = value;

            print("this is another test ${restaurant?.toJson()}");
          });
        } else {
          QR.to("/404");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("the restaurant id is ${QR.params['id'].toString()}");
    return FutureBuilder<bool>(
        future: setupFirebase(launchMode: typeMode.toLaunchMode()),
        builder: (context, snapShot) {
          if (snapShot.hasData && snapShot.data == true) {
            final LanguageController Lcontroller =
                Get.find<LanguageController>();

            final MezWebSideBarController drawerController =
                Get.find<MezWebSideBarController>();

            return Scaffold(
              key: drawerController.getNewKey(),
              drawer: drawerController.frontDrawerContent,
              endDrawer: drawerController.endDrawerContent,
              appBar: InstallAppBarComponent(),
              bottomNavigationBar: MezBottomBar(),
              body: LayoutBuilder(builder: ((context, constraints) {
                return (restaurant != null)
                    ? Scaffold(
                        appBar: WebAppBarComponent(
                          automaticallyGetBack:
                              (MezCalmosResizer.isMobile(context) ||
                                      MezCalmosResizer.isSmallMobile(context))
                                  ? false
                                  : true,
                          type: _authcontroller.fireAuthUser?.uid != null
                              ? WebAppBarType.WithCartActionButton.obs
                              : WebAppBarType.WithSignInActionButton.obs,
                        ),
                        body: CustomScrollView(
                          slivers: [
                            ItemSliverAppBar(
                              urlImg: "${restaurant!.info.image}",
                            ),
                            SliverToBoxAdapter(
                                child: ((MezCalmosResizer.isMobile(context) ||
                                        (MezCalmosResizer.isSmallMobile(
                                            context)))
                                    ? RestaurantInfoTabForMobile(
                                        restaurant: restaurant!,
                                      )
                                    : RestaurantsInfoTapForDesktop(
                                        restaurant: restaurant,
                                      )))
                          ],
                        ),
                      )
                    : const Scaffold(
                        body: Center(
                          child: MezLoaderWidget(),
                        ),
                      );
              })),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: MezLoaderWidget(),
              ),
            );
          }
        });
  }
}
