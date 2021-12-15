import 'package:flutter/material.dart';
import 'package:get/get.dart'; // getX
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/UnauthorizedScreen.dart';
import 'package:mezcalmos/Shared/pages/LocationPermissionScreen.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/OtpConfirmationScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/PhoneNumberScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/PickToLocation.dart';
import 'package:mezcalmos/Shared/pages/SplashScreen.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen.dart';
import 'package:mezcalmos/Shared/pages/ViewNotifications.dart';
import 'package:mezcalmos/Shared/pages/Wrapper.dart';

// Routes Keys.
const String kWrapperRoute = '/wrapper';
const String kHomeRoute = '/';
const String kSplashRoute = '/splash';
const String kSignInRouteRequired = '/sign_in/required';
const String kSignInRouteOptional = '/sign_in/optional';
const String kLocationPermissionPage = '/location_permission';
const String kOtpRoute = '/sign_in_otp';
const String kOtpConfirmRoute = '/sign_in_otp_confirm';
const String kMessagesRoute = '/messages/:orderId';
const String kUnauthorizedRoute = '/unauthorized';
const String kUserProfile = '/user_profile';
const String kPickToLocation = '/pick_to_location';
const String kNotificationsRoute = '/notifications';

String getCustomerMessagesRoute(
  String orderId,
) {
  return kMessagesRoute.replaceFirst(":orderId", orderId) +
      "?recipientType=${ParticipantType.Customer.toFirebaseFormattedString()}";
}

void popEverythingAndNavigateTo(dynamic route) {
  popUntilAndNavigateTo(kHomeRoute, route);
}

void popUntilAndNavigateTo(dynamic untilRoute, dynamic toRoute) {
  Get.offNamedUntil(toRoute, (Route<dynamic> route) {
    return (route.settings.name == untilRoute);
  });
}

// GetX based Router (For navigating)
class SharedRouter {
  static List<GetPage> sharedRoutes = [
    GetPage(name: kUserProfile, page: () => UserProfile()),
    GetPage(name: kWrapperRoute, page: () => Wrapper()),
    GetPage(name: kSplashRoute, page: () => SplashScreen()),
    GetPage(
        name: kSignInRouteRequired,
        page: () => SignIn(mode: SignInMode.RequiredSignIn)),
    GetPage(
        name: kSignInRouteOptional,
        page: () => SignIn(
              mode: SignInMode.OptionalSignIn,
            )),
    GetPage(name: kOtpRoute, page: () => PhoneNumberScreen()),
    GetPage(name: kOtpConfirmRoute, page: () => OtpConfirmationScreen()),
    GetPage(
      name: kMessagesRoute,
      page: () => MessagingScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 500),
      // customTransition:
    ),
    GetPage(name: kUnauthorizedRoute, page: () => UnauthorizedScreen()),
    GetPage(
        name: kLocationPermissionPage, page: () => LocationPermissionScreen()),
    GetPage(name: kPickToLocation, page: () => PickToLocation()),
    GetPage(name: kNotificationsRoute, page: () => ViewNotifications())
  ];
}
