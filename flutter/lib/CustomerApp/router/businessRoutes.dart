import 'package:mezcalmos/CustomerApp/pages/Businesses/EventsViews/CustEventsListView.dart'
    deferred as custEventsListView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustProductView.dart'
    deferred as custProducView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustServiceView.dart'
    deferred as custServiceView;
import 'package:mezcalmos/CustomerApp/pages/Businesses/ServicesViews/CustServicesListView.dart'
    deferred as custServicesListView;
import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:qlevar_router/qlevar_router.dart';

class CustBusinessRoutes {
  static String custServiceRoute = "/service/:id";
  static String custProductRoute = "/product/:id";
  static String custEventsListRoute = "/customer/events";
  static String custServicesListRoute = "/customer/services";

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
    QRoute(
        name: custEventsListRoute,
        path: custEventsListRoute,
        builder: () => custEventsListView.CustEventsListView(),
        middleware: <QMiddleware>[
          DefferedLoader(custEventsListView.loadLibrary),
        ]),
    QRoute(
        name: custServicesListRoute,
        path: custServicesListRoute,
        builder: () => custServicesListView.CustServicesListView(),
        middleware: <QMiddleware>[
          DefferedLoader(custServicesListView.loadLibrary),
        ]),
  ];
}
