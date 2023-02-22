// GetX based Router (For navigating)
import 'package:get/route_manager.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrderView/DvCompanyOrderView.dart';
import 'package:mezcalmos/MezAdminApp/MezAdminWrapper.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/AdminTabsView.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServiceOrdersView/AdminServiceOrdersView.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/ROpDashboardView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/CategoryView/CategoryView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ChoiceView/ROpChoiceView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/ROpItemView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/ROpMenuView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/ROpOptionView.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/RestaurantOrderView/RestaurantOrderView.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';

class MezAdminRoutes {
  static const String kTabsView = '/deliveryOpHomeScreen';
  static const String kCurrentDeliveryOrderInfoRoute =
      '/currentDeliveryOrders/:orderId';
  static const String kPastOrdersList = "/pastDeliveryOrders";
  static const String kPastDeliveryOrderInfoRoute =
      '/pastDeliveryOrders/:orderId';
  static const String kServiceProvidersListScreen =
      '/serviceProvidersListScreen';
  static const String kServiceOrders = '/serviceOrders/:serviceProviderId';
  static const String kNotAuthorizedAdmin = "/unauthorized";
  static const String kDeliveryCostSetter = "/deliveryCostSetter";
  static const String kMenuView = '/menu/:restaurantId';

  static const String kEditInfoView = '/editInfo/:restaurantId';
  static const String kDashboardView = '/dashboard/:restaurantId';

  static const String kCategoryView = '/categoryScreen/:restaurantId';
  static const String kEditCategoryScreen =
      '/categoryScreen/:categoryId/:restaurantId';
  static const String kAddItemView = '/itemView/:restaurantId';

  static const String kEditItemView =
      '/itemView/:restaurantId/:itemId/:categoryId';
  static const String kOptionView =
      "/optionView/:restaurantId/:itemId/:optionId";
  static const String kChoiceView =
      "/Choice/:restaurantId:/:optionId/:choiceId";
  static const String kRestaurantOrderView = '/restaurantOrders/:orderId';

  static String getserviceOrdersRoute({required int serviceProviderId}) {
    return kServiceOrders.replaceFirst(
        ":serviceProviderId", "$serviceProviderId");
  }

  static String getRestaurantOrderRoute(int orderId) {
    return kRestaurantOrderView.replaceFirst(":orderId", "$orderId");
  }

  static String getDvCompanyOrderRoute(int orderId) {
    return kDvCompanyOrderView.replaceFirst(":orderId", "$orderId");
  }

  static String currentDeliveryOrderInfoRoute(int orderId) {
    return kCurrentDeliveryOrderInfoRoute.replaceFirst(
        ":orderId", orderId.toString());
  }

  static String pastDeliveryOrderInfoRoute(int orderId) {
    return kPastDeliveryOrderInfoRoute.replaceFirst(
        ":orderId", orderId.toString());
  }

  static String pickDriverForOrderRoute(int orderId) {
    return kServiceProvidersListScreen.replaceFirst(
        ':orderId', orderId.toString());
  }

  static String getRestaurantMenuRoute({required int restaurantId}) {
    return kMenuView.replaceFirst(":restaurantId", "$restaurantId");
  }

  static String getROpEditInfoRoute({required int restaurantId}) {
    return kDashboardView.replaceFirst(":restaurantId", "$restaurantId");
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

  static const String kDvCompanyOrderView = "/deliveryOrders/:orderId";
  static List<GetPage<dynamic>> mainRoutes = [
        GetPage(name: kTabsView, page: () => AdminTabsView()),
        GetPage(
          name: SharedRoutes.kHomeRoute,
          page: () => MezAdminWrapper(),
        ),
        GetPage(name: kServiceOrders, page: () => AdminServiceOrdersView()),
        GetPage(
          name: kMenuView,
          page: () => ROpMenuView(),
        ),
        GetPage(name: kDashboardView, page: () => ROpDashboardView()),
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
        GetPage(name: kRestaurantOrderView, page: () => RestaurantOrderView()),
        GetPage(name: kOptionView, page: () => ROpOptionView()),
        GetPage(name: kChoiceView, page: () => ROpChoiceView()),
        GetPage(
          name: kDvCompanyOrderView,
          page: () => DvCompanyOrderView(),
        ),
      ] +
      SharedRoutes.routes +
      SharedServiceProviderRoutes.routes +
      NativeOnlyRoutes.routes;
}
