import 'package:get/get.dart'; // getX
import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/LaundryOpAdminView.dart'
    deferred as laundryOpAdminView;
import 'package:mezcalmos/LaundryApp/pages/LaundryCategoryView/LaundrOpCategoryView.dart'
    deferred as laundryOpCategoryView;
import 'package:mezcalmos/LaundryApp/pages/LaundryWrapper.dart'
    deferred as laundryWrapper;
import 'package:mezcalmos/LaundryApp/pages/OrdersListViews/LaundryOpCurrentOrders.dart'
    deferred as laundryOpCurrentOrders;
import 'package:mezcalmos/LaundryApp/pages/OrdersListViews/LaundryOpPastOrdersList.dart'
    deferred as laundryOpPastOrdersList;
import 'package:mezcalmos/LaundryApp/pages/TabsView/LaundryTabsView.dart'
    deferred as laundryTabsView;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';

// import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/pages/LaundryOrderView/LaundryOrderView.dart'
    deferred as laundryOrderView;
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
            path: kAdminViewRoute,
            name: kAdminViewRoute,
            builder: () => laundryOpAdminView.LaundryOpAdminView(),
            middleware: <QMiddleware>[
              DefferedLoader(laundryOpAdminView.loadLibrary)
            ]),
        QRoute(
            path: kLaundryTabsViewRoute,
            name: kLaundryTabsViewRoute,
            builder: () => laundryTabsView.LaundryTabsView(),
            middleware: <QMiddleware>[
              DefferedLoader(laundryTabsView.loadLibrary)
            ]),
        QRoute(
            path: kCurrentOrdersListViewRoute,
            name: kCurrentOrdersListViewRoute,
            builder: () =>
                laundryOpCurrentOrders.LaundryOpCurrentOrdersListView(),
            middleware: <QMiddleware>[
              DefferedLoader(laundryOpCurrentOrders.loadLibrary)
            ]),
        QRoute(
            path: kPastOrdersListViewRoute,
            name: kPastOrdersListViewRoute,
            builder: () => laundryOpPastOrdersList.LaundryOpPastOrdersList(),
            middleware: <QMiddleware>[
              DefferedLoader(laundryOpPastOrdersList.loadLibrary)
            ]),
        QRoute(
            path: SharedRoutes.kHomeRoute,
            name: SharedRoutes.kHomeRoute,
            builder: () => laundryWrapper.LaundryWrapper(),
            middleware: <QMiddleware>[
              DefferedLoader(laundryWrapper.loadLibrary)
            ]),
        QRoute(
            path: kCategoryViewRoute,
            name: kCategoryViewRoute,
            builder: () => laundryOpCategoryView.LaundrOpCategoryView(),
            middleware: <QMiddleware>[
              DefferedLoader(laundryOpCategoryView.loadLibrary)
            ]),
        QRoute(
            path: kOrderViewRoute,
            name: kOrderViewRoute,
            builder: () => laundryOrderView.LaundryOrderView(),
            middleware: <QMiddleware>[
              DefferedLoader(laundryOrderView.loadLibrary)
            ]),
      ] +
      SharedRoutes.qRoutes +
      SharedServiceProviderRoutes.routes;

//  +
// NativeOnlyRoutes.routes;
}
