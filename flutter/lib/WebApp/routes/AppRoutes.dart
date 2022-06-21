import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/ViewRestaurantScreen.dart';
import 'package:mezcalmos/Shared/pages/Wrapper.dart';
import 'package:mezcalmos/WebApp/views/ViewItemScreen/ViewItemScreen.dart'
    as test;
import 'package:mezcalmos/WebApp/views/index.dart';
import 'package:mezcalmos/WebApp/views/wrapper.dart' as web;

const String restaurantByID = "/restaurant";
const String restaurantView = "/:id";
const String showRestaurantInfo = "/:itemId";
//const String INITIAL = "/";

class AppRoutes {
  static final List<GetPage> getRoutes = <GetPage<dynamic>>[
    GetPage(
      name: "/home",
      page: () => IndexPage(),
    ),
    GetPage(name: restaurantByID, page: () => web.Wrapper(), children: [
      GetPage(
          name: restaurantView,
          page: () => ViewRestaurantScreen(),
          children: [
            GetPage(
              name: showRestaurantInfo,
              page: () => test.ViewItemScreen(),
            ),
          ])
    ]),
  ];
}
