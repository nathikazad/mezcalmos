import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/RestaurantApp/pages/CreateRestaurantView/ROpCreateRestaurantView.dart'
    deferred as createRestaurantView;
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/CategoryView/CategoryView.dart'
    deferred as restaurantCategoryView;
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ChoiceView/ROpChoiceView.dart'
    deferred as restaurantChoiceView;
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/ROpItemView.dart'
    deferred as addItemView;
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/ROpMenuView.dart'
    deferred as restaurantMenuView;
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/ROpOptionView.dart'
    deferred as restaurantOptionView;
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/ROpCurrentOrders.dart'
    deferred as currentOrdersView;
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/ROpPastOrdersList.dart'
    deferred as postOrdersListView;
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/RestaurantOrderView/RestaurantOrderView.dart'
    deferred as restaurantOrderView;

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
        builder: () => createRestaurantView.ROpCreateRestuarantView(),
        middleware: <QMiddleware>[
          DefferedLoader(createRestaurantView.loadLibrary)
        ]),
    QRoute(
        path: menuViewRoute,
        name: menuViewRoute,
        builder: () => restaurantMenuView.ROpMenuView(),
        middleware: <QMiddleware>[
          DefferedLoader(restaurantMenuView.loadLibrary)
        ]),
    QRoute(
        path: restaurantCategoryRoute,
        name: restaurantCategoryRoute,
        builder: () => restaurantCategoryView.ROpCategoryView(),
        middleware: <QMiddleware>[
          DefferedLoader(restaurantCategoryView.loadLibrary)
        ]),
    QRoute(
        path: restaurantEditCategoryRoute,
        name: restaurantEditCategoryRoute,
        builder: () => restaurantCategoryView.ROpCategoryView(),
        middleware: <QMiddleware>[
          DefferedLoader(restaurantCategoryView.loadLibrary)
        ]),
    QRoute(
        path: restaurantAddItemRoute,
        name: restaurantAddItemRoute,
        builder: () => addItemView.ROpItemView(),
        middleware: <QMiddleware>[DefferedLoader(addItemView.loadLibrary)]),
    QRoute(
        path: restaurantEditItemView,
        name: restaurantEditItemView,
        builder: () => addItemView.ROpItemView(),
        middleware: <QMiddleware>[DefferedLoader(addItemView.loadLibrary)]),
    QRoute(
        path: restaurantOrderRoute,
        name: restaurantOrderRoute,
        builder: () => restaurantOrderView.RestaurantOrderView(),
        middleware: <QMiddleware>[
          DefferedLoader(restaurantOrderView.loadLibrary)
        ]),
    QRoute(
        path: currentOrdersRoute,
        name: currentOrdersRoute,
        builder: () => currentOrdersView.ROpCurrentOrdersListView(),
        middleware: <QMiddleware>[
          DefferedLoader(currentOrdersView.loadLibrary)
        ]),
    QRoute(
        path: pastOrdersRoute,
        name: pastOrdersRoute,
        builder: () => postOrdersListView.ROpPastOrdersList(),
        middleware: <QMiddleware>[
          DefferedLoader(postOrdersListView.loadLibrary)
        ]),
    QRoute(
        path: restaurantOptionRoute,
        name: restaurantOptionRoute,
        builder: () => restaurantOptionView.ROpOptionView(),
        middleware: <QMiddleware>[
          DefferedLoader(restaurantOptionView.loadLibrary)
        ]),
    QRoute(
        path: restaurantChoiceRoute,
        name: restaurantChoiceRoute,
        builder: () => restaurantChoiceView.ROpChoiceView(),
        middleware: <QMiddleware>[
          DefferedLoader(restaurantChoiceView.loadLibrary)
        ]),
  ];
}
