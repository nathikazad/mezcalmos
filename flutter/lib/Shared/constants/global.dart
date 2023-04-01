// ----------------- CONNECTIVITY STRINGS ----------------- //
// PLEASE DO NOT TOUCH ANYTHING IN CONNECTIVITY STRINGS , UNLESS YOU INFORM OTHERS.
// import 'package:flutter/material.dart';

// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:rive/rive.dart' as rive;

// this is my user that i create in prod for the prod deployement testing.
const String testUserIdInProd = "BUhQ74BrbBNeYZz60fK4ocrgpqz1";
const String db = "mezcalmos-31f1c-default-rtdb";
const String stagingDb =
    "https://mezcalmos-staging-default-rtdb.firebaseio.com";
const String localhost = "http://127.0.0.1";
const String authPort = ":9099";
const String dbRoot = ":9000/?ns=$db";
const int functionPort = 5001;
const String placesApikey = "AIzaSyACS-jr0KWCzCN0WFqbltolpX1dqhB2OjY";
const String stripePubTestKey =
    "pk_test_51KxdsRDV5wKm9SNKkEwYTuMUdxRAULh7UUy2w42pV27dDtUc9CBNioU426ftPLzxU5dRd8sZv3UnGgpt8RsDF9xf000oUAmiZS";
const String stripePubProdKey =
    "pk_live_51KxdsRDV5wKm9SNKwQNz1HPWMktW0DlhlsewJKUPQDwrJUv8LtB9oNFPHUKQ448oj1u5Jq8oIa1ihA5MJPYw8Wa300ikC6xyTA";
const String agoraAppId = "6def50fdd2804ffaaa70d807ee445d28";
const String hasuraProdLink = "https://mez-production.hasura.app/v1/graphql";
const String hasuraStageLink = "https://mez-staging.hasura.app/v1/graphql";

const String hasuraDevLink = "http://127.0.0.1:8080/v1/graphql";
// can be dev / prod

// ----------------- TEST STRINGS ----------------- //

const String tTestRestaurantOpValue = "restaurantop@mezcalmos.com";
const String tTestCustomerValue = "customer@mezcalmos.com";
const String tTestDeliveryDriverValue = "deliverydriver@mezcalmos.com";
const String tTestAdminValue = "mezadmin@mezcalmos.com";
const String tTestDeliveryOpValue = "deliveryop@mezcalmos.com";
const String tEmailTestPassword = "password";

// ----------------- Costants Numbers ----------------- //

const double nDefaultMezcalmosTextSize = 27;
const int nSplashScreenTimer = 1;
const int nQualityCompressionOfUserImage = 10;
const int nDefaultCounterOfferValidExpireTimeInSeconds = 30;
const int nScheduledCounterOfferValidExpireTimeInSeconds = 900; // 15mins
const Map<String, dynamic> defaultSchedule = {
  "friday": {"from": "8:00", "isOpen": true, "to": "20:00"},
  "monday": {"from": "8:00", "isOpen": true, "to": "20:00"},
  "saturday": {"from": "8:00", "isOpen": false, "to": "19:00"},
  "sunday": {"from": "8:00", "isOpen": false, "to": "16:00"},
  "thursday": {"from": "8:00", "isOpen": true, "to": "20:00"},
  "tuesday": {"from": "8:00", "isOpen": true, "to": "20:00"},
  "wednesday": {"from": "8:00", "isOpen": true, "to": "20:00"},
};
// ----------------- Costants Strings ----------------- //
const String sPrivacyPolicyCustomerApp =
    "https://www.mezcalmos.com/privacy-policy.html";
const String sPrivacyPolicyTaxiApp = "https://meztaxi.com/privacy-policy.html";

const String sNetworkCheckUrl1 = 'https://www.google.com';
const String firebaseDbUrl = 'https://www.firebaseio.com';
const String firebaseFunctionsProdUrl =
    'https://us-central1-mezcalmos-31f1c.cloudfunctions.net';
const String firebaseFunctionsStageUrl =
    'https://us-central1-mezcalmos-staging.cloudfunctions.net';
const String hasuraDbUrl = 'https://www.hasura.app';

const LanguageType sDefaultLanguage = LanguageType.ES;
const String sDefaultTheme = "light";

const String sMez = "MEZ";
const String sCalmos = "CALMOS";
const String sMezcalmos = "MEZCALMOS";
const String sKala = "KALA";
const String sMezkala = "MEZKALA";

const String sDefaultUserName = "Unknown";
const String sDefaultCustomerName = "Unknown";

// ----------------- Default url Strings ----------------- //
const String defaultUserImgUrl =
    "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/logo%402x.png?alt=media&token=4a18a710-e267-40fd-8da7-8c12423cc56d";
const String defaultDriverImgUrl =
    "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/drivers%2FdeliveryIcon.png?alt=media&token=f02da9dd-07c6-42dc-888e-8bf3646f74cc";

// ----------------- Assets Strings ----------------- //
const String aDefaultNotificationsSound = 'assets/sounds/notif-alert.mp3';
const String aDefaultCallingSound = 'assets/sounds/calling.mp3';
const String aLogoPath = "assets/images/shared/logo.png";
const String aNoImage = "assets/images/shared/noImage.png";
const String a404 = "assets/images/shared/404.png";
const String aUpdate = "assets/images/shared/update.png";
const String aMoney = "assets/images/shared/money.png";
const String aGpay = "assets/images/customer/gPay.png";

const String noOrdersAsset = "assets/images/shared/noOrderIllustration.png";
const String closedServiceAsset = "assets/images/shared/closedService.png";
const String aRequestWaiting = "assets/images/shared/requestPerson.png";
const String aDefaultDbUserImgAsset =
    "assets/images/shared/defaultUserLogo.png";
const String aDefaultAvatar = "assets/images/shared/noUserImage.jpg";
const String aNoImgAsset = "assets/images/shared/noImg.png";
const String aNoInternetAsset = "assets/images/shared/offline.png";
const String aUsaFlag = "assets/images/shared/usa.png";
const String aMexicoFlag = "assets/images/shared/mexico.png";
const String enLang = "assets/i18n/en.json";
const String esLang = "assets/i18n/es.json";
const String aLocationPermissionAsset =
    "assets/images/shared/enableMapIllustration.png";
const String aComingSoon = "assets/images/shared/comingSoon.png";
const String aPurpleLocationCircle =
    "assets/images/shared/purpleLocationCircle.png";
const String aLocationPicker = "assets/images/shared/purpleLocationPicker.png";
const String aOrderUnavailable = "assets/images/shared/circularCancel.png";
const String aTaxiRidePriceController =
    "assets/images/customer/taxi/taxiRidePriceController.png";
const String aDeliveryIcon = "assets/images/shared/notifications/onTheWay.png";
const String aDeliveredIcon =
    "assets/images/shared/notifications/delivered.png";
const String aCancelledIcon = "assets/images/shared/notifications/cancel.png";
const String aAtLaundry = "assets/images/shared/notifications/atLaundry.png";
const String aReadyDeliveryLaundry =
    "assets/images/shared/notifications/readyForDelivery.png";
const rive.RiveAnimation aDriverAnimation = rive.RiveAnimation.asset(
  "assets/animation/scooterWashingMachine.riv",
  fit: BoxFit.cover,
);
const rive.RiveAnimation aWashingAnimation = rive.RiveAnimation.asset(
  "assets/animation/washingMachine.riv",
  fit: BoxFit.cover,
);
const String aAdventure = "assets/images/customer/adventure.png";
const String aChakras = "assets/images/customer/chakras.png";
const String aDelivery = "assets/images/customer/delivery.png";
const String aDiscoBall = "assets/images/customer/discoBall.png";
const String aVolunteering = "assets/images/customer/volunteering.png";
const String aYoga = "assets/images/customer/yoga.png";
// Rental Images, Icons
const String aRentals = "assets/images/customer/rentals.png";
const String aHomes = "assets/images/customer/rental/homes.png";
const String aMotocycle = "assets/images/customer/rental/motorcycle.png";
const String aSurf = "assets/images/customer/rental/surf.png";
const String aHouseSliding = "assets/images/customer/rental/housesliding.png";
const String aPriceCheck = "assets/images/customer/rental/pricecheck.png";
const String aSingleBed = "assets/images/customer/rental/singlebed.png";

const String _imgs_path = "assets/images/customer/taxi/";
const String header_asset = "${_imgs_path}header.png";

const String turnOn_asset = "${_imgs_path}turnOnIllustration.png";
const String noOrdersFound_asset = "${_imgs_path}noOrderIllustration.png";
const String usaFlagAsset = "assets/images/shared/usa.png";
const String mexicoFlagAsset = "assets/images/shared/mexico.png";
const String money_asset = "assets/images/shared/money.png";
const String taxi_driver_marker_asset = "${_imgs_path}taxiDriverImg.png";

extension ParseOrderTypeToString on AppType {
  String toShortString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  String toHasuraString() {
    final String str = toString().split('.').last;
    return (str[0].toLowerCase() + str.substring(1)).replaceFirst('App', '');
  }

  String toNormalString() {
    final String str = toString().split('.').last;
    return str;
  }

  String toChatInfoString() {
    switch (this) {
      case AppType.Customer:
        return "CustomerApp";
      case AppType.DeliveryAdmin:
        return "DeliveryAdminApp";
      case AppType.MezAdmin:
        return "MezAdminApp";
      case AppType.Delivery:
        return "DeliveryApp";
      case AppType.Laundry:
        return "LaundryApp";
      case AppType.Restaurant:
        return "RestaurantApp";
    }
  }

  ParticipantType? toParticipantType() {
    switch (this) {
      case AppType.Customer:
        return ParticipantType.Customer;
      case AppType.DeliveryAdmin:
        return ParticipantType.DeliveryOperator;
      case AppType.MezAdmin:
        return ParticipantType.MezAdmin;
      case AppType.Delivery:
        return ParticipantType.DeliveryDriver;
      case AppType.Laundry:
        return ParticipantType.LaundryOperator;
      case AppType.Restaurant:
        return ParticipantType.RestaurantOperator;
    }
  }

  String getPrivacyLink() {
    switch (this) {
      case AppType.Customer:
        return sPrivacyPolicyCustomerApp;
      default:
        return sPrivacyPolicyCustomerApp;
    }
  }
}

extension StringToParseOrderType on String {
  AppType convertStringToAppType() {
    return AppType.values.firstWhere((AppType e) => e.toShortString() == this);
  }
}
// -----------STYLES CONSTANT ------------------- //

const Color purpleColor = Color(0xFFAC59FC);
const Color primaryBlueColor = Color(0xFF6779FE);
const Color redAccentColor = Color(0xFFE21233);
const Color cancelledBackgroundColor = Color(0XFFFDECEF);
const Color deliveredBackgroundColor = Color(0xFFEAECFF);
const Color pickLocationTextFieldColor = Color(0xFFF5F5F5);
const Color pickLocationHintTextFieldColor = Color(0xFFC4C4C4);
const Color waitingBackgroundColor = Color(0xFFFFF0CB);
const Color onGoingBackgroundColor = Color(0xFFE4F2E5);
const Color backgroundShadeColor = Color(0xFFEDEDED);
const Color secondaryLightBlueColor = Color(0xFFE1E4FF);
const Color laundaryChipContainerColor = Color(0xFFF0F1FF);
const Color offRedColor = Color(0xffF9D8D6);
const Color offShadeGreyColor = Color(0xFF494949);
const Color offLightShadeGreyColor = Color(0xFF787878);
const Color blackColor = Colors.black;
const Color unratedStarColor = Color(0XFFF2F2F2);
const LinearGradient bluePurpleGradient = LinearGradient(
  colors: [
    primaryBlueColor,
    purpleColor,
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const String mezPackageMarker =
    "assets/images/shared/markers/packageMarker.png";
const String mezDestinationMarker =
    "assets/images/shared/markers/destinationMarker.png";
