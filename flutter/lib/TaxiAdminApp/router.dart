import 'package:get/get.dart'; // getX

import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Wrapper.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Driver/RankingsPage.dart';

// Routes Keys.

const String kWrapperRoute = '/auth_wrapper';
const String kRankingsRoute = '/driver_rankings';

// GetX based Router (For navigating)
class XRouter {
  static dynamic mainRoutes = [
        GetPage(name: kWrapperRoute, page: () => Wrapper()),
        GetPage(name: kRankingsRoute, page: () => RankingsPage())
      ] +
      SharedRouter.sharedRoutes;
}
