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
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:qlevar_router/qlevar_router.dart';

class RestaurantRouters {
  static const String restaurantsListRoute = "/restaurants";
  static const String restaurantViewRoute = "/restaurants/:id";
  static const String restaurantViewItemRoute = "/restaurants/:id/:itemId";
  static const String restaurantInfoRoute = "/restaurants/:id/info";

  String getRestaurantItemRoute(int restaurantId, int itemId) =>
      'items/$restaurantId/$itemId';

  static void navigateToRestaurantRoute(
    int restaurantId,
  ) {
    // MezRouter.toNamed<void>(restaurantViewRoute,
    //     arguments: {"id": restaurantViewRoute});
    final String restaurantRoute =
        restaurantViewRoute.replaceFirst(":id", restaurantId.toString());
    mezDbgPrint("🤬🤬🤬🤬🤬 $restaurantRoute");
    MezRouter.toPath<void>(restaurantRoute);
  }

  final routes = QRoute(
      path: '/restaurants',
      name: restaurantsListRoute,
      // The page to show when this route is called
      builder: () => restoList.CustRestaurantListView(),
      middleware: [
        DefferedLoader(restoList.loadLibrary)
      ],
      children: [
        QRoute(
            path: '/:id',
            name: restaurantViewRoute,
            builder: () => restoView.CustomerRestaurantView(),
            middleware: [
              DefferedLoader(restoView.loadLibrary)
            ],
            children: [
              QRoute(
                  path: '/info',
                  name: restaurantInfoRoute,
                  // middleware: [DefferedLoader(restoScreenInfo.loadLibrary)],
                  builder: () => restoView.CustomerRestaurantView()),
              QRoute(
                path: '/:itemId',
                name: restaurantViewItemRoute,
                middleware: [DefferedLoader(restoItemView.loadLibrary)],
                builder: () => restoItemView.CustItemView(
                    viewItemScreenMode: ViewItemScreenMode.AddItemMode),
              )
            ]),
      ]);
}
