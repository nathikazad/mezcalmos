import 'package:mezcalmos/RestaurantApp/pages/MenuViews/CategoryView/CategoryView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ChoiceView/ROpChoiceView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/ROpItemView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/ROpMenuView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/ROpOptionView.dart';
import 'package:mezcalmos/RestaurantApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/RestaurantOrderView/RestaurantOrderView.dart';
import 'package:qlevar_router/qlevar_router.dart';

class MezAdminRestaurantRoutes {
  static final List<QRoute> mainRoutes = <QRoute>[
    QRoute(
      path: RestaurantRouter.menuViewRoute,
      name: RestaurantRouter.menuViewRoute,
      builder: () => ROpMenuView(),
    ),
    QRoute(
      path: RestaurantRouter.restaurantCategoryRoute,
      name: RestaurantRouter.restaurantCategoryRoute,
      builder: () => ROpCategoryView(),
    ),
    QRoute(
      path: RestaurantRouter.restaurantEditCategoryRoute,
      name: RestaurantRouter.restaurantEditCategoryRoute,
      builder: () => ROpCategoryView(),
    ),
    QRoute(
      path: RestaurantRouter.restaurantItemRoute,
      name: RestaurantRouter.restaurantItemRoute,
      builder: () => ROpItemView(),
    ),
    QRoute(
      path: RestaurantRouter.restaurantItemRoute,
      name: RestaurantRouter.restaurantItemRoute,
      builder: () => ROpItemView(),
    ),
    QRoute(
      path: RestaurantRouter.restaurantOrderRoute,
      name: RestaurantRouter.restaurantOrderRoute,
      builder: () => RestaurantOrderView(),
    ),
    QRoute(
      path: RestaurantRouter.restaurantOptionRoute,
      name: RestaurantRouter.restaurantOptionRoute,
      builder: () => ROpOptionView(),
    ),
    QRoute(
      path: RestaurantRouter.restaurantChoiceRoute,
      name: RestaurantRouter.restaurantChoiceRoute,
      builder: () => ROpChoiceView(),
    ),
  ];
}
