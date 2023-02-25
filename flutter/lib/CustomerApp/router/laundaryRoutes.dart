import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundriesList/CustLaundriesListView.dart'
    deferred as laundriesListView;
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/LaundryCurrentOrderView.dart'
    deferred as laundryOrderView;
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryRequestView/LaundryOrderRequestView.dart'
    deferred as LaundryOrderRequestView;
import 'package:mezcalmos/CustomerApp/pages/Laundry/SingleLaundry/SingleLaundryScreen.dart'
    deferred as singleLaundryView;

import 'package:qlevar_router/qlevar_router.dart';

class LaundryRouters {
  static const String laundryOrderRequest = '/laundryOrderRequest';
  static const String laundryCurrentOrder = '/laundryOrders';
  static const String laundryListView = '/laundriesList';

  String getLaundryOrderWithId(int orderId) => '/laundryOrders/$orderId';

  final routes = QRoute(
      path: laundryOrderRequest,
      name: laundryOrderRequest,
      builder: () => LaundryOrderRequestView.CustLaundryOrderRequestView(),
      children: [
        QRoute(
          path: laundryCurrentOrder,
          name: laundryCurrentOrder,
          builder: () => laundryOrderView.CustLaundryOrderView(),
        ),
        QRoute(
            name: laundryListView,
            path: laundryListView,
            builder: () => laundriesListView.CustLaundriesListView()),
      ]);
}
