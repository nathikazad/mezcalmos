import 'package:get/get.dart'; // getX
import 'package:mezcalmos/Shared/bindings/settingsBinding.dart';
import 'package:mezcalmos/Shared/controllers/mapController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/pages/AuthScreens/SMS/OtpConfirmationScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/AuthScreens/SMS/PhoneNumberScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/AuthScreens/SignUpScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/SplashScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/TaxiWrapper.dart';
import 'package:mezcalmos/TaxiApp/pages/Wrapper.dart';

// Routes Keys.

const String kSplashRoute = '/splash';
const String kSignInRoute = '/sign_in';
const String kSignUpRoute = '/sign_up';
const String kOtpRoute = '/sign_in_otp';
const String kOtpConfirmRoute = '/sign_in_otp_confirm';
const String kMainAuthWrapperRoute = '/auth_wrapper';
const String kTaxiWrapperRoute = '/taxi_wrapper';
const String kSelectedIcommingOrder = '/selected_incomming_order';

// No need these :

// const String kIncomingOrdersRoute       = '/incoming_orders';
// const String kCurrentOrderRoute         = '/current_order';
// const String kUnauthorizedRoute         = '/unauthorized';

// since they're not actual Routes ,
// You can see them as the following :
// the mainRoute  is : taxi_wrapper
//                     |__scaffold's body :  incoming_orders | current_order | unauthorized
//
// what goes in the Scaffold's body is depending on what's Rx<TaxiAuthController::dynamicScreen>'s value.

// GetX based Router (For navigating)
class XRouter {
  static dynamic mainRoutes = [
    GetPage(name: kMainAuthWrapperRoute, page: () => Wrapper()),
    GetPage(
        name: kSplashRoute,
        page: () => SplashScreen(),
        binding: SettingsBinding()),
    GetPage(
        name: kTaxiWrapperRoute,
        page: () => TaxiWrapper(),
        binding: BindingsBuilder(
            () => Get.put<TaxiAuthController>(TaxiAuthController()))),
    GetPage(
      name: kSelectedIcommingOrder,
      page: () => IncommingOrderScreenView(),
    ),
    GetPage(name: kSignInRoute, page: () => SignIn()),
    GetPage(name: kOtpRoute, page: () => PhoneNumberScreen()),
    GetPage(name: kOtpConfirmRoute, page: () => OtpConfirmationScreen()),
    GetPage(name: kSignUpRoute, page: () => SignUp()),
  ];
}
