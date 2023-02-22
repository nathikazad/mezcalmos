import 'package:get/get.dart'; // getX
import 'package:mezcalmos/LaundryApp/pages/AdminView/LaundryOpAdminView.dart';
import 'package:mezcalmos/LaundryApp/pages/LaundryCategoryView/LaundrOpCategoryView.dart';
import 'package:mezcalmos/LaundryApp/pages/LaundryWrapper.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/LaundryOpOrderView.dart';
import 'package:mezcalmos/LaundryApp/pages/OrdersListViews/LaundryOpCurrentOrders.dart';
import 'package:mezcalmos/LaundryApp/pages/OrdersListViews/LaundryOpPastOrdersList.dart';
import 'package:mezcalmos/LaundryApp/pages/TabsView/LaundryTabsView.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';

class LaundryAppRoutes {
  static const String kCurrentOrdersListView = '/orders';
  static const String kPastOrdersListView = '/pastorders';
  static const String kAdminView = '/admin/:laundryId';

  static const String kEditInfoView = '/editInfo/:laundryId';

  static const String kCategoryView = '/categoryScreen/:laundryId/:categoryId';
  static const String kOrderView = '/laundryOrders/:orderId';
  static const String kLaundryTabsView = '/dashboard';

  static String getCategoryRoute({int? categoryId, required int laundryId}) {
    mezDbgPrint("Categ =========>$categoryId");
    String catgRoute = kCategoryView.replaceFirst(":laundryId", "$laundryId");
    if (categoryId != null) {
      catgRoute = catgRoute.replaceFirst(":categoryId", "$categoryId");
    }
    mezDbgPrint("finalroute :======> $catgRoute");
    return catgRoute;
  }

  static String getAdminRoute({required int laundryId}) {
    return kAdminView.replaceFirst(":laundryId", "$laundryId");
  }

  static String getEditInfoRoute({required int laundryId}) {
    return kEditInfoView.replaceFirst(":laundryId", "$laundryId");
  }

  static String getLaundryOpOrderRoute(int orderId) {
    return kOrderView.replaceFirst(":orderId", "$orderId");
  }

  static dynamic mainRoutes = [
        GetPage(name: kAdminView, page: () => LaundryOpAdminView()),
        GetPage(name: kLaundryTabsView, page: () => LaundryTabsView()),
        GetPage(
            name: kCurrentOrdersListView,
            page: () => LaundryOpCurrentOrdersListView()),
        GetPage(
            name: kPastOrdersListView, page: () => LaundryOpPastOrdersList()),
        GetPage(name: SharedRoutes.kHomeRoute, page: () => LaundryWrapper()),
        GetPage(
          name: kCategoryView,
          page: () => LaundrOpCategoryView(),
        ),
        GetPage(name: kOrderView, page: () => LaundryOpOrderView())
      ] +
      SharedRoutes.routes +
      SharedServiceProviderRoutes.routes +
      NativeOnlyRoutes.routes;
}
