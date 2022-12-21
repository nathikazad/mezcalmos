import 'package:get/get.dart'; // getX
import 'package:mezcalmos/DeliveryAdminApp/pages/AddServiceViews/AddLaundryServiceView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/AddServiceViews/AddRestaurantView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/AdminWrapper.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Dashboard/AdminDashboardView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OperatorsView/OperatorsView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/DriversListView/DriverListScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryOrder/LaundryOrderScreen.dart.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ListOrdersScreen/ListOrdersScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/TaxiOrderView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/ViewRestaurantOrderScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/ServicesView/ServicesView.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/LaundryOpAdminView.dart';
import 'package:mezcalmos/LaundryApp/pages/CategoryView/CategoryView.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/EditInfoView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/CategoryView/CategoryView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/ROpItemView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/ROpMenuView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/ROpOptionView.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

// Routes Keys.
const String kOrdersRoute = '/orders';
const String kRestaurantOrderRoute = '/restaurantOrders/:orderId';
const String kLaundryOrderRoute = '/laundryOrders/:orderId';
const String kTaxiOrderRoute = '/taxiOrders/:orderId';

const String kRestaurantsRoute = '/restaurants';
const String kRestaurantRoute = '/restaurants/:restaurantId';
const String kDriversListRoute = '/drivers';
const String kServicesRoute = '/services';
const String kAdminDashboard = '/dashboard';

// laundry //
const String kAdminView = '/admin/:laundryId';

const String kEditInfoView = '/editInfo/:laundryId';

const String kCategoryView = '/categoryScreen/:laundryId/:categoryId';
const String kAddLaundryServiceRoute = "/addLaundryService";
const String kAddRestaurantServiceRoute = "/addRestaurantService";
// restuarnts routs consts //
const String krMenuView = '/menu/:restaurantId';
const String krOperators = '/operators/:restaurantId';

const String kRestuarntEditInfoView = '/restaurants/editInfo/:restaurantId';

const String krCategoryView = '/categoryScreen/:restaurantId';
const String krEditCategoryScreen = '/categoryScreen/:categoryId/:restaurantId';
const String krAddItemView = '/itemView/:restaurantId';

const String krEditItemView = '/itemView/:restaurantId/:itemId/:categoryId';
const String krOptionView = "/optionView/:restaurantId/:itemId";

//
String getRestaurantRoute(int restaurantId) {
  return kRestaurantRoute.replaceFirst(
      ":restaurantId", restaurantId.toString());
}

String getRestaurantOperatorsRoute(int restaurantId) {
  return krOperators.replaceFirst(":restaurantId", restaurantId.toString());
}

String getRestaurantOrderRoute(int orderId) {
  return kRestaurantOrderRoute.replaceFirst(":orderId", "$orderId");
}

String getLaundryOrderRoute(int orderId) {
  return kLaundryOrderRoute.replaceFirst(":orderId", orderId.toString());
}

String getTaxiOrderRoute(int orderId) {
  return kTaxiOrderRoute.replaceFirst(":orderId", orderId.toString());
}
// Restuarnts dashboard //

String getROpEditInfoRoute({required int restaurantId}) {
  return kRestuarntEditInfoView.replaceFirst(
      ":restaurantId", restaurantId.toString());
}

String getROpOptionRoute({required int restaurantId}) {
  return krOptionView.replaceFirst(":restaurantId", restaurantId.toString());
}

String getROpAddItemRoute({required int restaurantId}) {
  return krAddItemView.replaceFirst(":restaurantId", restaurantId.toString());
}

String getROpMenuRoute({required int restaurantId}) {
  return krMenuView.replaceFirst(":restaurantId", restaurantId.toString());
}

String getROpCategoryRoute({required int restaurantId}) {
  return krCategoryView.replaceFirst(":restaurantId", restaurantId.toString());
}

String getCategoryEditRoute(
    {required String categoryId, required int restaurantId}) {
  String route = krEditCategoryScreen.replaceFirst(":categoryId", categoryId);
  route = route.replaceFirst(":restaurantId", restaurantId.toString());
  return route;
}

// LAUNDRIES DASHBORD //
String getCategoryRoute({String? categoryId, required String laundryId}) {
  String catgRoute = kCategoryView.replaceFirst(":laundryId", laundryId);
  if (categoryId != null) {
    catgRoute = catgRoute.replaceFirst(":categoryId", categoryId);
  }
  return catgRoute;
}

String getAdminRoute({required String laundryId}) {
  return kAdminView.replaceFirst(":laundryId", laundryId);
}

String getEditInfoRoute({required String laundryId}) {
  return kEditInfoView.replaceFirst(":laundryId", laundryId);
}

// GetX based Router (For navigating)
class XRouter {
  static List<GetPage<dynamic>> mainRoutes = [
        GetPage(name: kHomeRoute, page: () => AdminWrapper()),
        GetPage(name: kOrdersRoute, page: () => ListOrdersScreen()),
        GetPage(
            name: kRestaurantOrderRoute,
            page: () => ViewRestaurantOrderScreen()),
        GetPage(name: kLaundryOrderRoute, page: () => LaundryOrderScreen()),
        GetPage(name: kTaxiOrderRoute, page: () => TaxiOrderView()),
        GetPage(name: kDriversListRoute, page: () => DriversListScreen()),
        GetPage(name: kServicesRoute, page: () => ServicesView()),
        GetPage(name: kAdminDashboard, page: () => AdminDashboardView()),
        // Laundries Services //
        GetPage(
          name: kCategoryView,
          page: () => LaundryOpCategoryScreen(),
        ),
        GetPage(name: kEditInfoView, page: () => LaundryOpEditInfoView()),
        GetPage(name: kAdminView, page: () => LaundryOpAdminView()),
        GetPage(
            name: kAddLaundryServiceRoute, page: () => AddLaundryServiceView()),
        GetPage(
            name: kAddRestaurantServiceRoute,
            page: () => AddRestaurantServiceView()),

        // Restaurants Routes Pages //
        //   GetPage(name: kRestuarntEditInfoView, page: () => ROpEditInfoView()),
        GetPage(name: krMenuView, page: () => ROpMenuView()),
        GetPage(
          name: krCategoryView,
          page: () => ROpCategoryView(),
        ),
        GetPage(
          name: krEditCategoryScreen,
          page: () => ROpCategoryView(),
        ),
        GetPage(
          name: krAddItemView,
          page: () => ROpItemView(),
        ),
        GetPage(
          name: krEditItemView,
          page: () => ROpItemView(),
        ),
        GetPage(name: krOptionView, page: () => ROpOptionView()),
        GetPage(name: krOperators, page: () => OperatorsView())
      ] +
      SharedRouter.sharedRoutes;
}
