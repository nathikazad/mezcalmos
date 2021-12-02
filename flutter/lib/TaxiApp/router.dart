import 'package:get/get.dart'; // getX
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/middlewares/notificationsMiddleware.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen/CurrentOrderScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingListScreen/IncomingListScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/IncomingOrderViewScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/TaxiWrapper.dart';

// Routes Keys.
// const String kTaxiWrapperRoute = '/taxi_wrapper';
const String kCurrentOrderRoute = '/currentOrder';
const String kIncomingOrdersListRoute = '/incomingOrders';
const String kIncomingOrdersViewRoute = '/incomingOrders/:orderId';

String getIncomingOrderRoute(String orderId) {
  return kIncomingOrdersViewRoute.replaceFirst(":orderId", orderId);
}

// GetX based Router (For navigating)
class XRouter {
  static dynamic mainRoutes = [
        GetPage(
            name: kCurrentOrderRoute,
            page: () => CurrentOrderScreen(),
            middlewares: <GetMiddleware>[TaxiNotificationsMiddleware()]),
        GetPage(
            name: kIncomingOrdersListRoute, page: () => IncomingOrdersScreen()),
        GetPage(name: kHomeRoute, page: () => TaxiWrapper()),
        GetPage(
            name: kIncomingOrdersViewRoute,
            page: () => IncomingOrderViewScreen()),
      ] +
      // we can use this to inject our App related Middlewares to keep the shared router as shared.
      _injectMiddleware(<String, List<GetMiddleware>>{
        kMessagesRoute: [TaxiNotificationsMiddleware()]
      });

  static List<GetPage> _injectMiddleware(
      Map<String, List<GetMiddleware>> payload) {
    return SharedRouter.sharedRoutes.map((getpage) {
      if (payload.containsKey(getpage.name)) {
        mezDbgPrint(
            " [+] TaxiApp::Injecting Route : ${getpage.name} with Middlewares ${payload[getpage.name]}");
        return GetPage(
            name: getpage.name,
            page: getpage.page,
            middlewares: payload[getpage.name],
            transition: getpage.transition,
            transitionDuration: getpage.transitionDuration);
      } else
        return getpage;
    }).toList();
  }
}
