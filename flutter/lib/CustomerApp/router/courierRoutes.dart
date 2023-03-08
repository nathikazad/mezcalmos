import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';

import 'package:mezcalmos/CustomerApp/pages/Courrier/CustCourierOrderView/CustCourierOrderView.dart'
    deferred as viewCourierOrder;
import 'package:mezcalmos/CustomerApp/pages/Courrier/CustCourrierServicesListView/CustCourrierServicesListView.dart'
    deferred as courierList;
import 'package:mezcalmos/CustomerApp/pages/Courrier/CustRequestCourrierView/CustRequestCourierView.dart'
    deferred as requestCourier;
import 'package:qlevar_router/qlevar_router.dart';

class CourierRouter {
  static const String kCouriersRoute = '/couriers';
  static const String kCourierRequestRoute = '/requestCourier/:courierId';
  static const String kCourierOrderView = '/courierOrders/:orderId';
  final List<QRoute> routes = [
    QRoute(
        path: kCouriersRoute,
        name: kCouriersRoute,
        builder: () => courierList.CustCourierServicesListView(),
        middleware: <QMiddleware>[DefferedLoader(courierList.loadLibrary)]),
    QRoute(
        path: kCourierRequestRoute,
        name: kCourierRequestRoute,
        builder: () => requestCourier.CustRequestCourierView(),
        middleware: <QMiddleware>[DefferedLoader(requestCourier.loadLibrary)]),
    QRoute(
      path: kCourierOrderView,
      name: kCourierOrderView,
      middleware: <QMiddleware>[DefferedLoader(viewCourierOrder.loadLibrary)],
      builder: () => viewCourierOrder.CustCourierOrderView(),
    )
  ];
}
