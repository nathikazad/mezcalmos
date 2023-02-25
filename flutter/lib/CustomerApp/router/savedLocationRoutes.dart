import 'package:mezcalmos/CustomerApp/pages/CustSavedLocations/CustSavedLocationsView.dart'
    deferred as savedLocation;
import 'package:qlevar_router/qlevar_router.dart';

class SavedLocationRoutes {
  static const String savedLocations = 'savedLocations';

  final routes = QRoute(
      path: savedLocations,
      name: savedLocations,
      builder: () => savedLocation.SavedLocationView());
}
