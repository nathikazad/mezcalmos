import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreen/ListRestaurantsScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/ViewRestaurantScreen.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/WebApp/bindings/initialBinding.dart';
import 'package:mezcalmos/WebApp/views/HomeView/index.dart';
import 'package:mezcalmos/WebApp/views/ViewItemScreen/ViewItemScreen.dart'
    as test;
import 'package:mezcalmos/WebApp/views/blogDetails/blogDetails.dart';
import 'package:mezcalmos/WebApp/views/blogsView/blogsView.dart';
import 'package:mezcalmos/WebApp/views/showLaundriesListView/showLaundriesListView.dart';
import 'package:mezcalmos/WebApp/views/showListOfRestaurantsView/showListOfrestaurants.dart';
import 'package:mezcalmos/WebApp/views/showSingleLaundryView/showSingleLaundryView.dart';
import 'package:mezcalmos/WebApp/views/showViewRestaurantScreen/showViewRestaurantScreen.dart';
import 'package:mezcalmos/WebApp/views/wrapper.dart' as web;
//import 'package:flutter_dotenv/flutter_dotenv.dart';

const String restaurantByID = "/restaurant";
const String restaurants = "/restaurants";
const String laundries = "/laundries";
const String singleLaundryView = "/:laundryId";
const String restaurantView = "/:id";
const String showRestaurantInfo = "/:itemId";
const String blogsView = "/blogs";
const String blogDetails = "/blog";
//const String INITIAL = "/";

class AppRoutes {
  static final List<GetPage> getRoutes = <GetPage<dynamic>>[
    GetPage(
      name: "/",
      page: () => IndexPage(),
      binding: InitialBinding("stage".toLaunchMode()),
      children: [
        GetPage(
          name: restaurants,
          page: () => ShowListOfRestaurants(),
        ),
        GetPage(
            name: laundries,
            page: () => ShowLaundriesListView(),
            children: [
              GetPage(
                  name: singleLaundryView, page: () => ShowSingleLaundryView()),
            ]),
        GetPage(name: blogsView, page: () => BlogsView()),
        GetPage(name: blogDetails, page: () => BlogDetails()),
        GetPage(name: restaurantByID, page: () => web.Wrapper(), children: [
          GetPage(
              name: restaurantView,
              page: () => ShowViewRestaurantScreen(),
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
