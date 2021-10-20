import 'package:get/get.dart'; // getX
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingListScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/TaxiWrapper.dart';
import 'package:mezcalmos/TaxiApp/pages/Wrapper.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen.dart';

// Routes Keys.
const String kTaxiWrapperRoute = '/taxi_wrapper';
const String kSelectedIcommingOrder = '/selected_incomming_order';
const String kCurrentOrderPage = '/current_order';
const String kOrdersListPage = '/orders_list';
const String kMainWrapper = '/main_wrapper';
const String kAunauthorizedRoute = '/aunauthorized';

// GetX based Router (For navigating)
class XRouter {
  static dynamic mainRoutes = [
        GetPage(name: kCurrentOrderPage, page: () => CurrentOrderScreen()),
        GetPage(name: kOrdersListPage, page: () => IncomingOrdersScreen()),
        GetPage(name: kMainWrapper, page: () => Wrapper()),
        GetPage(name: kTaxiWrapperRoute, page: () => TaxiWrapper()),
        GetPage(
            name: kSelectedIcommingOrder,
            page: () => IncommingOrderScreenView()),
      ] +
      SharedRouter.sharedRoutes;
}
