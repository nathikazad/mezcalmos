import 'package:mezcalmos/CustomerApp/pages/CustomerWrapper.dart';
import 'package:mezcalmos/CustomerApp/router/cartRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/laundaryRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/ordersRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/pickLocationRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/restautantOrderRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/savedCardRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/savedLocationRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

const String kSavedLocations = '/savedLocations';
const String kSavedCards = '/savedCards';
const String kHomeRoute = '/';

class XRouter {
  static dynamic mainRoutes = [
    QRoute(
      name: kHomeRoute,
      path: kHomeRoute,
      builder: () => CustomerWrapper(),
    ),
    RestaurantRouters().routes,
    LaundryRouters().routes,
    PickLocationRoutes().routes,
    OrdersRoutes().routes,
    RestaurantOrderRoutes().routes,
    SavedLocationRoutes().routes,
    SavedCardRoutes().routes,
    CartRoutes().routes,
  ];
}
