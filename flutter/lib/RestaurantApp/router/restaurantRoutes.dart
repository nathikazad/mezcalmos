import 'package:mezcalmos/RestaurantApp/pages/CreateRestaurantView/ROpCreateRestaurantView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/CategoryView/CategoryView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ChoiceView/ROpChoiceView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/ROpItemView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/ROpMenuView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/ROpOptionView.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/ROpCurrentOrders.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/ROpPastOrdersList.dart';
import 'package:mezcalmos/RestaurantApp/pages/UnauthrizedOpView/UnauthrizedOpView.dart';
import 'package:mezcalmos/Shared/pages/Orders/RestaurantOrderView/RestaurantOrderView.dart';
import 'package:qlevar_router/qlevar_router.dart';

class RestaurantRouter {
  static const String createRestaurantRoute = '/createRestaurant';
  static const String unAuthorizedRoute = '/unauth';
  static const String menuViewRoute = '/menu/:restaurantId';
  static const String restaurantCategoryRoute = '/categoryScreen/:restaurantId';
  static const String restaurantEditCategoryRoute =
      '/categoryScreen/:categoryId/:restaurantId';

  static const String restaurantItemRoute =
      '/itemView/:restaurantId/:itemId/:categoryId';
  static const String restaurantOrderRoute = '/restaurantOrders/:orderId';
  static const String currentOrdersRoute = '/orders';
  static const String pastOrdersRoute = '/pastOrders';
  static const String restaurantOptionRoute =
      "/optionView/:restaurantId/:itemId/:optionId";
  static const String restaurantChoiceRoute =
      "/Choice/:restaurantId/:optionId/:choiceId";

  static final List<QRoute> routes = <QRoute>[
        QRoute(
          path: createRestaurantRoute,
          name: createRestaurantRoute,
          builder: () => ROpCreateRestuarantView(),
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
      ] +
      sharedWithAdminRoutes;

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
