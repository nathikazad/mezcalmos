import 'package:get/get.dart'; // getX
import 'package:mezcalmos/LaundryApp/pages/AdminView/LaundryOpAdminView.dart';
import 'package:mezcalmos/LaundryApp/pages/CategoryView/CategoryView.dart';
import 'package:mezcalmos/LaundryApp/pages/CurrentOrdersList/LaundryOpOrdersListView.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/EditInfoView.dart';
import 'package:mezcalmos/LaundryApp/pages/LaundryWrapper.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/LaundryOpOrderView.dart';
import 'package:mezcalmos/LaundryApp/pages/PastOrdresList/LaundryOpPastOrdersList.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

// const String kCurrentOrdersListRoute = '/currentOrders';
const String kCurrentOrdersListView = '/orders';
const String kPastOrdersListView = '/pastorders';
const String kAdminView = '/admin/:laundryId';

const String kEditInfoView = '/editInfo/:laundryId';

const String kCategoryView = '/categoryScreen/:laundryId/:categoryId';
const String kOrderView = '/dashboard/orderView/:orderId';

String getCategoryRoute({String? categoryId, required String laundryId}) {
  mezDbgPrint("Categ =========>$categoryId");
  String catgRoute = kCategoryView.replaceFirst(":laundryId", laundryId);
  if (categoryId != null) {
    catgRoute = catgRoute.replaceFirst(":categoryId", categoryId);
  }
  mezDbgPrint("finalroute :======> $catgRoute");
  return catgRoute;
}

String getAdminRoute({required String laundryId}) {
  return kAdminView.replaceFirst(":laundryId", laundryId);
}

String getEditInfoRoute({required String laundryId}) {
  return kEditInfoView.replaceFirst(":laundryId", laundryId);
}

String getLaundryOpOrderRoute(String orderId) {
  return kOrderView.replaceFirst(":orderId", orderId);
}

// GetX based Router (For navigating)
class XRouter {
  static dynamic mainRoutes = [
        GetPage(name: kEditInfoView, page: () => LaundryOpEditInfoView()),
        GetPage(name: kAdminView, page: () => LaundryOpAdminView()),
        GetPage(
            name: kCurrentOrdersListView,
            page: () => LaundryOpCurrentOrdersListView()),
        GetPage(
            name: kPastOrdersListView, page: () => LaundryOpPastOrdersList()),
        GetPage(name: kHomeRoute, page: () => LaundryWrapper()),
        GetPage(
          name: kCategoryView,
          page: () => LaundryOpCategoryScreen(),
        ),
        GetPage(name: kOrderView, page: () => LaundryOpOrderView())
      ] +
      SharedRouter.sharedRoutes;
}
