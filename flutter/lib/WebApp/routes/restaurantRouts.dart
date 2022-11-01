import 'package:mezcalmos/WebApp/routes/deferred_loader.dart';
import 'package:mezcalmos/WebApp/screens/Restaurants/restaurantItemView/restaurantItemView.dart'
    deferred as restoItemView;
import 'package:mezcalmos/WebApp/screens/Restaurants/resturentListView/restaurantsListView.dart'
    deferred as restoList;
import 'package:mezcalmos/WebApp/screens/Restaurants/viewRestaurantsScreen/restaurnatsItemsView.dart'
    deferred as restoItemsView;
import 'package:mezcalmos/WebApp/screens/Restaurants/viewRestaurantsScreenInfo/viewRestaurnatsScreenInfo.dart'
    deferred as restoScreenInfo;
import 'package:mezcalmos/WebApp/services/values/constants.dart';
import 'package:qlevar_router/qlevar_router.dart';

class RestaurantRouters {
  static const String restaurants = "restaurants";
  static const String restaurantitems = "items";
  static const String restaurants_id = "restaurants_id";
  static const String restaurant_info = "info";
  //TODO remove _ and replace With caml case
  static const String item_id = "item_id";

  final routes = QRoute(
      // this will define how to find this route with [QR.to]
      path: '/restaurants',
      // this will define how to find this route with [QR.toName]
      name: restaurants,
      // The page to show when this route is called
      builder: () => restoList.RestaurantsListView(),
      middleware: [
        DefferedLoader(restoList.loadLibrary)
      ],
      children: [
        QRoute(
            path: '/:id',
            name: restaurants_id,
            middleware: [DefferedLoader(restoItemsView.loadLibrary)],
            builder: () => restoItemsView.RestaurantsItemsView(),
            children: [
              QRoute(
                path: '/info',
                name: restaurant_info,
                middleware: [DefferedLoader(restoScreenInfo.loadLibrary)],
                builder: () => restoScreenInfo.ViewRestaurantsScrennInfo(),
              ),
              QRoute(
                path: '/:itemId',
                name: item_id,
                middleware: [DefferedLoader(restoItemView.loadLibrary)],
                builder: () => restoItemView.RestaurantItemView(),
              )
            ]),
      ]);
}
