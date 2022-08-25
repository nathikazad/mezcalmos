//import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:mez_services_web_app/screens/restaurantsListView.dart';

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
      name: restaurants,
      page: () => RestaurantsListView(),
    ),
  ];
}
