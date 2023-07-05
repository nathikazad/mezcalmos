import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/MezAdminApp/MezAdminWrapper.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminMessagesView/AdminMessagesView.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/AdminTabsView.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServiceOrdersView/AdminServiceOrdersView.dart';
import 'package:mezcalmos/RestaurantApp/router/router.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class MezAdminRoutes {
  static const String kTabsViewRoute = '/mezAdminHome';
  static const String kServiceOrdersRoute = '/serviceOrders/:serviceProviderId';
  static const String kAdminMessagesView = '/adminMessages';

  static final List<QRoute> mainRoutes = <QRoute>[
        QRoute(
          path: SharedRoutes.kHomeRoute,
          name: SharedRoutes.kHomeRoute,
          builder: () => MezAdminWrapper(),
        ),
        QRoute(
          path: kTabsViewRoute,
          name: kTabsViewRoute,
          builder: () => AdminTabsView(),
        ),
        QRoute(
          path: kServiceOrdersRoute,
          name: kServiceOrdersRoute,
          builder: () => AdminServiceOrdersView(),
        ),
        QRoute(
            path: kAdminMessagesView,
            name: kAdminMessagesView,
            builder: () => AdminMessagesView())
      ] +
      SharedRoutes.qRoutes +
      RestaurantAppRoutes.sharedWithAdminRoutes +
      LaundryAppRoutes.sharedWithAdminRoutes +
      DeliveryAdminRoutes.sharedWitAdminRoutes +
      BusinessOpRoutes.sharedWitAdminRoutes +
      CustBusinessRoutes.sharedWitAdminRoutes +
      SharedServiceProviderRoutes.routes +
      NativeOnlyRoutes.routes;
}
