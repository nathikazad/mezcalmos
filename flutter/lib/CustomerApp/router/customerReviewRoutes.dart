import 'package:mezcalmos/CustomerApp/pages/Common/CustReviewsListView.dart'
    deferred as customerReviewListView;
import 'package:qlevar_router/qlevar_router.dart';

class CustomerReviewRoutes {
  static const String customerReviewRoute = '/reviews';

  String getReviewsListRoute(int serviceId) =>
      '$customerReviewRoute/$serviceId';

  final routes = QRoute(
    path: customerReviewRoute,
    name: customerReviewRoute,
    builder: () => customerReviewListView.CustReviewsListView(),
  );
}
