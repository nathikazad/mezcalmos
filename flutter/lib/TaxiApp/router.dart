import 'package:get/get.dart'; // getX
import 'package:mezcalmos/Shared/bindings/settingsBinding.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/UnauthorizedScreen.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/OtpConfirmationScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/PhoneNumberScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/SplashScreen.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingListScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/TaxiWrapper.dart';
import 'package:mezcalmos/TaxiApp/pages/Wrapper.dart';

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
        GetPage(name: kAunauthorizedRoute, page: () => UnauthorizedScreen()),
        GetPage(name: kSplashRoute, page: () => SplashScreen()),
        GetPage(name: kTaxiWrapperRoute, page: () => TaxiWrapper()),
        GetPage(
            name: kSelectedIcommingOrder,
            page: () => IncommingOrderScreenView()),
        GetPage(name: kSignInRoute, page: () => SignIn()),
        GetPage(name: kOtpRoute, page: () => PhoneNumberScreen()),
        GetPage(name: kOtpConfirmRoute, page: () => OtpConfirmationScreen()),
        GetPage(
          name: kMessagesRoute,
          page: () =>
              MessagingScreen(), // add here our messagingController using bindingBuilder
          transition: Transition.rightToLeftWithFade,
          transitionDuration: Duration(milliseconds: 500),
        )
      ] +
      SharedRouter.sharedRoutes;
}
