import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/RentalServicesView.dart'
    deferred as rentalView;
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/Homes/AssetListsView.dart'
    deferred as rentalServiceView;
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/Homes/AgencyServiceView/AgencyServiceView.dart'
    deferred as homeServiceView;
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/Homes/AssetServiceView/AssetServiceView.dart'
    deferred as assetService;

class RentalRoutes {
  static String rentalViewRoute = "/rental";
  static String rentalServiceRoute = "/rentalServiceView";
  static String homeServiceRoute = "/homeServiceView";
  static String assetServiceRoute = "/assetServiceView";

  final List<QRoute> routes = [
    QRoute(
        name: rentalViewRoute,
        path: rentalViewRoute,
        builder: () => rentalView.RentalView(),
        middleware: <QMiddleware>[
          DefferedLoader(rentalView.loadLibrary),
        ]),
    QRoute(
        name: rentalServiceRoute,
        path: rentalServiceRoute,
        builder: () => rentalServiceView.AssetListsView(),
        middleware: <QMiddleware>[
          DefferedLoader(rentalServiceView.loadLibrary),
        ]),
    QRoute(
        name: homeServiceRoute,
        path: homeServiceRoute,
        builder: () => homeServiceView.AgencyServiceView(),
        middleware: <QMiddleware>[
          DefferedLoader(homeServiceView.loadLibrary),
        ]),
    QRoute(
        name: assetServiceRoute,
        path: assetServiceRoute,
        builder: () => assetService.AssetServiceView(),
        middleware: <QMiddleware>[
          DefferedLoader(assetService.loadLibrary),
        ]),
  ];
}
