import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/CategoryView/CategoryView.dart'
    deferred as categoryView;
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ChoiceView/ROpChoiceView.dart'
    deferred as rOpChoiceView;
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/ROpItemView.dart'
    deferred as roPItemView;
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/ROpMenuView.dart'
    deferred as roPMenuView;
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/ROpOptionView.dart'
    deferred as rOptionView;
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/RestaurantOrderView/RestaurantOrderView.dart'
    deferred as restaurantOrderView;
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
        builder: () => roPMenuView.ROpMenuView(),
        middleware: <QMiddleware>[DefferedLoader(roPMenuView.loadLibrary)]),
    QRoute(
        path: categoryViewRoute,
        name: categoryViewRoute,
        builder: () => categoryView.ROpCategoryView(),
        middleware: <QMiddleware>[DefferedLoader(categoryView.loadLibrary)]),
    QRoute(
        path: editCategoryScreenRoute,
        name: editCategoryScreenRoute,
        builder: () => categoryView.ROpCategoryView(),
        middleware: <QMiddleware>[DefferedLoader(categoryView.loadLibrary)]),
    QRoute(
        path: addItemViewRoute,
        name: addItemViewRoute,
        builder: () => roPItemView.ROpItemView(),
        middleware: <QMiddleware>[DefferedLoader(roPItemView.loadLibrary)]),
    QRoute(
        path: editItemViewRoute,
        name: editItemViewRoute,
        builder: () => roPItemView.ROpItemView(),
        middleware: <QMiddleware>[DefferedLoader(roPItemView.loadLibrary)]),
    QRoute(
        path: restaurantOrderViewRoute,
        name: restaurantOrderViewRoute,
        builder: () => restaurantOrderView.RestaurantOrderView(),
        middleware: <QMiddleware>[
          DefferedLoader(restaurantOrderView.loadLibrary)
        ]),
    QRoute(
        path: restaurantOptionRoute,
        name: restaurantOptionRoute,
        builder: () => rOptionView.ROpOptionView(),
        middleware: <QMiddleware>[DefferedLoader(rOptionView.loadLibrary)]),
    QRoute(
        path: restaurantChoiceView,
        name: restaurantChoiceView,
        builder: () => rOpChoiceView.ROpChoiceView(),
        middleware: <QMiddleware>[DefferedLoader(rOpChoiceView.loadLibrary)]),
  ];
}
