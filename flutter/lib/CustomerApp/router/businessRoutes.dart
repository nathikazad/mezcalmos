import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustProductView.dart'
    deferred as custProducView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustServiceView.dart'
    deferred as custServiceView;
import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:qlevar_router/qlevar_router.dart';

class CustBusinessRoutes {
  static String custServiceRoute = "/service/:id";
  static String custProductRoute = "/product/:id";

  final List<QRoute> routes = [
    QRoute(
        name: custServiceRoute,
        path: custServiceRoute,
        builder: () => custServiceView.CustServiceView(),
        middleware: <QMiddleware>[
          DefferedLoader(custServiceView.loadLibrary),
        ]),
    QRoute(
        name: custProductRoute,
        path: custProductRoute,
        builder: () => custProducView.CustProductView(),
        middleware: <QMiddleware>[
          DefferedLoader(custProducView.loadLibrary),
        ]),
  ];
}
