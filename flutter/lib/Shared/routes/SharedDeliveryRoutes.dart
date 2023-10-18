import 'package:mezcalmos/DeliveryApp/pages/DvConvoView/DvConvoView.dart';
import 'package:mezcalmos/DeliveryApp/pages/DvOrderView/DvOrderView.dart';
import 'package:qlevar_router/qlevar_router.dart';

class SharedDvRoutes {
  static const String kDriverConvoRoute = "/convo/:phoneNumber";
  static const String kDvOrderView = '/orders/:orderId';
  static String getDvOrderRoute(int orderId) {
    return kDvOrderView.replaceFirst(":orderId", "$orderId");
  }

  static final List<QRoute> mainRoutes = <QRoute>[
    QRoute(
      path: kDriverConvoRoute,
      name: kDriverConvoRoute,
      builder: () => DvConvoView(),
    ),
    QRoute(
      path: kDvOrderView,
      name: kDvOrderView,
      builder: () => DvOrderView(),
    ),
  ];
}
