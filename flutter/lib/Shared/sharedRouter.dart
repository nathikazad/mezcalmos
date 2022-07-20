import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/pages/AppNeedsUpdateScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/OtpConfirmationScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/PhoneNumberScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/UnauthorizedScreen.dart';
import 'package:mezcalmos/Shared/pages/LocationPermissionScreen/LocationPermissionScreen.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen.dart';
import 'package:mezcalmos/Shared/pages/NoInternetConnectionScreen.dart';
import 'package:mezcalmos/Shared/pages/Notifications/ViewNotifications.dart';
import 'package:mezcalmos/Shared/pages/PickLocationview.dart';
import 'package:mezcalmos/Shared/pages/SplashScreen.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/UserProfileScreen.dart';
import 'package:mezcalmos/Shared/pages/Wrapper.dart';

// Routes Keys.
const String kWrapperRoute = '/wrapper';
const String kHomeRoute = '/';
const String kSplashRoute = '/splash';
const String kSignInRouteRequired = '/sign_in/required';
const String kSignInRouteOptional = '/sign_in/optional';
const String kLocationPermissionPage = '/location_permission';
const String kNoInternetConnectionPage = '/offline';
const String kOtpRoute = '/sign_in_otp';
const String kOtpConfirmRoute = '/sign_in_otp_confirm';
const String kMessagesRoute = '/messages/:chatId';
const String kMultiLanguagesRoute = '/multiLanguage/:id';
const String kUnauthorizedRoute = '/unauthorized';
const String kUserProfile = '/user_profile';
const String kPickToLocation = '/pick_to_location';
const String kNotificationsRoute = '/notifications';
const String kAppNeedsUpdate = '/needs_update';
// const String kInAppReview = '/in-app_review';
const String kPickLocationWithoutAuth = "/pick_location/noAuth";
const String kPickLocationEdit = "/pick_location/edit";

String getMessagesRoute(
    {required String chatId,
    String? orderLink,
    String? orderId,
    ParticipantType recipientType = ParticipantType.Customer,
    String? recipientId}) {
  String mainUrl = kMessagesRoute.replaceFirst(":chatId", chatId);

  if (recipientId != null)
    mainUrl += "?recipientId=$recipientId";
  else
    mainUrl += "?recipientType=${recipientType.toFirebaseFormattedString()}";
  if (orderLink != null) mainUrl += "&orderLink=$orderLink";
  if (orderId != null) mainUrl += "&orderId=$orderId";
  return mainUrl;
}

void popEverythingAndNavigateTo(route, {args}) {
  popUntilAndNavigateTo(kHomeRoute, route, args: args);
}

void popUntilAndNavigateTo(untilRoute, toRoute, {args}) {
  Get.offNamedUntil(toRoute, (Route<dynamic> route) {
    return (route.settings.name == untilRoute);
  }, arguments: args);
}

// GetX based Router (For navigating)
class SharedRouter {
  static List<GetPage> sharedRoutes = [
    GetPage(name: kUserProfile, page: () => UserProfile()),
    GetPage(name: kAppNeedsUpdate, page: () => AppNeedsUpdateScreen()),
    // GetPage(name: kInAppReview, page: () => InAppReviewPage()),
    GetPage(name: kWrapperRoute, page: () => Wrapper()),
    GetPage(name: kSplashRoute, page: () => SplashScreen()),
    GetPage(
      name: kSignInRouteRequired,
      page: () => SignIn(mode: SignInMode.RequiredSignIn),
    ),
    GetPage(
      name: kSignInRouteOptional,
      page: () => SignIn(
        mode: SignInMode.OptionalSignIn,
      ),
    ),
    GetPage(name: kOtpRoute, page: () => PhoneNumberScreen()),
    GetPage(
      name: kOtpConfirmRoute,
      page: () => OtpConfirmationScreen(),
    ),
    GetPage(
      name: kMessagesRoute,
      page: () => MessagingScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 500),
      // customTransition:
    ),
    GetPage(
      name: kUnauthorizedRoute,
      page: () => UnauthorizedScreen(),
    ),
    GetPage(
      name: kLocationPermissionPage,
      page: () => LocationPermissionScreen(),
    ),
    GetPage(
      name: kNoInternetConnectionPage,
      page: () => NoInternetConnectionScreen(),
    ),
    GetPage(
      name: kNotificationsRoute,
      page: () => ViewNotifications(),
    ),
    GetPage(
        name: kPickLocationWithoutAuth,
        page: () => PickLocationView(PickLocationMode.NonLoggedInPick)),
    GetPage(
        name: kPickLocationEdit,
        page: () => PickLocationView(PickLocationMode.EditLocation)),
  ];
}
