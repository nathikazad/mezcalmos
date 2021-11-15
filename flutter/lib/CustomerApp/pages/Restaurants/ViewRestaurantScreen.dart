import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/CustomerApp/components/itemMenuComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantCartController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/TaxiAdminApp/controller/NotificationsController.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewRestaurantScreen extends StatefulWidget {
  @override
  _ViewRestaurantScreenState createState() => _ViewRestaurantScreenState();
}

class _ViewRestaurantScreenState extends State<ViewRestaurantScreen> {
  late String restaurantId;
  Restaurant? restaurant;
  LanguageController lang = Get.find<LanguageController>();
  RestaurantsInfoController controller =
      Get.put<RestaurantsInfoController>(RestaurantsInfoController());

  @override
  void initState() {
    this.restaurantId = Get.parameters['restaurantId']!;
    mezDbgPrint("param rest_id ===> $restaurantId");
    controller.getRestaurant(restaurantId).then((value) {
      mezDbgPrint("Fetched ===> $value");
      setState(() {
        restaurant = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: mezcalmosAppBar("back", () => Get.back(), actionIcons: [
          Obx(() =>
              Get.find<RestaurantCartController>().cart.value.items.length > 0
                  ? ActionIconsComponents.cartIcon()
                  : SizedBox()),
          Get.find<FBNotificationsController>().notifications.value.length > 0
              ? ActionIconsComponents.notificationIcon()
              : SizedBox(),
          ActionIconsComponents.orderIcon()
        ]),
        body: (restaurant?.items == null)
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Positioned(
                              child: Container(
                            // alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 10),

                            height: Get.height,
                            width: Get.width,
                            alignment: Alignment.topCenter,
                            child: Stack(
                              children: [
                                Container(
                                  height: Get.height * 0.45,
                                  width: Get.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25)),
                                    child: handleNetworkImage(
                                        url: restaurant!.photo!,
                                        fit: BoxFit.cover),
                                    // Image.network(
                                    //   "${restaurant!.photo}",
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                ),
                                Container(
                                  height: Get.height * 0.45,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    border: Border.all(
                                        color: const Color(0x5c707070),
                                        width: 1),
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0x29000000),
                                          offset: Offset(0, -2),
                                          blurRadius: 6,
                                          spreadRadius: 0)
                                    ],
                                    gradient: LinearGradient(
                                      begin: Alignment(0.5, 0),
                                      end: Alignment(0.5, 0.8458111882209778),
                                      colors: [
                                        const Color(0x00000f1c),
                                        const Color(0xad000f1c),
                                        const Color(0xff000f1c)
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: Get.height * 0.34,
                                    child: Container(
                                      width: Get.width,
                                      child: Text("${restaurant!.name}",
                                          maxLines: 1,
                                          softWrap: false,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: const Color(0xffffffff),
                                              // fontWeight: FontWeight.w400,
                                              fontFamily: "psr",
                                              fontSize: 25.0.sp),
                                          textAlign: TextAlign.center),
                                    )),
                              ],
                            ),
                          )),
                          SlidingUpPanel(
                            maxHeight: Get.height * 0.87,
                            minHeight: Get.height * 0.40,
                            parallaxEnabled: true,
                            parallaxOffset: 1,
                            body: Container(
                              decoration: BoxDecoration(
                                color: Color(0x36fafafa),
                              ),
                            ),
                            panelBuilder: (sc) => _panel(
                                sc, context, restaurant?.items ?? <Item>[]),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(18.0),
                                topRight: Radius.circular(18.0)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
  }

  Widget _panel(ScrollController sc, BuildContext context, List<Item> items) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: Container(
        //height: Get.height * 0.80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          boxShadow: [
            BoxShadow(
                color: const Color(0x29000000),
                offset: Offset(0, -5),
                blurRadius: 6,
                spreadRadius: 0)
          ],
          color: Color(0xffffffff),
        ),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          controller: sc,
          child: Container(
            height: Get.height * 0.92,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15.sp,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                      "${lang.strings['customer']['restaurant']['menu']['menu']}",
                      style: TextStyle(
                          color: const Color(0xff000f1c),
                          // fontWeight: FontWeight.w700,
                          fontFamily: "psb",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0.sp),
                      textAlign: TextAlign.left),
                ),
                SizedBox(
                  height: 7,
                ),
                Expanded(
                    child: Container(
                  child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ItemMenuComponents(
                          itemID: items[index].id,
                          photo: items[index].image,
                          price: items[index].cost,
                          title: items[index].name!.capitalizeFirstofEach,
                          function: () {
                            Get.toNamed(
                                getItemRoute(restaurantId, items[index].id!),
                                arguments: {
                                  "mode": ViewItemScreenMode.AddItemMode
                                });
                          },
                        );
                      }),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
