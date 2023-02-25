import 'package:mezcalmos/CustomerApp/pages/Laundry/SingleLaundry/SingleLaundryScreen.dart'
    deferred as singleLaundryView;

import 'package:qlevar_router/qlevar_router.dart';

class SingleLaundryRoutes {
  static const String singleLaundryRoute = '/laundriesList';

  String getSingleLaundryRoute(int laundryId) => '/laundriesList/$laundryId';

  final routes = QRoute(
      name: singleLaundryRoute,
      path: singleLaundryRoute,
      builder: () => singleLaundryView.SingleLaundryScreen());
}
