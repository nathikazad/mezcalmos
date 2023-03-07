import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrderView/DvCompanyOrderView.dart'
    deferred as dvCompanyOrderView;
import 'package:mezcalmos/LaundryApp/pages/AdminView/LaundryOpAdminView.dart'
    deferred as laundryOpAdminView;
import 'package:mezcalmos/LaundryApp/pages/LaundryCategoryView/LaundrOpCategoryView.dart'
    deferred as laundryOpCategoryView;
import 'package:mezcalmos/Shared/pages/LaundryOrderView/LaundryOrderView.dart'
    deferred as laundryOrderView;
import 'package:qlevar_router/qlevar_router.dart';

class LaundryRoutes {
  static const String dvCompanyOrderViewRoute = "/deliveryOrders/:orderId";
  static const String laundryOrderViewRoute = '/laundryOrders/:orderId';
  static const String laundryCategoryViewRoute =
      '/categoryScreen/:laundryId/:categoryId';
  static const String laundryAdminView = '/laundry/admin/:laundryId';

  static final List<QRoute> mainRoutes = <QRoute>[
    QRoute(
        path: dvCompanyOrderViewRoute,
        name: dvCompanyOrderViewRoute,
        builder: () => dvCompanyOrderView.DvCompanyOrderView(),
        middleware: <QMiddleware>[
          DefferedLoader(dvCompanyOrderView.loadLibrary)
        ]),
    QRoute(
        path: laundryOrderViewRoute,
        name: laundryOrderViewRoute,
        builder: () => laundryOrderView.LaundryOrderView(),
        middleware: <QMiddleware>[
          DefferedLoader(laundryOrderView.loadLibrary)
        ]),
    QRoute(
        path: laundryCategoryViewRoute,
        name: laundryCategoryViewRoute,
        builder: () => laundryOpCategoryView.LaundrOpCategoryView(),
        middleware: <QMiddleware>[
          DefferedLoader(laundryOpCategoryView.loadLibrary)
        ]),
    QRoute(
        path: laundryAdminView,
        name: laundryAdminView,
        builder: () => laundryOpAdminView.LaundryOpAdminView(),
        middleware: <QMiddleware>[
          DefferedLoader(laundryOpAdminView.loadLibrary)
        ]),
  ];
}
