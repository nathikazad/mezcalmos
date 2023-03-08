import 'package:mezcalmos/RestaurantApp/pages/MenuViews/CategoryView/CategoryView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ChoiceView/ROpChoiceView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/ROpItemView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/ROpMenuView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/ROpOptionView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/RestaurantOrderView/RestaurantOrderView.dart';
import 'package:qlevar_router/qlevar_router.dart';

class MezAdminRestaurantRoutes {
  static const String menuViewRoute = '/menu/:restaurantId';
  static const String categoryViewRoute = '/categoryScreen/:restaurantId';
  static const String editCategoryScreenRoute =
      '/categoryScreen/:categoryId/:restaurantId';
  static const String addItemViewRoute = '/itemView/:restaurantId';
  static const String editItemViewRoute =
      '/itemView/:restaurantId/:itemId/:categoryId';
  static const String restaurantOrderViewRoute = '/restaurantOrders/:orderId';
  static const String restaurantOptionRoute =
      "/optionView/:restaurantId/:itemId/:optionId";
  static const String restaurantChoiceView =
      "/Choice/:restaurantId:/:optionId/:choiceId";

  static final List<QRoute> mainRoutes = <QRoute>[
    QRoute(
      path: menuViewRoute,
      name: menuViewRoute,
      builder: () => ROpMenuView(),
    ),
    QRoute(
      path: categoryViewRoute,
      name: categoryViewRoute,
      builder: () => ROpCategoryView(),
    ),
    QRoute(
      path: editCategoryScreenRoute,
      name: editCategoryScreenRoute,
      builder: () => ROpCategoryView(),
    ),
    QRoute(
      path: addItemViewRoute,
      name: addItemViewRoute,
      builder: () => ROpItemView(),
    ),
    QRoute(
      path: editItemViewRoute,
      name: editItemViewRoute,
      builder: () => ROpItemView(),
    ),
    QRoute(
      path: restaurantOrderViewRoute,
      name: restaurantOrderViewRoute,
      builder: () => RestaurantOrderView(),
    ),
    QRoute(
      path: restaurantOptionRoute,
      name: restaurantOptionRoute,
      builder: () => ROpOptionView(),
    ),
    QRoute(
      path: restaurantChoiceView,
      name: restaurantChoiceView,
      builder: () => ROpChoiceView(),
    ),
  ];
}
