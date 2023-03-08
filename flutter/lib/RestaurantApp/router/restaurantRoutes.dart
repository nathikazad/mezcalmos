import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/RestaurantApp/pages/CreateRestaurantView/ROpCreateRestaurantView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/CategoryView/CategoryView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ChoiceView/ROpChoiceView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/ROpItemView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/ROpMenuView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/ROpOptionView.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/ROpCurrentOrders.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/ROpPastOrdersList.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/RestaurantOrderView/RestaurantOrderView.dart';
import 'package:qlevar_router/qlevar_router.dart';

class RestaurantRouter {
  static const String createRestaurantRoute = '/createRestaurant';
  static const String menuViewRoute = '/menu/:restaurantId';
  static const String restaurantCategoryRoute = '/categoryScreen/:restaurantId';
  static const String restaurantEditCategoryRoute =
      '/categoryScreen/:categoryId/:restaurantId';
  static const String restaurantAddItemRoute = '/itemView/:restaurantId';
  static const String restaurantEditItemView =
      '/itemView/:restaurantId/:itemId/:categoryId';
  static const String restaurantOrderRoute = '/restaurantOrders/:orderId';
  static const String currentOrdersRoute = '/orders';
  static const String pastOrdersRoute = '/pastOrders';
  static const String restaurantOptionRoute =
      "/optionView/:restaurantId/:itemId/:optionId";
  static const String restaurantChoiceRoute =
      "/Choice/:restaurantId:/:optionId/:choiceId";

  final List<QRoute> routes = <QRoute>[
    QRoute(
      path: createRestaurantRoute,
      name: createRestaurantRoute,
      builder: () => ROpCreateRestuarantView(),
    ),
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
      path: restaurantAddItemRoute,
      name: restaurantAddItemRoute,
      builder: () => ROpItemView(),
    ),
    QRoute(
      path: restaurantEditItemView,
      name: restaurantEditItemView,
      builder: () => ROpItemView(),
    ),
    QRoute(
      path: restaurantOrderRoute,
      name: restaurantOrderRoute,
      builder: () => RestaurantOrderView(),
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
  ];
}
