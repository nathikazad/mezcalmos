import 'package:get/get.dart'; // getX
import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/DeliveryApp/pages/DeliveryWrapper.dart'
    deferred as deliveryWrapper;
import 'package:mezcalmos/DeliveryApp/pages/OrderDetails/OrderDetailsScreen.dart'
    deferred as orderDetailsScreen;
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/CurrentOrdersListScreen.dart'
    deferred as currentOrderList;
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/PastOrdersView.dart'
    deferred as pastOrdersView;
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/DvOrderView.dart'
    deferred as dvOrderView;
import 'package:mezcalmos/DeliveryApp/pages/Unauthorized/UnAuthrizedDriverView.dart'
    deferred as unAuthorizedDriverView;

import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class DeliveryAppRoutes {
  static const String kCurrentOrdersListRoute = '/orders';
  static const String kLaundryOrderViewRoute = '/laundryOrders/:orderId';
  static const String kRestaurantOrderViewRoute = '/restaurantOrders/:orderId';
  static const String kOrderDetailsViewRoute = "/orderDetails/:orderId";
  static const String kPastOrdersViewRoute = "/pastOrders";
  static const String kDriverUnAuthRoute = "/driverUnauth";

  //recheck
  static String getLaundryOrderRoute(int orderId) {
    return kLaundryOrderViewRoute.replaceFirst(":orderId", orderId.toString());
  }

  static String getRestaurantOrderRoute(int orderId) {
    return kRestaurantOrderViewRoute.replaceFirst(
        ":orderId", orderId.toString());
  }

  static final List<QRoute> mainRoutes = <QRoute>[
        QRoute(
            path: kCurrentOrdersListRoute,
            name: kCurrentOrdersListRoute,
            builder: () => currentOrderList.CurrentOrdersListScreen(),
            middleware: <QMiddleware>[
              DefferedLoader(currentOrderList.loadLibrary)
            ]),
        QRoute(
            path: SharedRoutes.kHomeRoute,
            name: SharedRoutes.kHomeRoute,
            builder: () => deliveryWrapper.DeliveryWrapper(),
            middleware: <QMiddleware>[
              DefferedLoader(deliveryWrapper.loadLibrary)
            ]),
        QRoute(
            path: kRestaurantOrderViewRoute,
            name: kRestaurantOrderViewRoute,
            builder: () => dvOrderView.DvOrderView(),
            middleware: <QMiddleware>[DefferedLoader(dvOrderView.loadLibrary)]),
        QRoute(
            path: kOrderDetailsViewRoute,
            name: kOrderDetailsViewRoute,
            builder: () => orderDetailsScreen.OrderDetailsScreen(),
            middleware: <QMiddleware>[
              DefferedLoader(orderDetailsScreen.loadLibrary)
            ]),
        QRoute(
            path: kPastOrdersViewRoute,
            name: kPastOrdersViewRoute,
            builder: () => pastOrdersView.DriverPastOrdersView(),
            middleware: <QMiddleware>[
              DefferedLoader(pastOrdersView.loadLibrary)
            ]),
        QRoute(
            path: kDriverUnAuthRoute,
            name: kDriverUnAuthRoute,
            builder: () => unAuthorizedDriverView.UnAuthorizedDriverView(),
            middleware: <QMiddleware>[
              DefferedLoader(unAuthorizedDriverView.loadLibrary)
            ]),
      ] +
      SharedRoutes.qRoutes +
      NativeOnlyRoutes.routes;
}
