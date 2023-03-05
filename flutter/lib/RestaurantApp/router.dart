import 'package:get/get.dart'; // getX
import 'package:mezcalmos/RestaurantApp/pages/CreateRestaurantView/ROpCreateRestaurantView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/CategoryView/CategoryView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ChoiceView/ROpChoiceView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/ROpItemView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/ROpMenuView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/ROpOptionView.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/ROpCurrentOrders.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/ROpPastOrdersList.dart';
import 'package:mezcalmos/RestaurantApp/pages/RestaurantWrapper.dart';
import 'package:mezcalmos/RestaurantApp/pages/SingleOrderViews/ROpSelfDeliveryView/ROpSelfDeliveryView.dart';
import 'package:mezcalmos/RestaurantApp/pages/TabsView/ROpTabsView.dart';
import 'package:mezcalmos/RestaurantApp/pages/UnauthrizedOpView/UnauthrizedOpView.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/PickDriverView/PickDriverView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/RestaurantOrderView/RestaurantOrderView.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';

class RestaurantAppRoutes {
  static const String kCreateRestaurant = '/createRestuarant';
  static const String kCurrentOrdersListView = '/orders';
  static const String kTabsView = '/tabsView';
  static const String kOpUnauth = '/unauth';

// static const String kReviewsView = '/reviews/:restaurantId';
  static const String kPastOrdersListView = '/pastorders';
  static const String kMenuView = '/menu/:restaurantId';

  static const String kEditInfoView = '/editInfo/:restaurantId';
  static const String kDashboardView = '/dashboard/:restaurantId';

  static const String kCategoryView = '/categoryScreen/:restaurantId';
  static const String kEditCategoryScreen =
      '/categoryScreen/:categoryId/:restaurantId';
  static const String kAddItemView = '/itemView/:restaurantId';

  static const String kEditItemView =
      '/itemView/:restaurantId/:itemId/:categoryId';
  static const String kOrderView = '/restaurantOrders/:orderId';
  static const String kOptionView =
      "/optionView/:restaurantId/:itemId/:optionId";
  static const String kChoiceView =
      "/Choice/:restaurantId:/:optionId/:choiceId";
  static const String kSelfDeliveryView = '/selfDelivery/:orderId';
  static const String kPickDriver = '/pickDriver/:serviceProviderId/:orderId';

  static String getROpEditInfoRoute({required String restaurantId}) {
    return kDashboardView.replaceFirst(":restaurantId", restaurantId);
  }

  static String getROpChoiceRoute(
      {required int? choiceId,
      required String restaurantId,
      required int optionId}) {
    String route = kChoiceView.replaceFirst(":restaurantId", restaurantId);
    route = route.replaceFirst(":optionId", "$optionId");
    if (choiceId != null) {
      route = route.replaceFirst(":choiceId", "$choiceId");
    }

    return route;
  }

  static String getROpSelfDelivery({required String orderId}) {
    return kSelfDeliveryView.replaceFirst(":orderId", orderId);
  }

  static String getROpPickDriverRoute(
      {required int serviceProviderId, required int orderId}) {
    String route =
        kPickDriver.replaceFirst(":serviceProviderId", "$serviceProviderId");
    route = route.replaceFirst(":orderId", "$orderId");
    mezDbgPrint("Final route =========>>>>>$route");
    return route;
  }

// String getROpReviewsoRoute({required String restaurantId}) {
//   return kReviewsView.replaceFirst(":restaurantId", restaurantId);
// }

  static String getROpOptionRoute(
      {required String restaurantId,
      required int? optionId,
      required String itemID}) {
    String route = kOptionView.replaceFirst(":restaurantId", restaurantId);
    route = route.replaceFirst(":itemId", itemID);
    if (optionId != null) {
      route = route.replaceFirst(":optionId", "$optionId");
    }
    return route;
  }

  static String getROpAddItemRoute({required int restaurantId}) {
    return kAddItemView.replaceFirst(":restaurantId", "$restaurantId");
  }

  static String getROpMenuRoute({required int restaurantId}) {
    return kMenuView.replaceFirst(":restaurantId", "$restaurantId");
  }

  static String getROpCategoryRoute({required int restaurantId}) {
    return kCategoryView.replaceFirst(":restaurantId", "$restaurantId");
  }

  static String getCategoryEditRoute(
      {required int categoryId, required int restaurantId}) {
    String route =
        kEditCategoryScreen.replaceFirst(":categoryId", "$categoryId");
    route = route.replaceFirst(":restaurantId", "$restaurantId");
    return route;
  }

  static String getROpOrderRoute(String orderId) {
    return kOrderView.replaceFirst(":orderId", orderId);
  }

  static String getEditItemRoute(
      {required int itemId, int? categoryId, required int restaurntID}) {
    String route = kEditItemView.replaceFirst(":restaurantId", "$restaurntID");

    route = route.replaceFirst(":itemId", "$itemId");

    if (categoryId != null) {
      route = route.replaceFirst(":categoryId", "$categoryId");
    }
    return route;
  }

  static String getEditOptionRoute({required int itemId}) {
    final String route = kOptionView.replaceFirst(":itemId", "$itemId");
    return route;
  }

  static dynamic mainRoutes = [
        GetPage(name: SharedRoutes.kHomeRoute, page: () => RestaurantWrapper()),
        GetPage(name: kMenuView, page: () => ROpMenuView()),
        GetPage(
            name: kCurrentOrdersListView,
            page: () => ROpCurrentOrdersListView()),
        GetPage(name: kPastOrdersListView, page: () => ROpPastOrdersList()),
        GetPage(name: SharedRoutes.kHomeRoute, page: () => RestaurantWrapper()),
        GetPage(
          name: kCategoryView,
          page: () => ROpCategoryView(),
        ),
        GetPage(
          name: kEditCategoryScreen,
          page: () => ROpCategoryView(),
        ),
        GetPage(
          name: kAddItemView,
          page: () => ROpItemView(),
        ),
        GetPage(
          name: kEditItemView,
          page: () => ROpItemView(),
        ),
        GetPage(name: kOrderView, page: () => RestaurantOrderView()),
        GetPage(name: kOptionView, page: () => ROpOptionView()),
        GetPage(name: kChoiceView, page: () => ROpChoiceView()),
        GetPage(name: kCreateRestaurant, page: () => ROpCreateRestuarantView()),
        GetPage(name: kTabsView, page: () => ROpTabsViewView()),
        GetPage(name: kPickDriver, page: () => PickDriverView()),
        GetPage(name: kSelfDeliveryView, page: () => ROpSelfDeliveryView()),
        GetPage(name: kOpUnauth, page: () => ROpUnauthorizedOpView()),
      ] +
      SharedRoutes.routes +
      SharedServiceProviderRoutes.routes;
//  +
// NativeOnlyRoutes.routes;
}
