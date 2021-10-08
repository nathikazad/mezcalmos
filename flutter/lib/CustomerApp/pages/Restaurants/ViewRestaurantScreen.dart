import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/itemMenuComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/models/restaurant.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen.dart';
import 'dart:async';

class ViewRestaurantScreen extends GetView<RestaurantsInfoController> {
  String restaurantId;
  Rxn<Restaurant> restaurant = Rxn();

  ViewRestaurantScreen(this.restaurantId) {
    RestaurantsInfoController controller =
        Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    controller.getRestaurant(restaurantId).then((value) {
      restaurant.value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Obx(() => Text("${restaurant.value?.name ?? 'Loading'}")),
        //   actions: [
        //     TextButton(
        //         onPressed: () => Get.to(ViewCartScreen()), child: Text("Cart"))
        //   ],
        // ),
        body: Obx(() {
      List<Item> items = restaurant.value?.items ?? [];

      return SafeArea(
        child: Stack(
          children: [
            SlidingUpPanel(
              maxHeight: Get.height * 0.82,
              minHeight: Get.height * 0.4,
              parallaxEnabled: true,
              parallaxOffset: 1,
              body: Container(
                decoration: BoxDecoration(
                  color: Color(0x36fafafa),
                ),
              ),
              panelBuilder: (sc) => _panel(sc, context),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0)),
            ),
          ],
        ),
      );
      // return Column(
      //     children: items
      //         .map((item) => TextButton(
      //             onPressed: () => Get.to(
      //                 ViewItemScreen.forNewItem(restaurantId, item.id!)),
      //             child: Text(item.name!)))
      //         .toList());
    }));
  }

  Widget _panel(ScrollController sc, BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Container(
          height: Get.height * 0.82,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              boxShadow: [
                BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, -5),
                    blurRadius: 6,
                    spreadRadius: 0)
              ],
              color: const Color(0xfffbfbfb)),
          child: SingleChildScrollView(
            controller: sc,
            child: Container(
              height: Get.height * 0.82,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Menu",
                        style: const TextStyle(
                            color: const Color(0xff000f1c),
                            fontWeight: FontWeight.w700,
                            fontFamily: "ProductSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.left),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                      child: Container(
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return ItemMenuComponents();
                        }),
                  ))
                ],
              ),
            ),
          ),
        ));
  }
}

class ListRestaurantsScreen extends GetView<RestaurantsInfoController> {
  RxList<Restaurant> restaurants = <Restaurant>[].obs;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Restaurant list"),
        ),
        body: Obx(() => Column(
            children: restaurants
                .map((restaurant) => TextButton(
                    onPressed: () =>
                        Get.to(ViewRestaurantScreen(restaurant.id!)),
                    child: Text(restaurant.name!)))
                .toList())));
  }
}
