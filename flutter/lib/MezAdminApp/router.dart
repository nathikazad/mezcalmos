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
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/RestaurantOrderView/RestaurantOrderView.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

// const String kCurrentOrdersList = "/currentDeliveryOrders";
const String kTabsView = '/deliveryOpHomeScreen';
const String kCurrentDeliveryOrderInfoRoute = '/currentDeliveryOrders/:orderId';
const String kPastOrdersList = "/pastDeliveryOrders";
const String kPastDeliveryOrderInfoRoute = '/pastDeliveryOrders/:orderId';
const String kServiceProvidersListScreen = '/serviceProvidersListScreen';
const String kServiceOrders = '/serviceOrders/:serviceProviderId';
const String kNotAuthorizedAdmin = "/unauthorized";
const String kDeliveryCostSetter = "/deliveryCostSetter";
const String kMenuView = '/menu/:restaurantId';

const String kEditInfoView = '/editInfo/:restaurantId';
const String kDashboardView = '/dashboard/:restaurantId';

const String kCategoryView = '/categoryScreen/:restaurantId';
const String kEditCategoryScreen = '/categoryScreen/:categoryId/:restaurantId';
const String kAddItemView = '/itemView/:restaurantId';

const String kEditItemView = '/itemView/:restaurantId/:itemId/:categoryId';
const String kOptionView = "/optionView/:restaurantId/:itemId/:optionId";
const String kChoiceView = "/Choice/:restaurantId:/:optionId/:choiceId";
const String kRestaurantOrderView = '/restaurantOrders/:orderId';

// dv admin //
const String kDvCompanyOrderView = "/deliveryOrders/:orderId";

// const String kCompanyDriversScreen = "/companyDriversScreen";
// const String kServiceProfileScreen = "/serviceProfileScreen";

class XRouter {
  static List<GetPage<dynamic>> mainRoutes = [
        GetPage(name: kTabsView, page: () => AdminTabsView()),
        GetPage(
          name: kHomeRoute,
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
      SharedRouter.sharedRoutes;
}

void getserviceOrdersRoute({
  required int serviceProviderId,
  required ServiceProviderType serviceProviderType,
  required String serviceName,
}) {
  final String route =
      kServiceOrders.replaceFirst(":serviceProviderId", "$serviceProviderId");
  MezRouter.toNamed(route, arguments: {
    "serviceProviderType": serviceProviderType,
    "serviceName": serviceName,
  });
}

String getRestaurantOrderRoute(int orderId) {
  return kRestaurantOrderView.replaceFirst(":orderId", "$orderId");
}

String getDvCompanyOrderRoute(int orderId) {
  return kDvCompanyOrderView.replaceFirst(":orderId", "$orderId");
}

String currentDeliveryOrderInfoRoute(int orderId) {
  return kCurrentDeliveryOrderInfoRoute.replaceFirst(
      ":orderId", orderId.toString());
}

String pastDeliveryOrderInfoRoute(int orderId) {
  return kPastDeliveryOrderInfoRoute.replaceFirst(
      ":orderId", orderId.toString());
}

String pickDriverForOrderRoute(int orderId) {
  return kServiceProvidersListScreen.replaceFirst(
      ':orderId', orderId.toString());
}

String getRestaurantMenuRoute({required int restaurantId}) {
  return kMenuView.replaceFirst(":restaurantId", "$restaurantId");
}

String getROpEditInfoRoute({required int restaurantId}) {
  return kDashboardView.replaceFirst(":restaurantId", "$restaurantId");
}

String getROpChoiceRoute(
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
// String specificServicePastOrderRoute() {}
