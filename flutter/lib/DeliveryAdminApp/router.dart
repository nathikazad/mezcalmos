import 'package:get/get.dart'; // getX
import 'package:mezcalmos/DeliveryAdminApp/pages/AddServiceViews/AddLaundryServiceView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/AdminWrapper.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/DriversListView/DriverListScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryOrder/LaundryOrderScreen.dart.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ListOrdersScreen/ListOrdersScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/TaxiOrderView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/ViewRestaurantOrderScreen.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/ServicesView/ServicesView.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/LaundryOpAdminView.dart';
import 'package:mezcalmos/LaundryApp/pages/CategoryView/CategoryView.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/EditInfoView.dart';
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
const String kAdminView = '/admin/:laundryId';

const String kEditInfoView = '/editInfo/:laundryId';

const String kCategoryView = '/categoryScreen/:laundryId/:categoryId';
const String kAddLaundryServiceRoute = "/addLaundryService";

String getRestaurantRoute(String restaurantId) {
  return kRestaurantRoute.replaceFirst(":restaurantId", restaurantId);
}

String getRestaurantOrderRoute(String orderId) {
  return kRestaurantOrderRoute.replaceFirst(":orderId", orderId);
}

String getLaundryOrderRoute(String orderId) {
  return kLaundryOrderRoute.replaceFirst(":orderId", orderId);
}

String getTaxiOrderRoute(String orderId) {
  return kTaxiOrderRoute.replaceFirst(":orderId", orderId);
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
        // Laundries Services //
        GetPage(
          name: kCategoryView,
          page: () => LaundryOpCategoryScreen(),
        ),
        GetPage(name: kEditInfoView, page: () => LaundryOpEditInfoView()),
        GetPage(name: kAdminView, page: () => LaundryOpAdminView()),
        GetPage(
            name: kAddLaundryServiceRoute, page: () => AddLaundryServiceView()),
      ] +
      SharedRouter.sharedRoutes;
}
