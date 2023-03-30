import 'package:mezcalmos/CustomerApp/pages/Common/CustReviewsListView.dart'
    deferred as customerReviewListView;
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/CustCardsListView/CustCardsListView.dart'
    deferred as savedCard;
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/CustOrderListView/CustomerOrdersListView.dart'
    deferred as customerOrders;
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/CustSavedLocations/CustSavedLocationsView.dart'
    deferred as savedLocation;
import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
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
      middleware: <QMiddleware>[
        DefferedLoader(customerReviewListView.loadLibrary)
      ],
      builder: () => customerReviewListView.CustReviewsListView(),
    ),
    QRoute(
        path: customerOrdersRoute,
        name: customerOrdersRoute,
        middleware: <QMiddleware>[DefferedLoader(customerOrders.loadLibrary)],
        builder: () => customerOrders.CustomerOrdersListView()),
    QRoute(
        path: savedCards,
        name: savedCards,
        middleware: <QMiddleware>[DefferedLoader(savedCard.loadLibrary)],
        builder: () => savedCard.CustCardsListView()),
    QRoute(
        path: savedLocations,
        name: savedLocations,
        middleware: <QMiddleware>[DefferedLoader(savedLocation.loadLibrary)],
        builder: () => savedLocation.SavedLocationView()),
  ];
}

//card and location
