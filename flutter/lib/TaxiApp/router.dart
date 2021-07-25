import 'package:get/get.dart'; // getX
import 'package:mezcalmos/Shared/bindings/settingsBinding.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/pages/Messaging.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/OtpConfirmationScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/PhoneNumberScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignUpScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen.dart';
import 'package:mezcalmos/Shared/pages/SplashScreen.dart';
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
const String kMessagesRoute = '/messages';

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
    GetPage(
      name: kMessagesRoute,
      page: () => MessagingScreen(),
      binding: BindingsBuilder(() => Get.put<MessageController>(
          MessageController())), // add here our messagingController using bindingBuilder
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 500),
      // customTransition:
    )
  ];
}
