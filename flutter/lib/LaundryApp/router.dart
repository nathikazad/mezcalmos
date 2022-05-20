import 'package:get/get.dart'; // getX
import 'package:mezcalmos/LaundryApp/pages/CategoryView/CategoryView.dart';
import 'package:mezcalmos/LaundryApp/pages/DashboardView/DashboardView.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/EditInfoView.dart';
import 'package:mezcalmos/LaundryApp/pages/LaundryWrapper.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/LaundryOpOrderView.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

// const String kCurrentOrdersListRoute = '/currentOrders';
const String kDashboardView = '/dahboard';
const String kEditInfoView = '/editInfo';

const String kCategoryScreen = '/categoryScreen/';
const String kEditCategoryScreen = '/categoryScreen/:categoryId';
const String kOrderView = '/dashboard/orderView/:orderId';

String getCategoryEditRoute(String categoryId) {
  return kEditCategoryScreen.replaceFirst(":categoryId", categoryId);
}

String getLaundryOpOrderRoute(String orderId) {
  return kOrderView.replaceFirst(":orderId", orderId);
}

// GetX based Router (For navigating)
class XRouter {
  static dynamic mainRoutes = [
        GetPage(name: kDashboardView, page: () => DashboardView()),
        GetPage(name: kEditInfoView, page: () => LaundryOpEditInfoView()),
        GetPage(name: kHomeRoute, page: () => LaundryWrapper()),
        GetPage(
          name: kCategoryScreen,
          page: () => LaundryOpCategoryScreen(),
        ),
        GetPage(
          name: kEditCategoryScreen,
          page: () => LaundryOpCategoryScreen(),
        ),
        GetPage(name: kOrderView, page: () => LaundryOpOrderView())
      ] +
      SharedRouter.sharedRoutes;
}
