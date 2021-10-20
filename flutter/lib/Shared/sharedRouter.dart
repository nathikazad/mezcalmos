import 'package:flutter/material.dart';
import 'package:get/get.dart'; // getX
import 'package:mezcalmos/Shared/pages/AuthScreens/UnauthorizedScreen.dart';
import 'package:mezcalmos/Shared/pages/LocationPermissionScreen.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/OtpConfirmationScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/PhoneNumberScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/SplashScreen.dart';

// Routes Keys.

const String kSplashRoute = '/splash';
const String kSignInRoute = '/sign_in';
const String kLocationPermissionPage = '/location_permission';
const String kOtpRoute = '/sign_in_otp';
const String kOtpConfirmRoute = '/sign_in_otp_confirm';
const String kMessagesRoute = '/messages/:orderId';
const String kUnauthorizedRoute = '/unauthorized';
getMessagesRoute(String orderId) {
  return kMessagesRoute.replaceFirst(":orderId", orderId);
}

// GetX based Router (For navigating)
class SharedRouter {
  static List<GetPage> sharedRoutes = [
    GetPage(name: kSplashRoute, page: () => SplashScreen()),
    GetPage(name: kSignInRoute, page: () => SignIn()),
    GetPage(
        name: kLocationPermissionPage, page: () => LocationPermissionScreen()),
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
