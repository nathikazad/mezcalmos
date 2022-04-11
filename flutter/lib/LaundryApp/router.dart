import 'package:get/get.dart'; // getX
import 'package:mezcalmos/LaundryApp/bindings/addCategoryBinding.dart';
import 'package:mezcalmos/LaundryApp/pages/AddCategoryScreen/AddCategoryScreen.dart';
import 'package:mezcalmos/LaundryApp/pages/CurrentOrders/CurrentOrderViewScreen/Laundry/LaundryOrderView.dart';
import 'package:mezcalmos/LaundryApp/pages/DashboardView/DashboardView.dart';
import 'package:mezcalmos/LaundryApp/pages/LaundryWrapper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

// const String kCurrentOrdersListRoute = '/currentOrders';
const String kDashboardView = '/dahboard';
const String kLaundryOrderView = '/currentOrders/laundry/:orderId';
const String kRestaurantOrderView = '/currentOrders/restaurant/:orderId';
const String kAddCategoryScreen = '/addCategoryScreen';

String getLaundryOrderRoute(String orderId) {
  return kLaundryOrderView.replaceFirst(":orderId", orderId);
}

String getRestaurantOrderRoute(String orderId) {
  return kRestaurantOrderView.replaceFirst(":orderId", orderId);
}

// GetX based Router (For navigating)
class XRouter {
  static dynamic mainRoutes = [
        GetPage(name: kDashboardView, page: () => DashboardView()),
        // GetPage(
        //     name: kCurrentOrdersListRoute,
        //     page: () => CurrentOrdersListScreen()),
        GetPage(name: kHomeRoute, page: () => LaundryWrapper()),
        GetPage(name: kLaundryOrderView, page: () => LaundryOrderView()),
        GetPage(
          name: kAddCategoryScreen,
          page: () => AddCategoryScreen(),
          binding: AddCategoryBinding(),
        ),
      ] +
      SharedRouter.sharedRoutes;
}
