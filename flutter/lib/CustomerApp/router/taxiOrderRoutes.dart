import 'package:mezcalmos/CustomerApp/pages/Taxi/TaxiOrderView/CustTaxiOrderView.dart'
    deferred as taxiOrderScreen;
import 'package:mezcalmos/CustomerApp/pages/Taxi/TaxiRequestOrderView/TaxiRequestOrderView.dart'
    deferred as taxiOrderRequestScreen;
import 'package:mezcalmos/CustomerApp/pages/Taxi/TextConfimOrderView/TaxiConfirmOrderView.dart'
    deferred as taxiOrderConfirmScreen;
import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:qlevar_router/qlevar_router.dart';

class TaxiOrderRoutes {
  static const String taxiOrderRequestRoute = '/taxi';
  static const String taxiOrderConfrimRoute = '/confirm';
  static const String taxiOrderRoute = '/taxiOrders/:id';

  final List<QRoute> routes = [
    QRoute(
        path: taxiOrderConfrimRoute,
        name: taxiOrderConfrimRoute,
        middleware: <QMiddleware>[
          DefferedLoader(taxiOrderConfirmScreen.loadLibrary)
        ],
        builder: () => taxiOrderConfirmScreen.TaxiConfirmOrderView()),
    QRoute(
        path: taxiOrderRoute,
        name: taxiOrderRoute,
        middleware: <QMiddleware>[DefferedLoader(taxiOrderScreen.loadLibrary)],
        builder: () => taxiOrderScreen.CustTaxiOrderView()),
    QRoute(
        path: taxiOrderRequestRoute,
        name: taxiOrderRequestRoute,
        middleware: <QMiddleware>[
          DefferedLoader(taxiOrderRequestScreen.loadLibrary)
        ],
        builder: () => taxiOrderRequestScreen.TaxiRequestOrderView())
  ];
}
