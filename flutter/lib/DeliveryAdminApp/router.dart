// GetX based Router (For navigating)
import 'package:get/route_manager.dart';
import 'package:mezcalmos/DeliveryAdminApp/DeliveryAdminWrapper.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/DvOpTabsView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrderView/DvCompanyOrderView.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';

class DeliveryAdminRoutes {
  static const String kDeliveryOpHomeScreen = '/home';

  static const String kNotAuthorizedOperator = "/unauthorized";
  static const String kOrderView = "/orders/:orderId";

  static String getDvCompanyOrderRoute(int orderId) {
    return kOrderView.replaceFirst(":orderId", "$orderId");
  }

  static List<GetPage<dynamic>> mainRoutes = [
        GetPage(name: kDeliveryOpHomeScreen, page: () => DvOpTabsView()),
        GetPage(
          name: SharedRoutes.kHomeRoute,
          page: () => DeliveryAdminWrapper(),
        ),
        GetPage(
          name: kOrderView,
          page: () => DvCompanyOrderView(),
        ),
      ] +
      SharedRoutes.routes +
      SharedServiceProviderRoutes.routes +
      NativeOnlyRoutes.routes;
}
