import 'package:mezcalmos/CustomerApp/pages/CustDelivery/CustDeliveryRequest/CustDeliveryRequestView.dart'
    deferred as dvRequestView;
import 'package:mezcalmos/CustomerApp/pages/CustDelivery/CustDeliveryWrapperView.dart'
    deferred as dvWrapperView;
import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:qlevar_router/qlevar_router.dart';

class CustDeliveryRoutes {
  static const String deliveryWrapperRoute = "/delivery";
  static const String deliveryRequestRoute = "/request";
  final List<QRoute> routes = <QRoute>[
    QRoute(
        path: deliveryWrapperRoute,
        name: deliveryWrapperRoute,
        builder: () => dvWrapperView.CustDeliveryWrapperView(),
        middleware: <QMiddleware>[DefferedLoader(dvWrapperView.loadLibrary)]),
    QRoute(
        path: deliveryRequestRoute,
        name: deliveryRequestRoute,
        builder: () => dvRequestView.CustDeliveryRequestView(),
        middleware: <QMiddleware>[DefferedLoader(dvRequestView.loadLibrary)]),
  ];
}
