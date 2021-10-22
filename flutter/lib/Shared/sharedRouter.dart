import 'package:flutter/material.dart';
import 'package:get/get.dart'; // getX
import 'package:mezcalmos/Shared/pages/AuthScreens/UnauthorizedScreen.dart';
import 'package:mezcalmos/Shared/pages/LocationPermissionScreen.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/OtpConfirmationScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/PhoneNumberScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/SplashScreen.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen.dart';
import 'package:mezcalmos/Shared/pages/Wrapper.dart';

// Routes Keys.
const String kWrapperRoute = '/wrapper';
const String kHomeRoute = '/';
const String kSplashRoute = '/splash';
const String kSignInRoute = '/sign_in';
const String kLocationPermissionPage = '/location_permission';
const String kOtpRoute = '/sign_in_otp';
const String kOtpConfirmRoute = '/sign_in_otp_confirm';
const String kMessagesRoute = '/messages/:orderId';
const String kUnauthorizedRoute = '/unauthorized';
const String kUserProfile = '/user_profile';

getMessagesRoute(String orderId) {
  return kMessagesRoute.replaceFirst(":orderId", orderId);
}

// GetX based Router (For navigating)
class SharedRouter {
  static List<GetPage> sharedRoutes = [
    GetPage(name: kUserProfile, page: () => UserProfile()),
    GetPage(name: kWrapperRoute, page: () => Wrapper()),
    GetPage(name: kSplashRoute, page: () => SplashScreen()),
    GetPage(name: kSignInRoute, page: () => SignIn()),
    GetPage(name: kOtpRoute, page: () => PhoneNumberScreen()),
    GetPage(name: kOtpConfirmRoute, page: () => OtpConfirmationScreen()),
    GetPage(
      name: kMessagesRoute,
      page: () => MessagingScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 500),
      // customTransition:
    ),
    GetPage(name: kUnauthorizedRoute, page: () => UnauthorizedScreen())
  ];
}
