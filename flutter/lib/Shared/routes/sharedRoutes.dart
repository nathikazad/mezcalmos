import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/OtpConfirmationScreen.dart'
    deferred as otpConfirmationScreen;
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/PhoneNumberScreen.dart'
    deferred as phoneNumberScreen;
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart'
    deferred as signInScreen;
import 'package:mezcalmos/Shared/pages/AuthScreens/UnauthorizedScreen.dart'
    deferred as unauthorizedScreen;
import 'package:mezcalmos/Shared/pages/LocationPermissionScreen/LocationPermissionScreen.dart'
    deferred as locationPermissionScreen;
import 'package:mezcalmos/Shared/pages/MessagesListView/MessagesListview.dart'
    deferred as messagesList;
import 'package:mezcalmos/Shared/pages/NoInternetConnectionScreen.dart'
    deferred as noInternetConnectionScreen;
import 'package:mezcalmos/Shared/pages/NoInternetScreen.dart'
    deferred as noInternetScreen;
import 'package:mezcalmos/Shared/pages/Notifications/ViewNotifications.dart';
import 'package:mezcalmos/Shared/pages/PickLocationView/PickLocationView.dart'
    deferred as pickLocationView;
import 'package:mezcalmos/Shared/pages/SomethingWentWrong.dart'
    deferred as somethingWentWrong;
import 'package:mezcalmos/Shared/pages/SplashScreen.dart'
    deferred as splashScreen;
import 'package:mezcalmos/Shared/pages/UserProfileView/UserProfileView.dart'
    deferred as userProfileView;
import 'package:mezcalmos/Shared/pages/UserProfileView/UserWelcomeView.dart'
    deferred as UserWelcomeView;
import 'package:mezcalmos/Shared/pages/Wrapper.dart' deferred as wrapper;
import 'package:qlevar_router/qlevar_router.dart';

// GetX based Router (For navigating)
class SharedRoutes {
  // Routes Keys.
  static const String kWrapperRoute = '/';
  static const String kUserWelcomeRoute = '/welcome';
  static const String kHomeRoute = '/home';
  static const String kMessagesList = '/messages';
  static const String kSplashRoute = '/splash';
  static const String kSignInRoute = '/sign_in';
  static const String kSignInAtOrderTimeRoute = '/sign_in_order_time';
  static const String kMessagesRoute = '/messages/:chatId';
  static const String kLocationPermissionPage = '/location_permission';
  static const String kNoInternetConnectionPage = '/offline';
  static const String kOtpRoute = '/sign_in_otp';
  static const String kOtpConfirmRoute = '/sign_in_otp_confirm';
  static const String kMultiLanguagesRoute = '/multiLanguage/:id';
  static const String kUnauthorizedRoute = '/unauthorized';
  static const String kUserProfile = '/user_profile';
  static const String kUserNewProfile = '/profile';

  static const String kPickLocation = "/pick_location";
  static const String kNotificationsRoute = '/notifications';
  static const String kSomethingWentWrongScreen = "/SomethingWentWrongScreen";
  static const String kNoInternetRoute = '/noInternet';

  static String getMessagesRoute({required int chatId}) {
    final String mainUrl =
        kMessagesRoute.replaceFirst(":chatId", chatId.toString());
    return mainUrl;
  }

// shared navigation methods //
  static List<QRoute> qRoutes = <QRoute>[
    QRoute(
        path: kSomethingWentWrongScreen,
        name: kSomethingWentWrongScreen,
        builder: () => somethingWentWrong.SomethingWentWrongScreen(),
        middleware: <QMiddleware>[
          DefferedLoader(somethingWentWrong.loadLibrary)
        ]),
    QRoute(
        path: kWrapperRoute,
        name: kWrapperRoute,
        builder: () => wrapper.Wrapper(),
        middleware: <QMiddleware>[DefferedLoader(wrapper.loadLibrary)]),
    QRoute(
        path: kSplashRoute,
        name: kSplashRoute,
        builder: () => splashScreen.SplashScreen(),
        middleware: <QMiddleware>[DefferedLoader(splashScreen.loadLibrary)]),
    QRoute(
        path: kSignInRoute,
        name: kSignInRoute,
        builder: () => signInScreen.SignInView(),
        middleware: <QMiddleware>[DefferedLoader(signInScreen.loadLibrary)]),
    QRoute(
        path: kSignInAtOrderTimeRoute,
        name: kSignInAtOrderTimeRoute,
        builder: () => signInScreen.SignInView(),
        middleware: <QMiddleware>[DefferedLoader(signInScreen.loadLibrary)]),

    QRoute(
        path: kOtpRoute,
        name: kOtpRoute,
        builder: () => phoneNumberScreen.PhoneNumberScreen(),
        middleware: <QMiddleware>[
          DefferedLoader(phoneNumberScreen.loadLibrary)
        ]),
    QRoute(
        path: kMessagesList,
        name: kMessagesList,
        builder: () => messagesList.MessagesListView(),
        middleware: <QMiddleware>[DefferedLoader(messagesList.loadLibrary)]),
    QRoute(
        path: kOtpConfirmRoute,
        name: kOtpConfirmRoute,
        builder: () => otpConfirmationScreen.OtpConfirmationScreen(),
        middleware: <QMiddleware>[
          DefferedLoader(otpConfirmationScreen.loadLibrary)
        ]),
    QRoute(
        path: SharedRoutes.kUserNewProfile,
        name: SharedRoutes.kUserNewProfile,
        builder: () => userProfileView.UserProfileView(),
        middleware: <QMiddleware>[DefferedLoader(userProfileView.loadLibrary)]),
    // QRoute(
    //     path: kPickLocationEdit,
    //     name: kPickLocationEdit,
    //     builder: () => pickLocationView.PickLocationView(
    //         pickLocationView.PickLocationMode.EditLocation),
    //     middleware: <QMiddleware>[
    //       DefferedLoader(pickLocationView.loadLibrary)
    //     ]),

    QRoute(
        path: kPickLocation,
        name: kPickLocation,
        builder: () => pickLocationView.PickLocationView(),
        middleware: <QMiddleware>[
          DefferedLoader(pickLocationView.loadLibrary)
        ]),
    QRoute(
        path: kUnauthorizedRoute,
        name: kUnauthorizedRoute,
        builder: () => unauthorizedScreen.UnauthorizedScreen(),
        middleware: <QMiddleware>[
          DefferedLoader(unauthorizedScreen.loadLibrary)
        ]),
    QRoute(
        path: kLocationPermissionPage,
        name: kLocationPermissionPage,
        builder: () => locationPermissionScreen.LocationPermissionScreen(),
        middleware: <QMiddleware>[
          DefferedLoader(locationPermissionScreen.loadLibrary)
        ]),
    QRoute(
        path: kNoInternetConnectionPage,
        name: kNoInternetConnectionPage,
        builder: () => noInternetConnectionScreen.NoInternetConnectionScreen(),
        middleware: <QMiddleware>[
          DefferedLoader(noInternetConnectionScreen.loadLibrary)
        ]),
    QRoute(
      path: kNotificationsRoute,
      name: kNotificationsRoute,
      builder: () => ViewNotifications(),
    ),
    // QRoute(
    //     path: kPickLocationWithoutAuth,
    //     name: kPickLocationWithoutAuth,
    //     builder: () => pickLocationView.PickLocationView(
    //         pickLocationView.PickLocationMode.NonLoggedInPick),
    //     middleware: <QMiddleware>[
    //       DefferedLoader(pickLocationView.loadLibrary)
    //     ]),
    QRoute(
        path: kUserWelcomeRoute,
        name: kUserWelcomeRoute,
        builder: () => UserWelcomeView.UserWelcomeView(),
        middleware: <QMiddleware>[DefferedLoader(UserWelcomeView.loadLibrary)]),
    QRoute(
        path: kNoInternetRoute,
        name: kNoInternetRoute,
        builder: () => noInternetScreen.NoInternetScreen(),
        middleware: <QMiddleware>[
          DefferedLoader(noInternetScreen.loadLibrary)
        ]),
  ];
}
