import 'package:mezcalmos/LaundryApp/pages/AdminView/LaundryOpAdminView.dart';
import 'package:mezcalmos/LaundryApp/pages/LaundryCategoryView/LaundrOpCategoryView.dart';
import 'package:mezcalmos/LaundryApp/pages/LaundryWrapper.dart';
import 'package:mezcalmos/LaundryApp/pages/OrdersListViews/LaundryOpCurrentOrders.dart';
import 'package:mezcalmos/LaundryApp/pages/OrdersListViews/LaundryOpPastOrdersList.dart';
import 'package:mezcalmos/LaundryApp/pages/TabsView/LaundryTabsView.dart';
import 'package:mezcalmos/Shared/pages/LaundryOrderView/LaundryOrderView.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class LaundryAppRoutes {
  static const String kCurrentOrdersListViewRoute = '/orders';
  static const String kPastOrdersListViewRoute = '/pastorders';
  static const String kAdminViewRoute = '/admin/:laundryId';
  static const String kEditInfoView = '/editInfo/:laundryId';
  static const String kCategoryViewRoute =
      '/categoryScreen/:laundryId/:categoryId';
  static const String kOrderViewRoute = '/laundryOrders/:orderId';
  static const String kLaundryTabsViewRoute = '/dashboard';

  static String getEditInfoRoute({required int laundryId}) {
    return kEditInfoView.replaceFirst(":laundryId", "$laundryId");
  }

  static String getLaundryOpOrderRoute(int orderId) {
    return kOrderViewRoute.replaceFirst(":orderId", "$orderId");
  }

  static final List<QRoute> mainRoutes = <QRoute>[
        QRoute(
          path: kLaundryTabsViewRoute,
          name: kLaundryTabsViewRoute,
          builder: () => LaundryTabsView(),
        ),
        QRoute(
          path: kCurrentOrdersListViewRoute,
          name: kCurrentOrdersListViewRoute,
          builder: () => LaundryOpCurrentOrdersListView(),
        ),
        QRoute(
          path: kPastOrdersListViewRoute,
          name: kPastOrdersListViewRoute,
          builder: () => LaundryOpPastOrdersList(),
        ),
        QRoute(
          path: SharedRoutes.kHomeRoute,
          name: SharedRoutes.kHomeRoute,
          builder: () => LaundryWrapper(),
        ),
      ] +
      sharedWithAdminRoutes +
      SharedRoutes.qRoutes +
      SharedServiceProviderRoutes.routes;
  static final List<QRoute> sharedWithAdminRoutes = [
    QRoute(
      path: kAdminViewRoute,
      name: kAdminViewRoute,
      builder: () => LaundryOpAdminView(),
    ),
    QRoute(
      path: kOrderViewRoute,
      name: kOrderViewRoute,
      builder: () => LaundryOrderView(),
    ),
    QRoute(
      path: kCategoryViewRoute,
      name: kCategoryViewRoute,
      builder: () => LaundrOpCategoryView(),
    ),
  ];

//  +
// NativeOnlyRoutes.routes;
}
