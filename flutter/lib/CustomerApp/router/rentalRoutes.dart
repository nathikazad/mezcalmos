import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/RentalView.dart'
    deferred as rentalView;
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/Homes/HomesServiceView.dart'
    deferred as rentalServiceView;

class RentalRoutes {
  static String rentalViewRoute = "/rental";
  static String homeServiceRoute = "/rentalServiceView";
  final List<QRoute> routes = [
    QRoute(
        name: rentalViewRoute,
        path: rentalViewRoute,
        builder: () => rentalView.RentalView(),
        middleware: <QMiddleware>[
          DefferedLoader(rentalView.loadLibrary),
        ]),
    QRoute(
        name: homeServiceRoute,
        path: homeServiceRoute,
        builder: () => rentalServiceView.HomesServiceView(),
        middleware: <QMiddleware>[
          DefferedLoader(rentalServiceView.loadLibrary),
        ]),
  ];
}
