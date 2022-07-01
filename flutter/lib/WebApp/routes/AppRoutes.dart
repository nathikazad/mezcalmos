import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/ViewRestaurantScreen.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/WebApp/bindings/initialBinding.dart';
import 'package:mezcalmos/WebApp/views/HomeView/index.dart';
import 'package:mezcalmos/WebApp/views/ViewItemScreen/ViewItemScreen.dart'
    as test;
import 'package:mezcalmos/WebApp/views/wrapper.dart' as web;
import 'package:flutter_dotenv/flutter_dotenv.dart';

const String restaurantByID = "/restaurant";
const String restaurantView = "/:id";
const String showRestaurantInfo = "/:itemId";
//const String INITIAL = "/";

class AppRoutes {
  static final List<GetPage> getRoutes = <GetPage<dynamic>>[
    GetPage(
      name: "/",
      page: () => IndexPage(),
      binding: InitialBinding(dotenv.env['LMODE'].toString().toLaunchMode()),
      children: [
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
      ],
    ),
  ];
}
