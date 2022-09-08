import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/controllers/restaurantsInfoController.dart';
import 'package:mez_services_web_app/helpers/GeneralPurposeHelper.dart';
import 'package:mez_services_web_app/helpers/setUpHelper.dart';
import 'package:mez_services_web_app/models/Schedule.dart';
import 'package:mez_services_web_app/models/Services/Restaurant.dart';
import 'package:mez_services_web_app/screens/components/installAppBarComponent.dart';
import 'package:mez_services_web_app/screens/viewRestaurantsScreen/components/itemSliverAppBar.dart';
import 'package:mez_services_web_app/screens/viewRestaurantsScreenInfo/components/restaurantInfoTabForDesktop.dart';
import 'package:mez_services_web_app/screens/viewRestaurantsScreenInfo/components/restaurantInfoTabForMobile.dart';
import 'package:mez_services_web_app/services/values/constants.dart';
import 'package:mez_services_web_app/services/widgets/mezCalmosResizer.dart';
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
        setState(() {
          restaurant = value;
        });
      });

      print("this is another test ${restaurant?.toJson()}");
    });
  }

  void test() {
    //     .entries
    //     .map((MapEntry<String, OpenHours> v) {
    //   print("this is a test ${v.toString()}");
    // });
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

            return Scaffold(
              appBar: InstallAppBarComponent(),
              body: LayoutBuilder(builder: ((context, constraints) {
                return (restaurant != null)
                    ? CustomScrollView(
                        slivers: [
                          ItemSliverAppBar(
                            urlImg: "${restaurant!.info.image}",
                          ),
                          SliverToBoxAdapter(
                              child: ((MezCalmosResizer.isMobile(context) ||
                                      (MezCalmosResizer.isSmallMobile(context)))
                                  ? RestaurantInfoTabForMobile(
                                      restaurant: restaurant!,
                                    )
                                  : RestaurantsInfoTapForDesktop(
                                      restaurant: restaurant,
                                    )))
                        ],
                      )
                    : const Scaffold(
                        body: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
              })),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
