import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrderView/DvCompanyOrderView.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/LaundryOpAdminView.dart';
import 'package:mezcalmos/LaundryApp/pages/LaundryCategoryView/LaundrOpCategoryView.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/pages/LaundryOrderView/LaundryOrderView.dart';
import 'package:qlevar_router/qlevar_router.dart';

class LaundryRoutes {
  static const String laundryAdminView = '/laundry/admin/:laundryId';

  static final List<QRoute> mainRoutes = <QRoute>[
    QRoute(
      path: DeliveryAdminRoutes.kOrderViewRoute,
      name: DeliveryAdminRoutes.kOrderViewRoute,
      builder: () => DvCompanyOrderView(),
    ),
    QRoute(
      path: LaundryAppRoutes.kOrderViewRoute,
      name: LaundryAppRoutes.kOrderViewRoute,
      builder: () => LaundryOrderView(),
    ),
    QRoute(
      path: LaundryAppRoutes.kCategoryViewRoute,
      name: LaundryAppRoutes.kCategoryViewRoute,
      builder: () => LaundrOpCategoryView(),
    ),
    QRoute(
      path: LaundryAppRoutes.kAdminViewRoute,
      name: LaundryAppRoutes.kAdminViewRoute,
      builder: () => LaundryOpAdminView(),
    ),
  ];
}
