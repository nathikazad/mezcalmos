import 'package:get/get.dart'; // getX
import 'package:mezcalmos/RestaurantApp/pages/CategoryView/CategoryView.dart';
import 'package:mezcalmos/RestaurantApp/pages/CreateRestaurantView/ROpCreateRestaurantView.dart';
import 'package:mezcalmos/RestaurantApp/pages/CurrentOrdersList/ROpCurrentOrders.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/ROpDashboardView.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/ROpItemView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/ROpMenuView.dart';
import 'package:mezcalmos/RestaurantApp/pages/OptionView/ROpOptionView.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/ROpOrderView.dart';
import 'package:mezcalmos/RestaurantApp/pages/PastOrdresList/ROpPastOrdersList.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpChoiceView/ROpChoiceView.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpPickDriverView/ROpPickDriverView.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpSelfDeliveryView/ROpSelfDeliveryView.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpTabsViewView/ROpTabsViewView.dart';
import 'package:mezcalmos/RestaurantApp/pages/RestaurantWrapper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

// const String kCurrentOrdersListRoute = '/currentOrders';
const String kCreateRestaurant = '/createRestuarant';
const String kCurrentOrdersListView = '/orders';
const String kTabsView = '/tabsView';
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
const String kPickDriver = '/pickDriver/:orderId';

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

String getROpAddItemRoute({required String restaurantId}) {
  return kAddItemView.replaceFirst(":restaurantId", restaurantId);
}

String getROpMenuRoute({required String restaurantId}) {
  return kMenuView.replaceFirst(":restaurantId", restaurantId);
}

String getROpCategoryRoute({required String restaurantId}) {
  return kCategoryView.replaceFirst(":restaurantId", restaurantId);
}

String getCategoryEditRoute(
    {required String categoryId, required String restaurantId}) {
  String route = kEditCategoryScreen.replaceFirst(":categoryId", categoryId);
  route = route.replaceFirst(":restaurantId", restaurantId);
  return route;
}

String getROpOrderRoute(String orderId) {
  return kOrderView.replaceFirst(":orderId", orderId);
}

String getEditItemRoute(
    {required String itemId, String? categoryId, required String restaurntID}) {
  String route = kEditItemView.replaceFirst(":restaurantId", restaurntID);

  route = route.replaceFirst(":itemId", itemId);

  if (categoryId != null) {
    route = route.replaceFirst(":categoryId", categoryId);
  }
  return route;
}

String getEditOptionRoute({required String itemId}) {
  final String route = kOptionView.replaceFirst(":itemId", itemId);
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
      ] +
      SharedRouter.sharedRoutes;
}
