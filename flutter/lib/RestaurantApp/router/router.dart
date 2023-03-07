import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/RestaurantApp/pages/RestaurantWrapper.dart'
    deferred as restaurantWrapper;
import 'package:mezcalmos/RestaurantApp/pages/TabsView/ROpTabsView.dart'
    deferred as RoTabsView;
import 'package:mezcalmos/RestaurantApp/pages/UnauthrizedOpView/UnauthrizedOpView.dart'
    deferred as UnAuthorizedOpView;

import 'package:mezcalmos/RestaurantApp/router/deliveryRoutes.dart';
import 'package:mezcalmos/RestaurantApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class RestaurantAppRoutes {
  static const String tabsRoute = '/tabsView';
  static const String opUnauthRoute = '/unauth';

  static String getROpOrderRoute(String orderId) =>
      '/restaurantOrders/$orderId';

  static List<QRoute> mainRoutes = [
        QRoute(
            path: SharedRoutes.kHomeRoute,
            name: SharedRoutes.kHomeRoute,
            builder: () => restaurantWrapper.RestaurantWrapper(),
            middleware: <QMiddleware>[
              DefferedLoader(restaurantWrapper.loadLibrary)
            ]),
        QRoute(
            path: tabsRoute,
            name: tabsRoute,
            builder: () => RoTabsView.ROpTabsViewView(),
            middleware: <QMiddleware>[DefferedLoader(RoTabsView.loadLibrary)]),
        QRoute(
            path: opUnauthRoute,
            name: opUnauthRoute,
            builder: () => UnAuthorizedOpView.ROpUnauthorizedOpView(),
            middleware: <QMiddleware>[
              DefferedLoader(UnAuthorizedOpView.loadLibrary)
            ]),
      ] +
      DeliveryRouter().routes +
      RestaurantRouter().routes +
      SharedRoutes.qRoutes +
      SharedServiceProviderRoutes.routes +
      NativeOnlyRoutes.routes;
}
