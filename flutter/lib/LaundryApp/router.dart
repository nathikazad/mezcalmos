import 'package:get/get.dart'; // getX
import 'package:mezcalmos/LaundryApp/pages/AdminView/LaundryOpAdminView.dart';
import 'package:mezcalmos/LaundryApp/pages/LaundryCategoryView/LaundrOpCategoryView.dart';
import 'package:mezcalmos/LaundryApp/pages/LaundryWrapper.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/LaundryOpOrderView.dart';
import 'package:mezcalmos/LaundryApp/pages/OrdersListViews/LaundryOpCurrentOrders.dart';
import 'package:mezcalmos/LaundryApp/pages/OrdersListViews/LaundryOpPastOrdersList.dart';
import 'package:mezcalmos/LaundryApp/pages/TabsView/LaundryTabsView.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

// const String kCurrentOrdersListRoute = '/currentOrders';
const String kCurrentOrdersListView = '/orders';
const String kPastOrdersListView = '/pastorders';
const String kAdminView = '/admin/:laundryId';

const String kEditInfoView = '/editInfo/:laundryId';

const String kCategoryView = '/categoryScreen/:laundryId/:categoryId';
const String kOrderView = '/laundryOrders/:orderId';
const String kLaundryTabsView = '/dashboard';

String getCategoryRoute({int? categoryId, required int laundryId}) {
  mezDbgPrint("Categ =========>$categoryId");
  String catgRoute = kCategoryView.replaceFirst(":laundryId", "$laundryId");
  if (categoryId != null) {
    catgRoute = catgRoute.replaceFirst(":categoryId", "$categoryId");
  }
  mezDbgPrint("finalroute :======> $catgRoute");
  return catgRoute;
}

String getAdminRoute({required int laundryId}) {
  return kAdminView.replaceFirst(":laundryId", "$laundryId");
}

String getEditInfoRoute({required int laundryId}) {
  return kEditInfoView.replaceFirst(":laundryId", "$laundryId");
}

String getLaundryOpOrderRoute(int orderId) {
  return kOrderView.replaceFirst(":orderId", "$orderId");
}

// GetX based Router (For navigating)
class XRouter {
  static dynamic mainRoutes = [
        GetPage(name: kAdminView, page: () => LaundryOpAdminView()),
        GetPage(name: kLaundryTabsView, page: () => LaundryTabsView()),
        GetPage(
            name: kCurrentOrdersListView,
            page: () => LaundryOpCurrentOrdersListView()),
        GetPage(
            name: kPastOrdersListView, page: () => LaundryOpPastOrdersList()),
        GetPage(name: kHomeRoute, page: () => LaundryWrapper()),
        GetPage(
          name: kCategoryView,
          page: () => LaundrOpCategoryView(),
        ),
        GetPage(name: kOrderView, page: () => LaundryOpOrderView())
      ] +
      SharedRouter.sharedRoutes;
}
