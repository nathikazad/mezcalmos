import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrderView/DvCompanyOrderView.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/LaundryOpAdminView.dart';
import 'package:mezcalmos/LaundryApp/pages/LaundryCategoryView/LaundrOpCategoryView.dart';
import 'package:mezcalmos/Shared/pages/LaundryOrderView/LaundryOrderView.dart';
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
      builder: () => DvCompanyOrderView(),
    ),
    QRoute(
      path: laundryOrderViewRoute,
      name: laundryOrderViewRoute,
      builder: () => LaundryOrderView(),
    ),
    QRoute(
      path: laundryCategoryViewRoute,
      name: laundryCategoryViewRoute,
      builder: () => LaundrOpCategoryView(),
    ),
    QRoute(
      path: laundryAdminView,
      name: laundryAdminView,
      builder: () => LaundryOpAdminView(),
    ),
  ];
}
