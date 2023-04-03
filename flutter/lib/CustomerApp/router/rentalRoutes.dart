import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/RentalServicesView.dart'
    deferred as rentalView;
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/Homes/AssetListsView.dart'
    deferred as rentalServiceView;
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/Homes/HomeServiceView/HomeServiceView.dart'
    deferred as homeServiceView;

class RentalRoutes {
  static String rentalViewRoute = "/rental";
  static String rentalServiceRoute = "/rentalServiceView";
  static String homeServiceRoute = "/homeServiceView";
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
        builder: () => rentalServiceView.HomesServiceView(),
        middleware: <QMiddleware>[
          DefferedLoader(rentalServiceView.loadLibrary),
        ]),
    QRoute(
        name: homeServiceRoute,
        path: homeServiceRoute,
        builder: () => homeServiceView.HomeServiceView(),
        middleware: <QMiddleware>[
          DefferedLoader(homeServiceView.loadLibrary),
        ]),
  ];
}
