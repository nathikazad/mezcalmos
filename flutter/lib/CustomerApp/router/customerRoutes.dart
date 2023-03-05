import 'package:mezcalmos/CustomerApp/pages/Common/CustReviewsListView.dart'
    deferred as customerReviewListView;
import 'package:mezcalmos/CustomerApp/pages/CustOrderListView/CustomerOrdersListView.dart'
    deferred as customerOrders;
import 'package:mezcalmos/CustomerApp/pages/CustCardsListView/CustCardsListView.dart'
    deferred as savedCard;
import 'package:mezcalmos/CustomerApp/pages/CustSavedLocations/CustSavedLocationsView.dart'
    deferred as savedLocation;
import 'package:qlevar_router/qlevar_router.dart';

class CustomerRoutes {
  static const String customerReviewRoute = '/reviews';
  static const String customerOrdersRoute = '/orders';
  static const String savedCards = '/savedCards';
  static const String savedLocations = '/savedLocations';

  static String getReviewsListRoute(int serviceId) =>
      '$customerReviewRoute/$serviceId';

  final List<QRoute> routes = [
    QRoute(
      path: customerReviewRoute,
      name: customerReviewRoute,
      builder: () => customerReviewListView.CustReviewsListView(),
    ),
    QRoute(
        path: customerOrdersRoute,
        name: customerOrdersRoute,
        builder: () => customerOrders.CustomerOrdersListView()),
    QRoute(
        path: savedCards,
        name: savedCards,
        builder: () => savedCard.CustCardsListView()),
    QRoute(
        path: savedLocations,
        name: savedLocations,
        builder: () => savedLocation.SavedLocationView()),
  ];
}

//card and location
