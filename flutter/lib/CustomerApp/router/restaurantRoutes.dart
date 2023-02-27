import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustItemView/CustItemView.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustItemView/controllers/CustItemViewController.dart';
import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustItemView/CustItemView.dart'
    deferred as restoItemView;
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantsListView/CustRestaurantListView.dart'
    deferred as restoList;
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantView/CustomerRestaurantView.dart'
    deferred as restoView;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:qlevar_router/qlevar_router.dart';

class RestaurantRouters {
  static const String restaurantItemRouteName = '/restaurantItemRoute';
  static const String customerRestaurantView = '/customerRestaurantView';

  static const String restaurants = "/restaurants";
  static const String restaurantitems = "items";
  static String restaurantsId = "/restaurants/:id";
  static const String restaurant_info = "info";
  static const String item_id = "item_id";

  String getRestaurantItemRoute(int restaurantId, int itemId) =>
      'items/$restaurantId/$itemId';

  String getRestaurantRoute(
    int restaurantId,
  ) {
    restaurantsId = restaurantsId.replaceFirst(":id", restaurantId.toString());
    mezDbgPrint("🤬🤬🤬🤬🤬 $restaurantsId");
    return restaurantsId;
  }

  final routes = QRoute(
      path: '/restaurants',
      name: restaurants,
      // The page to show when this route is called
      builder: () => restoList.CustRestaurantListView(),
      middleware: [
        DefferedLoader(restoList.loadLibrary)
      ],
      children: [
        QRoute(
            path: '/:id',
            name: restaurantsId,
            builder: () => restoView.CustomerRestaurantView(),
            middleware: [
              DefferedLoader(restoView.loadLibrary)
            ],
            children: [
              QRoute(
                  path: '/info',
                  name: restaurant_info,
                  // middleware: [DefferedLoader(restoScreenInfo.loadLibrary)],
                  builder: () => restoView.CustomerRestaurantView()),
              QRoute(
                path: '/:itemId',
                name: item_id,
                middleware: [DefferedLoader(restoItemView.loadLibrary)],
                builder: () => restoItemView.CustItemView(
                    viewItemScreenMode: ViewItemScreenMode.AddItemMode),
              )
            ]),
      ]);
}
