import 'package:mezcalmos/CustomerApp/pages/Common/PickLocationView.dart'
    deferred as pickLocationView;
import 'package:qlevar_router/qlevar_router.dart';

class PickLocationRoutes {
  static const String pickLocationRoute = '/pickLocationFromMap/addLocation';
  static const String pickLocationEditRoute =
      '/pickLocationFromMap/editLocation';
  static const String pickLocationNotAuth =
      '/pickLocationFromMap/addLocationNoAuth';

  final routes = QRoute(
      path: pickLocationRoute,
      name: pickLocationRoute,
      builder: () => pickLocationView.PickLocationView(
          pickLocationView.PickLocationMode.AddNewLocation),
      children: [
        QRoute(
          name: pickLocationEditRoute,
          path: pickLocationEditRoute,
          builder: () => pickLocationView.PickLocationView(
              pickLocationView.PickLocationMode.EditLocation),
        ),
        QRoute(
          name: pickLocationNotAuth,
          path: pickLocationNotAuth,
          builder: () => pickLocationView.PickLocationView(
              pickLocationView.PickLocationMode.NonLoggedInPick),
        ),
      ]);
}
