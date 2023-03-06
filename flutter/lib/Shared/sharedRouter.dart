import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/AgoraCall.dart';
import 'package:mezcalmos/Shared/pages/AppNeedsUpdateScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/OtpConfirmationScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/PhoneNumberScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/UnauthorizedScreen.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/CreateServiceView.dart';
import 'package:mezcalmos/Shared/pages/DeliveryCostSetting/DeliveryCostSettingView.dart';
import 'package:mezcalmos/Shared/pages/DeliverySettingsView/DeliverySettingView.dart';
import 'package:mezcalmos/Shared/pages/LocationPermissionScreen/LocationPermissionScreen.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen.dart';
import 'package:mezcalmos/Shared/pages/NoInternetConnectionScreen.dart';
import 'package:mezcalmos/Shared/pages/NoInternetScreen.dart';
import 'package:mezcalmos/Shared/pages/Notifications/ViewNotifications.dart';
import 'package:mezcalmos/Shared/pages/PickDriverView/PickDriverView.dart';
import 'package:mezcalmos/Shared/pages/PickLocationview.dart';
import 'package:mezcalmos/Shared/pages/ServiceDriversList/ServiceDriversListView.dart';
import 'package:mezcalmos/Shared/pages/ServiceInfoEditView/ServiceInfoEditView.dart';
import 'package:mezcalmos/Shared/pages/ServiceOperatorsList/OperatorsListView.dart';
import 'package:mezcalmos/Shared/pages/ServicePaymentsView/ServicePaymentsView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProfileView/ServiceProfileView.dart';
import 'package:mezcalmos/Shared/pages/ServiceReviewsView/ServiceReviewsView.dart';
import 'package:mezcalmos/Shared/pages/ServiceScheduleView/ServiceScheduleView.dart';
import 'package:mezcalmos/Shared/pages/SomethingWentWrong.dart';
import 'package:mezcalmos/Shared/pages/SplashScreen.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/UserProfileScreen.dart';
import 'package:mezcalmos/Shared/pages/UserProfileViews(new)/UserProfileView.dart';
import 'package:mezcalmos/Shared/pages/UserProfileViews(new)/UserWelcomeView.dart';
import 'package:mezcalmos/Shared/pages/Wrapper.dart';

// Routes Keys.
const String kWrapperRoute = '/wrapper';
const String kUserWelcomeRoute = '/welcome';
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
const String kUserNewProfile = '/profile';
const String kPickToLocation = '/pick_to_location';
const String kNotificationsRoute = '/notifications';
const String kAppNeedsUpdate = '/needs_update';
const String kAgoraCallScreen = '/agora';
// const String kInAppReview = '/in-app_review';
const String kPickLocationWithoutAuth = "/pick_location/noAuth";
const String kPickDriver = "/pickDriver/:orderId";
const String kDriversList = "/driversList/:serviceProviderId/:serviceLinkId";
const String kServicePayments = "/servicePayments/:ServiceProviderId";
const String kOperatorsList =
    "/operatorsList/:serviceProviderId/:serviceLinkId";
const String kDeliveryCost = "/deliveryCost/:deliveryDetailsId";
const String kCreateService = "/createService";
const String kdeliverySettingsView =
    "/deliverySettings/:serviceProviderId/:deliveryDetailsId/:detailsId";
const String kPickLocationEdit = "/pick_location/edit";
const String kPickLocationNew = "/pick_location/new";
const String kserviceInfoEdit = "/info/:serviceProviderId/:serviceDetailsId";
const String kserviceScheduleEdit = "/schedule";
const String kserviceReview = "/reviews";
const String kSomethingWentWrongScreen = "/SomethingWentWrongScreen";
const String kDeliveryCostSettingScreen =
    "/costDeliverySettingScreen/:providerId/:providerType";
const String kNoInternetRoute = '/noInternet';
const String kServiceProfile =
    '/service/:serviceId/:serviceDetailsId/:deliveryDetailsId';

String getMessagesRoute({
  required int chatId,
  String? orderLink,
  int? orderId,
  OrderType? orderType,
  ParticipantType recipientType = ParticipantType.Customer,
  String? recipientId,
}) {
  final String mainUrl =
      kMessagesRoute.replaceFirst(":chatId", chatId.toString());

  // if (recipientId != null)
  //   mainUrl += "?recipientId=$recipientId";
  // else
  //   mainUrl += "?recipientType=${recipientType.toFirebaseFormattedString()}";
  // if (orderLink != null) mainUrl += "&orderLink=$orderLink";
  // if (orderId != null) mainUrl += "&orderId=$orderId";
  // if (orderType != null)
  // mainUrl += "&orderType=${orderType.toFirebaseFormatString()}";
  return mainUrl;
}

void popEverythingAndNavigateTo(route, {args}) {
  popUntilAndNavigateTo(kHomeRoute, route, args: args);
}

void popUntilAndNavigateTo(untilRoute, toRoute, {args}) {
  MezRouter.offNamedUntil(toRoute, (Route<dynamic> route) {
    mezDbgPrint("CurrentRoute#${route.settings.name} / untilRoute#$untilRoute");
    return (route.settings.name == untilRoute);
  }, arguments: args);
}

bool routeMatch(String routeA, String routeB) {
  return routeA.split("?")[0] == routeB.split("?")[0];
}

bool isCurrentRoute(String route) {
  return routeMatch(route, Get.currentRoute);
}

// shared navigation methods //
void navigateToPickDriver(
    {required int deliveryOrderId, required bool showForwardButton}) {
  final String route = kPickDriver.replaceFirst(":orderId", "$deliveryOrderId");
  MezRouter.toNamed(route, arguments: {
    "showForwardButton": showForwardButton,
  });
}

void navigateToDrivers(
    {required int serviceProviderId,
    required int serviceLinkId,
    required ServiceProviderType controllerType}) {
  String route =
      kDriversList.replaceFirst(":serviceProviderId", "$serviceProviderId");
  route = route.replaceFirst(":serviceLinkId", "$serviceLinkId");
  MezRouter.toNamed(route, arguments: {
    "serviceProviderType": controllerType,
    "showAppBar": true,
  });
}

void navigateToOperators(
    {required int serviceProviderId,
    required int serviceLinkId,
    required ServiceProviderType serviceProviderType}) {
  String route =
      kOperatorsList.replaceFirst(":serviceProviderId", "$serviceProviderId");
  route = route.replaceFirst(":serviceLinkId", "$serviceLinkId");
  MezRouter.toNamed(route, arguments: {
    "serviceProviderType": serviceProviderType,
    "showAppBar": true,
  });
}

void navigateToDeliverySettings({
  required int serviceProviderId,
  required int detailsId,
  required int deliveryDetailsID,
  required ServiceProviderType serviceProviderType,
}) {
  String route = kdeliverySettingsView.replaceFirst(
      ":serviceProviderId", "$serviceProviderId");
  route = route.replaceFirst(":detailsId", "$detailsId");
  route = route.replaceFirst(":deliveryDetailsId", "$deliveryDetailsID");
  MezRouter.toNamed(route, arguments: {
    "serviceProviderType": serviceProviderType,
  });
}

void navigateToDeliveryCost({
  required int deliveryDetailsId,
}) {
  final String route =
      kDeliveryCost.replaceFirst(":deliveryDetailsId", "$deliveryDetailsId");
  MezRouter.toNamed(route);
}

void navigateToServiceInfoEdit(
    {required int serviceDetailsId,
    required int serviceProviderId,
    required ServiceProviderType serviceProviderType}) {
  String route =
      kserviceInfoEdit.replaceFirst(":serviceDetailsId", "$serviceDetailsId");
  route = route.replaceFirst(":serviceProviderId", "$serviceProviderId");

  MezRouter.toNamed(route, arguments: {
    "serviceProviderType": serviceProviderType,
  });
}

void navigateToServicePayments(
    {required int serviceProviderId,
    required ServiceProviderType serviceProviderType}) {
  final String route =
      kServicePayments.replaceFirst(":ServiceProviderId", "$serviceProviderId");
  MezRouter.toNamed(route, arguments: {
    "serviceProviderType": serviceProviderType,
  });
}

void navigateToServiceProfile({
  required int serviceProviderId,
  required int serviceDetailsId,
  required int deliveryDetailsId,
}) {
  String route =
      kServiceProfile.replaceFirst(":serviceId", "$serviceProviderId");
  route = route.replaceFirst(":serviceDetailsId", "$serviceDetailsId");
  route = route.replaceFirst(":deliveryDetailsId", "$deliveryDetailsId");
  MezRouter.toNamed(
    route,
  );
}

void navigateToCreateService(
    {required ServiceProviderType serviceProviderType}) {
  MezRouter.toNamed(kCreateService, arguments: {
    "serviceProviderType": serviceProviderType,
  });
}

// GetX based Router (For navigating)
class SharedRouter {
  static List<GetPage> sharedRoutes = [
    GetPage(
        name: kDeliveryCostSettingScreen,
        page: () => DeliveryCostSettingView()),
    GetPage(
        name: kSomethingWentWrongScreen,
        page: () => SomethingWentWrongScreen()),
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
    GetPage(
        name: kPickLocationNew,
        page: () => PickLocationView(PickLocationMode.AddNewLocation)),
    GetPage(name: kAgoraCallScreen, page: () => AgoraCall()),
    GetPage(name: kPickDriver, page: () => PickDriverView()),
    GetPage(name: kDriversList, page: () => ServiceDriversListView()),

    GetPage(name: kOperatorsList, page: () => OperatorsListView()),
    GetPage(name: kDeliveryCost, page: () => DeliveryCostSettingView()),
    GetPage(name: kServicePayments, page: () => ServicePaymentsView()),
    GetPage(name: kserviceReview, page: () => ServiceReviewsView()),
    GetPage(name: kUserWelcomeRoute, page: () => UserWelcomeView()),
    GetPage(name: kUserNewProfile, page: () => UserProfileView()),
    GetPage(name: kserviceInfoEdit, page: () => ServiceInfoEditView()),
    GetPage(name: kCreateService, page: () => CreateServiceView()),
    GetPage(name: kdeliverySettingsView, page: () => DeliverySettingsView()),
    GetPage(name: kserviceScheduleEdit, page: () => ServiceScheduleView()),
    GetPage(name: kServiceProfile, page: () => ServiceProfileView()),
    GetPage(
      name: kNoInternetRoute,
      page: () => NoInternetScreen(),
    ),
  ];
}
