import 'package:get/get.dart'; // getX
import 'package:mezcalmos/RestaurantApp/pages/CreateRestaurantView/ROpCreateRestaurantView.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/ROpDashboardView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/CategoryView/CategoryView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ChoiceView/ROpChoiceView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/ROpItemView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/ROpMenuView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/ROpOptionView.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/ROpCurrentOrders.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/ROpPastOrdersList.dart';
import 'package:mezcalmos/RestaurantApp/pages/RestaurantWrapper.dart';
import 'package:mezcalmos/RestaurantApp/pages/SingleOrderViews/OrderView/ROpOrderView.dart';
import 'package:mezcalmos/RestaurantApp/pages/SingleOrderViews/ROpPickDriverView/ROpPickDriverView.dart';
import 'package:mezcalmos/RestaurantApp/pages/SingleOrderViews/ROpSelfDeliveryView/ROpSelfDeliveryView.dart';
import 'package:mezcalmos/RestaurantApp/pages/TabsView/ROpTabsView.dart';
import 'package:mezcalmos/RestaurantApp/pages/UnauthrizedOpView/UnauthrizedOpView.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

// const String kCurrentOrdersListRoute = '/currentOrders';
const String kCreateRestaurant = '/createRestuarant';
const String kCurrentOrdersListView = '/orders';
const String kTabsView = '/tabsView';
const String kOpUnauth = '/unauth';
// const String kReviewsView = '/reviews/:restaurantId';
const String kPastOrdersListView = '/pastorders';
const String kMenuView = '/menu/:restaurantId';

const String kEditInfoView = '/editInfo/:restaurantId';
const String kDashboardView = '/dashboard/:restaurantId';

const String kCategoryView = '/categoryScreen/:restaurantId';
const String kEditCategoryScreen = '/categoryScreen/:categoryId/:restaurantId';
const String kAddItemView = '/itemView/:restaurantId';

const String kEditItemView = '/itemView/:restaurantId/:itemId/:categoryId';
const String kOrderView = '/orderView/:orderId';
const String kOptionView = "/optionView/:restaurantId/:itemId/:optionId";
const String kChoiceView = "/Choice/:restaurantId:/:optionId/:choiceId";
const String kSelfDeliveryView = '/selfDelivery/:orderId';
const String kPickDriver = '/pickDriver/:serviceProviderId/:orderId';

String getROpEditInfoRoute({required String restaurantId}) {
  return kDashboardView.replaceFirst(":restaurantId", restaurantId);
}

String getROpChoiceRoute(
    {required String? choiceId,
    required String restaurantId,
    required String optionId}) {
  String route = kChoiceView.replaceFirst(":restaurantId", restaurantId);
  route = route.replaceFirst(":optionId", optionId);
  if (choiceId != null) {
    route = route.replaceFirst(":choiceId", choiceId);
  }

  return route;
}

String getROpSelfDelivery({required String orderId}) {
  return kSelfDeliveryView.replaceFirst(":orderId", orderId);
}

String getROpPickDriverRoute(
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

String getROpOptionRoute(
    {required String restaurantId,
    required String? optionId,
    required String itemID}) {
  String route = kOptionView.replaceFirst(":restaurantId", restaurantId);
  route = route.replaceFirst(":itemId", itemID);
  if (optionId != null) {
    route = route.replaceFirst(":optionId", optionId);
  }
  return route;
}

String getROpAddItemRoute({required int restaurantId}) {
  return kAddItemView.replaceFirst(":restaurantId", "$restaurantId");
}

String getROpMenuRoute({required int restaurantId}) {
  return kMenuView.replaceFirst(":restaurantId", "$restaurantId");
}

String getROpCategoryRoute({required int restaurantId}) {
  return kCategoryView.replaceFirst(":restaurantId", "$restaurantId");
}

String getCategoryEditRoute(
    {required int categoryId, required int restaurantId}) {
  String route = kEditCategoryScreen.replaceFirst(":categoryId", "$categoryId");
  route = route.replaceFirst(":restaurantId", "$restaurantId");
  return route;
}

String getROpOrderRoute(String orderId) {
  return kOrderView.replaceFirst(":orderId", orderId);
}

String getEditItemRoute(
    {required int itemId, int? categoryId, required int restaurntID}) {
  String route = kEditItemView.replaceFirst(":restaurantId", "$restaurntID");

  route = route.replaceFirst(":itemId", "$itemId");

  if (categoryId != null) {
    route = route.replaceFirst(":categoryId", "$categoryId");
  }
  return route;
}

String getEditOptionRoute({required int itemId}) {
  final String route = kOptionView.replaceFirst(":itemId", "$itemId");
  return route;
}

// GetX based Router (For navigating)
class XRouter {
  static dynamic mainRoutes = [
        GetPage(name: kDashboardView, page: () => ROpDashboardView()),
        GetPage(name: kMenuView, page: () => ROpMenuView()),
        GetPage(
            name: kCurrentOrdersListView,
            page: () => ROpCurrentOrdersListView()),
        GetPage(name: kPastOrdersListView, page: () => ROpPastOrdersList()),
        GetPage(name: kHomeRoute, page: () => RestaurantWrapper()),
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
        GetPage(name: kOrderView, page: () => ROpOrderView()),
        GetPage(name: kOptionView, page: () => ROpOptionView()),
        GetPage(name: kChoiceView, page: () => ROpChoiceView()),
        GetPage(name: kCreateRestaurant, page: () => ROpCreateRestuarantView()),
        GetPage(name: kTabsView, page: () => ROpTabsViewView()),
        GetPage(name: kPickDriver, page: () => ROpPickDriverView()),
        GetPage(name: kSelfDeliveryView, page: () => ROpSelfDeliveryView()),
        GetPage(name: kOpUnauth, page: () => ROpUnauthorizedOpView()),
      ] +
      SharedRouter.sharedRoutes;
}
