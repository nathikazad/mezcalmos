import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Courrier/CustCourierOrderView/CustCourierOrderView.dart'
    deferred as viewCourierOrder;
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Courrier/CustCourierServiceView/CustCourierServiceView.dart'
    deferred as courierService;
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Courrier/CustCourrierServicesListView/CustCourrierServicesListView.dart'
    deferred as courierList;
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Courrier/CustRequestCourrierView/CustRequestCourierView.dart'
    deferred as requestCourier;
import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:qlevar_router/qlevar_router.dart';

class CourierRoutes {
  static const String kCouriersRoute = '/couriers';
  static const String kCourierServiceRoute = '/courier/:companyId';
  static const String kCourierRequestRoute = '/requestCourier/:courierId';
  static const String kCourierOrderView = '/courierOrders/:orderId';
  static String custCourierOrderRoute(int orderId) {
    return kCourierOrderView.replaceFirst(":orderId", "$orderId");
  }

  final List<QRoute> routes = [
    QRoute(
        path: kCouriersRoute,
        name: kCouriersRoute,
        builder: () => courierList.CustCourierServicesListView(),
        middleware: <QMiddleware>[DefferedLoader(courierList.loadLibrary)]),
    QRoute(
        path: kCourierServiceRoute,
        name: kCourierServiceRoute,
        builder: () => courierService.CustCourierServiceView(),
        middleware: <QMiddleware>[DefferedLoader(courierService.loadLibrary)]),
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
