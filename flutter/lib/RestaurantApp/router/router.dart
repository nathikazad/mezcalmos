import 'package:mezcalmos/RestaurantApp/pages/RestaurantWrapper.dart';
import 'package:mezcalmos/RestaurantApp/pages/TabsView/ROpTabsView.dart';
import 'package:mezcalmos/RestaurantApp/pages/UnauthrizedOpView/UnauthrizedOpView.dart';
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
          builder: () => RestaurantWrapper(),
        ),
        QRoute(
          path: tabsRoute,
          name: tabsRoute,
          builder: () => ROpTabsViewView(),
        ),
        QRoute(
          path: opUnauthRoute,
          name: opUnauthRoute,
          builder: () => ROpUnauthorizedOpView(),
        ),
      ] +
      //  DeliveryRouter().routes +
      RestaurantRouter.routes +
      SharedRoutes.qRoutes +
      SharedServiceProviderRoutes.routes +
      NativeOnlyRoutes.routes;
}
