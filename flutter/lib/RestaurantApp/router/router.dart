import 'package:mezcalmos/RestaurantApp/pages/MenuViews/CategoryView/CategoryView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ChoiceView/ROpChoiceView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/ROpItemView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/ROpMenuView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/ROpOptionView.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/ROpCurrentOrders.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/ROpPastOrdersList.dart';
import 'package:mezcalmos/RestaurantApp/pages/RestaurantWrapper.dart';
import 'package:mezcalmos/RestaurantApp/pages/TabsView/ROpTabsView.dart';
import 'package:mezcalmos/RestaurantApp/pages/UnauthrizedOpView/UnauthrizedOpView.dart';
import 'package:mezcalmos/Shared/pages/Orders/RestaurantOrderView/RestaurantOrderView.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class RestaurantAppRoutes {
  static const String tabsRoute = '/tabsView';
  static const String createRestaurantRoute = '/createRestaurant';
  static const String unAuthorizedRoute = '/unauth';
  static const String menuViewRoute = '/menu/:restaurantId';
  static const String restaurantCategoryRoute =
      '/restaurantCategoryScreen/:restaurantId';
  static const String restaurantEditCategoryRoute =
      '/restaurantCategoryScreen/:categoryId/:restaurantId';

  static const String restaurantItemRoute =
      '/itemView/:restaurantId/:itemId/:categoryId';
  static const String restaurantOrderRoute = '/restaurantOrders/:orderId';
  static const String currentOrdersRoute = '/orders';
  static const String pastOrdersRoute = '/pastOrders';
  static const String restaurantOptionRoute =
      "/optionView/:restaurantId/:itemId/:optionId";
  static const String restaurantChoiceRoute =
      "/Choice/:restaurantId/:optionId/:choiceId";

  static String getROpOrderRoute(String orderId) =>
      '/restaurantOrders/$orderId';

  static List<QRoute> mainRoutes = [
        QRoute(
          path: SharedRoutes.kHomeRoute,
          name: SharedRoutes.kHomeRoute,
          builder: () => RestaurantWrapper(),
        ),
        QRoute(
          path: unAuthorizedRoute,
          name: unAuthorizedRoute,
          builder: () => ROpUnauthorizedOpView(),
        ),
        QRoute(
          path: currentOrdersRoute,
          name: currentOrdersRoute,
          builder: () => ROpCurrentOrdersListView(),
        ),
        QRoute(
          path: pastOrdersRoute,
          name: pastOrdersRoute,
          builder: () => ROpPastOrdersList(),
        ),
        QRoute(
          path: restaurantOptionRoute,
          name: restaurantOptionRoute,
          builder: () => ROpOptionView(),
        ),
        QRoute(
          path: restaurantChoiceRoute,
          name: restaurantChoiceRoute,
          builder: () => ROpChoiceView(),
        ),
        QRoute(
          path: tabsRoute,
          name: tabsRoute,
          builder: () => ROpTabsViewView(),
        ),
      ] +
      sharedWithAdminRoutes +
      //  DeliveryRouter().routes +

      SharedRoutes.qRoutes +
      SharedServiceProviderRoutes.routes +
      NativeOnlyRoutes.routes;
  static final List<QRoute> sharedWithAdminRoutes = [
    QRoute(
      path: menuViewRoute,
      name: menuViewRoute,
      builder: () => ROpMenuView(),
    ),
    QRoute(
      path: restaurantCategoryRoute,
      name: restaurantCategoryRoute,
      builder: () => ROpCategoryView(),
    ),
    QRoute(
      path: restaurantEditCategoryRoute,
      name: restaurantEditCategoryRoute,
      builder: () => ROpCategoryView(),
    ),
    QRoute(
      path: restaurantItemRoute,
      name: restaurantItemRoute,
      builder: () => ROpItemView(),
    ),
    QRoute(
      path: restaurantOrderRoute,
      name: restaurantOrderRoute,
      builder: () => RestaurantOrderView(),
    ),
  ];
}
