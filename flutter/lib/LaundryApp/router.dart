import 'package:get/get.dart'; // getX
import 'package:mezcalmos/LaundryApp/pages/AddCategoryScreen/AddCategoryScreen.dart';
import 'package:mezcalmos/LaundryApp/pages/DashboardView/DashboardView.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/EditInfoView.dart';
import 'package:mezcalmos/LaundryApp/pages/LaundryWrapper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

// const String kCurrentOrdersListRoute = '/currentOrders';
const String kDashboardView = '/dahboard';
const String kEditInfoView = '/editInfo';
const String kLaundryOrderView = '/currentOrders/laundry/:orderId';
const String kRestaurantOrderView = '/currentOrders/restaurant/:orderId';
const String kAddCategoryScreen = '/addCategoryScreen';

// String getLaundryOrderRoute(String orderId) {
//   return kLaundryOrderView.replaceFirst(":orderId", orderId);
// }

// String getRestaurantOrderRoute(String orderId) {
//   return kRestaurantOrderView.replaceFirst(":orderId", orderId);
// }

// GetX based Router (For navigating)
class XRouter {
  static dynamic mainRoutes = [
        GetPage(name: kDashboardView, page: () => DashboardView()),
        GetPage(name: kEditInfoView, page: () => LaundryOpEditInfoView()),
        GetPage(name: kHomeRoute, page: () => LaundryWrapper()),
        GetPage(
          name: kAddCategoryScreen,
          page: () => AddCategoryScreen(),
        ),
      ] +
      SharedRouter.sharedRoutes;
}
