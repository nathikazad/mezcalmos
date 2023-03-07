import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/RestaurantApp/pages/SingleOrderViews/ROpSelfDeliveryView/ROpSelfDeliveryView.dart'
    deferred as selfDeliveryView;
import 'package:qlevar_router/qlevar_router.dart';

class DeliveryRouter {
  static const String pickDriverRoute =
      '/pickDriver/:serviceProviderId/:orderId';
  static const String selfDeliveryRoute = '/selfDelivery/:orderId';

  final List<QRoute> routes = [
    QRoute(
        path: selfDeliveryRoute,
        name: selfDeliveryRoute,
        builder: () => selfDeliveryView.ROpSelfDeliveryView(),
        middleware: <QMiddleware>[
          DefferedLoader(selfDeliveryView.loadLibrary)
        ]),
  ];
}
