import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/RentalServicesView.dart'
    deferred as rentalView;
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/Homes/HomeAssetListsView.dart'
    deferred as homeAssetListView;
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/Homes/AgencyServiceView/AgencyServiceView.dart'
    deferred as homeServiceView;
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/Homes/AssetServiceView/AssetServiceView.dart'
    deferred as assetService;
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/OtherView/OtherAssetLists.dart'
    deferred as otherAssetListView;

class RentalRoutes {
  static String rentalViewRoute = "/rental";
  static String homeAssetRoute = "/homeAssets";
  static String homeServiceRoute = "/homeServiceView";
  static String assetServiceRoute = "/assetServiceView";
  static String otherAssetRoute = "/otherAssets";

  final List<QRoute> routes = [
    QRoute(
        name: rentalViewRoute,
        path: rentalViewRoute,
        builder: () => rentalView.RentalView(),
        middleware: <QMiddleware>[
          DefferedLoader(rentalView.loadLibrary),
        ]),
    QRoute(
        name: homeAssetRoute,
        path: homeAssetRoute,
        builder: () => homeAssetListView.HomeAssetListsView(),
        middleware: <QMiddleware>[
          DefferedLoader(homeAssetListView.loadLibrary),
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
    QRoute(
        name: otherAssetRoute,
        path: otherAssetRoute,
        builder: () => otherAssetListView.OtherAssetListsView(),
        middleware: <QMiddleware>[
          DefferedLoader(otherAssetListView.loadLibrary),
        ]),
  ];
}
