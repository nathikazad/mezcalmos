import 'package:get/get.dart'; // getX
import 'package:mezcalmos/AdminApp/pages/RankingsPage.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/AdminApp/pages/Wrapper.dart';

// Routes Keys.

const String kWrapperRoute = '/auth_wrapper';
const String kRankingsRoute = '/driver_rankings';
const String kSplashRoute = '/splash';

// GetX based Router (For navigating)
class XRouter {
  static dynamic mainRoutes = [
        GetPage(name: kWrapperRoute, page: () => Wrapper()),
        GetPage(name: kRankingsRoute, page: () => RankingsPage())
      ] +
      SharedRouter.sharedRoutes;
}
