import 'package:get/get.dart'; // getX
import 'package:mezcalmos/Shared/pages/LocationPermissionScreen.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/OtpConfirmationScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/PhoneNumberScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/SplashScreen.dart';
import 'package:mezcalmos/Shared/pages/Wrapper.dart';

// Routes Keys.
const String kWrapperRoute = '/wrapper';
const String kHomeRoute = '/';
const String kSplashRoute = '/splash';
const String kSignInRoute = '/sign_in';
const String kLocationPermissionPage = '/location_permission';
const String kOtpRoute = '/sign_in_otp';
const String kOtpConfirmRoute = '/sign_in_otp_confirm';
const String _kMessagesRoute = '/messages/:orderId';

getMessagesRoute(String orderId) {
  return _kMessagesRoute.replaceFirst(":orderId", orderId);
}

// GetX based Router (For navigating)
class SharedRouter {
  static dynamic sharedRoutes = [
    GetPage(name: kWrapperRoute, page: () => Wrapper()),
    GetPage(
        name: kSplashRoute,
        page: () => SplashScreen()),
    GetPage(name: kSignInRoute, page: () => SignIn()),
    GetPage(
        name: kLocationPermissionPage, page: () => LocationPermissionScreen()),
    GetPage(name: kOtpRoute, page: () => PhoneNumberScreen()),
    GetPage(name: kOtpConfirmRoute, page: () => OtpConfirmationScreen()),
    GetPage(
      name: _kMessagesRoute,
      page: () => MessagingScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 500),
      // customTransition:
    )
  ];
}
