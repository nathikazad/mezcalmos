import 'package:get/get.dart'; // getX
import 'package:mezcalmos/TaxiApp/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/AuthScreens/SignUpScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/AuthScreens/UnauthorizedScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingListScreen.dart';

// Widgets 
// import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/ListOrdersScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/SplashScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/TaxiWrapper.dart';



// Routes Keys.
const String kMainRoute                 = '/';
const String kSplashRoute               = '/splash'; 
const String kSignInRoute               = '/sign_in';
const String kSignUpRoute               = '/sign_up';
const String kOtpRoute                  = '/sign_in_otp';
const String kTaxiWrapperRoute          = '/taxi_wrapper';
const String kIncomingOrdersRoute       = '/incoming_orders';
const String kCurrentOrderRoute         = '/current_order';
const String kUnauthorizedRoute         = '/unauthorized';


// GetX based Router (For navigating)
class XRouter {

  static dynamic mainRoutes = [
    GetPage(name: kMainRoute, page: () => TaxiWrapper()),
    GetPage(name: kSplashRoute, page: () => SplashScreen()),
    GetPage(name: kTaxiWrapperRoute, page: () => TaxiWrapper()),
    GetPage(name: kIncomingOrdersRoute, page: () => IncomingOrdersScreen()),
    GetPage(name: kCurrentOrderRoute  , page: () => CurrentOrderScreen()),
    GetPage(name: kSignInRoute, page: () => SignIn()),
    GetPage(name: kSignUpRoute, page: () => SignUp()),
    GetPage(name: kUnauthorizedRoute, page: () => UnauthorizedScreen())
  ];

}
