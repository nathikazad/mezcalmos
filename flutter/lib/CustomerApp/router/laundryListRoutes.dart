import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundriesList/CustLaundriesListView.dart'
    deferred as laundriesListView;

import 'package:qlevar_router/qlevar_router.dart';

class LaundryListRouters {
  static const String laundryListView = '/laundriesList';

  String getLaundryOrderWithId(int orderId) => '/laundryOrders/$orderId';

  final routes = QRoute(
      name: laundryListView,
      path: laundryListView,
      builder: () => laundriesListView.CustLaundriesListView());
}
