import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/ItemComponent.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class ListRestaurantsScreen extends StatefulWidget {
  @override
  _ListRestaurantsScreenState createState() => _ListRestaurantsScreenState();
}

class _ListRestaurantsScreenState extends State<ListRestaurantsScreen> {
  LanguageController lang = Get.find<LanguageController>();
  List<Restaurant> restaurants = <Restaurant>[];
  RestaurantsInfoController _restaurantsInfoController =
      Get.put<RestaurantsInfoController>(RestaurantsInfoController());
  _ListRestaurantsScreenState() {
    _restaurantsInfoController.getRestaurants().then((value) {
      setState(() {
        restaurants = value;
      });
    });
  }

  Widget build(BuildContext context) {
    responsiveSize(context);
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: mezcalmosAppBar("back", () => Get.back(), actionIcons: [
          ActionIconsComponents.notificationIcon(),
          ActionIconsComponents.orderIcon()
        ]),
        body: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            width: Get.width,
            child: Text(
                "${lang.strings['customer']['restaurant']['restaurants']}",
                style: TextStyle(
                    color: const Color(0xfd1d1d1d),
                    fontFamily: "psr",
                    fontSize: 40.0.sp),
                textAlign: TextAlign.left),
          ),
          Expanded(
              child: Container(
                  child: ListView(
                      padding: const EdgeInsets.only(top: 10),
                      children: restaurants
                          .map((restaurant) => ItemComponent(
                                imgUrl: restaurant.photo!,
                                title: restaurant.name!,
                                restaurantId: restaurant.id!,
                                withBorder: true,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                onClick: () {
                                  Get.toNamed(
                                      getRestaurantRoute(restaurant.id!));
                                },
                              ))
                          .toList())))
        ]));
  }
}
