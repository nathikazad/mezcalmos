import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/OtpConfirmationScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/PhoneNumberScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/UnauthorizedScreen.dart';
import 'package:mezcalmos/Shared/pages/LocationPermissionScreen/LocationPermissionScreen.dart';
import 'package:mezcalmos/Shared/pages/NoInternetConnectionScreen.dart';
import 'package:mezcalmos/Shared/pages/NoInternetScreen.dart';
import 'package:mezcalmos/Shared/pages/Notifications/ViewNotifications.dart';
import 'package:mezcalmos/Shared/pages/PickLocationview.dart';
import 'package:mezcalmos/Shared/pages/SomethingWentWrong.dart';
import 'package:mezcalmos/Shared/pages/SplashScreen.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/UserProfileScreen.dart';
import 'package:mezcalmos/Shared/pages/UserProfileViews(new)/UserProfileView.dart';
import 'package:mezcalmos/Shared/pages/UserProfileViews(new)/UserWelcomeView.dart';
import 'package:mezcalmos/Shared/pages/Wrapper.dart';
import 'package:qlevar_router/qlevar_router.dart';

// GetX based Router (For navigating)
class SharedRoutes {
  // Routes Keys.
  static const String kWrapperRoute = '/wrapper';
  static const String kUserWelcomeRoute = '/welcome';
  static const String kHomeRoute = '/';
  static const String kSplashRoute = '/splash';
  static const String kSignInRouteRequired = '/sign_in/required';
  static const String kSignInRouteOptional = '/sign_in/optional';
  static const String kMessagesRoute = '/messages/:chatId';
  static const String kLocationPermissionPage = '/location_permission';
  static const String kNoInternetConnectionPage = '/offline';
  static const String kOtpRoute = '/sign_in_otp';
  static const String kOtpConfirmRoute = '/sign_in_otp_confirm';
  static const String kMultiLanguagesRoute = '/multiLanguage/:id';
  static const String kUnauthorizedRoute = '/unauthorized';
  static const String kUserProfile = '/user_profile';
  static const String kUserNewProfile = '/profile';
  static const String kPickToLocation = '/pick_to_location';
  static const String kPickLocationWithoutAuth = "/pick_location/noAuth";
  static const String kPickLocationEdit = "/pick_location/edit";
  static const String kPickLocationNew = "/pick_location/new";
  static const String kNotificationsRoute = '/notifications';
  static const String kSomethingWentWrongScreen = "/SomethingWentWrongScreen";
  static const String kNoInternetRoute = '/noInternet';

  static String getMessagesRoute({
    required int chatId,
    String? orderLink,
    int? orderId,
    OrderType? orderType,
    ParticipantType recipientType = ParticipantType.Customer,
    String? recipientId,
  }) {
    final String mainUrl =
        kMessagesRoute.replaceFirst(":chatId", chatId.toString());
    return mainUrl;
  }

// shared navigation methods //

  static List<QRoute> qRoutes = <QRoute>[
    QRoute(
        path: kSomethingWentWrongScreen,
        name: kSomethingWentWrongScreen,
        builder: () => SomethingWentWrongScreen()),
    QRoute(
        path: kUserProfile, name: kUserProfile, builder: () => UserProfile()),
    QRoute(path: kWrapperRoute, name: kWrapperRoute, builder: () => Wrapper()),
    QRoute(
        path: kSplashRoute, name: kSplashRoute, builder: () => SplashScreen()),
    QRoute(
        path: kSignInRouteRequired,
        name: kSignInRouteRequired,
        builder: () => SignIn(mode: SignInMode.RequiredSignIn)),
    QRoute(
        path: kSignInRouteOptional,
        name: kSignInRouteOptional,
        builder: () => SignIn(mode: SignInMode.OptionalSignIn)),
    QRoute(
        path: kOtpRoute, name: kOtpRoute, builder: () => PhoneNumberScreen()),
    QRoute(
        path: kOtpConfirmRoute,
        name: kOtpConfirmRoute,
        builder: () => OtpConfirmationScreen()),
    QRoute(
        path: kPickLocationEdit,
        name: kPickLocationEdit,
        builder: () => PickLocationView(PickLocationMode.EditLocation)),
    QRoute(
        path: kPickLocationNew,
        name: kPickLocationNew,
        builder: () => PickLocationView(PickLocationMode.AddNewLocation)),
    QRoute(
        path: kUnauthorizedRoute,
        name: kUnauthorizedRoute,
        builder: () => UnauthorizedScreen()),
    QRoute(
        path: kLocationPermissionPage,
        name: kLocationPermissionPage,
        builder: () => LocationPermissionScreen()),
    QRoute(
        path: kNoInternetConnectionPage,
        name: kNoInternetConnectionPage,
        builder: () => NoInternetConnectionScreen()),
    QRoute(
        path: kNotificationsRoute,
        name: kNotificationsRoute,
        builder: () => ViewNotifications()),
    QRoute(
        path: kPickLocationWithoutAuth,
        name: kPickLocationWithoutAuth,
        builder: () => PickLocationView(PickLocationMode.NonLoggedInPick)),
    QRoute(
        path: kUserWelcomeRoute,
        name: kUserWelcomeRoute,
        builder: () => UserWelcomeView()),
    QRoute(
        path: kUserNewProfile,
        name: kUserNewProfile,
        builder: () => UserProfileView()),
    QRoute(
        path: kNoInternetRoute,
        name: kNoInternetRoute,
        builder: () => NoInternetScreen()),
  ];

  static List<GetPage> routes = [
    GetPage(
        name: kSomethingWentWrongScreen,
        page: () => SomethingWentWrongScreen()),
    GetPage(name: kUserProfile, page: () => UserProfile()),
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
        name: kPickLocationEdit,
        page: () => PickLocationView(PickLocationMode.EditLocation)),
    GetPage(
        name: kPickLocationNew,
        page: () => PickLocationView(PickLocationMode.AddNewLocation)),
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
    GetPage(name: kUserWelcomeRoute, page: () => UserWelcomeView()),
    GetPage(name: kUserNewProfile, page: () => UserProfileView()),
    GetPage(
      name: kNoInternetRoute,
      page: () => NoInternetScreen(),
    ),
  ];
}
