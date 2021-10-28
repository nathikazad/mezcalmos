import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/components/ItemComponent.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/CustomerApp/components/appbarComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';


class ListRestaurantsScreen extends StatefulWidget {
  @override
  _ListRestaurantsScreen createState() => _ListRestaurantsScreen();
}

class _ListRestaurantsScreen extends State<ListRestaurantsScreen> {
  RxList<Restaurant> restaurants = <Restaurant>[].obs;

  ListRestaurantsScreen() {
    RestaurantsInfoController controller =
        Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    controller.getRestaurants().then((value) {
      restaurants.value = value;
    });
  }

  Widget build(BuildContext context) {
    responsiveSize(context);
    return Scaffold(
        appBar: MezcalmosSharedWidgets.mezcalmosAppBar("back", () => Get.back(),
            actionIcons: [
              ActionIconsComponents.notificationIcon(),
              ActionIconsComponents.orderIcon()
            ]),
        // appBar: AppBar(
        //   title: Text("Restaurant list"),
        //   actions: [
        //     TextButton(
        //         onPressed: () => Get.to(ViewCartScreen()), child: Text("Cart"))
        //   ],
        // ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              width: Get.width,
              child: Text("Restaurants",
                  style: TextStyle(
                      color: const Color(0xfd1d1d1d),
                      //fontWeight: FontWeight.w500,
                      fontFamily: "psr",
                      //fontStyle: FontStyle.normal,
                      fontSize: 40.0.sp),
                  textAlign: TextAlign.left),
            ),
            Expanded(
              child: Container(
                child: Obx(() => ListView(
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
                                Get.toNamed(getRestaurantRoute(restaurant.id!));
                              },
                            ))
                        .toList())),
              ),
            ),
          ],
        ));
  }
}
