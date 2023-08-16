import 'package:mezcalmos/CustomerApp/pages/Taxi/TaxiRequestOrderView/TaxiRequestOrderView.dart'
    deferred as taxiOrderRequestScreen;
import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:qlevar_router/qlevar_router.dart';

class TaxiOrderRoutes {
  static const String taxiOrderRequestRoute = '/taxi';

  final List<QRoute> routes = [
    QRoute(
        path: taxiOrderRequestRoute,
        name: taxiOrderRequestRoute,
        middleware: <QMiddleware>[
          DefferedLoader(taxiOrderRequestScreen.loadLibrary)
        ],
        builder: () => taxiOrderRequestScreen.TaxiRequestOrderView())
  ];
}
