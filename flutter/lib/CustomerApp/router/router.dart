import 'package:mezcalmos/CustomerApp/pages/CustomerWrapper.dart';
import 'package:mezcalmos/CustomerApp/router/laundaryRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/ordersRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/pickLocationRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/savedCardRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/savedLocationRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

const String kSavedLocations = '/savedLocations';
const String kSavedCards = '/savedCards';
const String kHomeRoute = '/';

class XRouter {
  static List<QRoute> mainRoutes = [
        QRoute(
          name: kHomeRoute,
          path: kHomeRoute,
          builder: () => CustomerWrapper(),
        ),
        LaundryRouters().routes,
        PickLocationRoutes().routes,
        OrdersRoutes().routes,
        SavedLocationRoutes().routes,
        SavedCardRoutes().routes,
      ] +
      RestaurantRouter().routes;
}
