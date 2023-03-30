import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Laundry/LaundriesList/CustLaundriesListView.dart'
    deferred as laundriesListView;
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Laundry/LaundryCurrentOrderView/CustLaundryOrderView.dart'
    deferred as laundryOrderView;
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Laundry/LaundryRequestView/LaundryOrderRequestView.dart'
    deferred as LaundryOrderRequestView;
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Laundry/SingleLaundry/SingleLaundryScreen.dart'
    deferred as singleLaundryView;
import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:qlevar_router/qlevar_router.dart';

class LaundryRoutes {
  static const String laundryOrderRequestRoute =
      '/laundryOrderRequest/:laundryId';
  static const String laundryOrdersRoute = '/laundryOrders/:orderId';
  static const String laundriesListRoute = '/laundriesList';
  static const String singleLaundryRoute = "/singleLaundry/:laundryId";

  static String getLaundryOrderWithId(int orderId) => '/laundryOrders/$orderId';

  final List<QRoute> routes = <QRoute>[
    QRoute(
        name: laundriesListRoute,
        path: laundriesListRoute,
        builder: () => laundriesListView.CustLaundriesListView(),
        middleware: <QMiddleware>[
          DefferedLoader(laundriesListView.loadLibrary)
        ]),
    QRoute(
        path: laundryOrderRequestRoute,
        name: laundryOrderRequestRoute,
        builder: () => LaundryOrderRequestView.CustLaundryOrderRequestView(),
        middleware: <QMiddleware>[
          DefferedLoader(LaundryOrderRequestView.loadLibrary)
        ]),
    QRoute(
        path: laundryOrdersRoute,
        name: laundryOrdersRoute,
        builder: () => laundryOrderView.CustLaundryOrderView(),
        middleware: <QMiddleware>[
          DefferedLoader(laundryOrderView.loadLibrary)
        ]),
    QRoute(
        name: singleLaundryRoute,
        path: singleLaundryRoute,
        builder: () => singleLaundryView.SingleLaundryScreen(),
        middleware: <QMiddleware>[
          DefferedLoader(singleLaundryView.loadLibrary)
        ]),
  ];
}
