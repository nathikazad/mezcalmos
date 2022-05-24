// ----------------- CONNECTIVITY STRINGS ----------------- //
// PLEASE DO NOT TOUCH ANYTHING IN CONNECTIVITY STRINGS , UNLESS YOU INFORM OTHERS.
// import 'package:flutter/material.dart';

// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';

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
// can be dev / prod

// ----------------- TEST STRINGS ----------------- //

const String tTestTaxiValue = "taxi.one@mezcalmos.com";
const String tTestCustomerValue = "customer.one@mezcalmos.com";
const String tTestAdminValue = "admin@mezcalmos.com";
const String tEmailTestPassword = "password";

// ----------------- Costants Numbers ----------------- //

const double nDefaultMezcalmosTextSize = 30.5;
const int nSplashScreenTimer = 1;
const int nQualityCompressionOfUserImage = 10;
const int nDefaultCounterOfferValidExpireTimeInSeconds = 30;
const int nScheduledCounterOfferValidExpireTimeInSeconds = 900; // 15mins

// ----------------- Costants Strings ----------------- //
const String sPrivacyPolicyCustomerApp =
    "https://www.mezcalmos.com/privacy-policy.html";
const String sPrivacyPolicyTaxiApp = "https://meztaxi.com/privacy-policy.html";

const LanguageType sDefaultLanguage = LanguageType.ES;
const String sDefaultTheme = "light";

const String sMez = "MEZ";
const String sCalmos = "CALMOS";
const String sMezcalmos = "MEZCALMOS";

const String sDefaultUserName = "Unknown";
const String sDefaultCustomerName = "Unknown";

// ----------------- GetStorage Strings ----------------- //
const String getxPrivacyPolicyLink = "ppLink";
const String getxLmodeKey = "lmod";
const String getxGmapBottomPaddingKey = "gmap_bottom_padding";
const String getxTaxiDescriptor = "taxi_descriptor";
const String getxDestinationDescriptor = "destination_descriptor";
const String getxUserId = "userid";
const String getxAppVersion = "version";
const String getxAppName = "appName";
const String getxPackageName = "packageName";
const String getxAppStoreId = "iosAppStoreId";
const String defaultUserImgUrl =
    "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/logo%402x.png?alt=media&token=4a18a710-e267-40fd-8da7-8c12423cc56d";

// ----------------- Assets Strings ----------------- //
const String aDefaultNotificationsSound = 'assets/sounds/notif-alert.mp3';
const String aLogoPath = "assets/images/shared/logo.png";
const String aNoImage = "assets/images/shared/noImage.png";
const String a404 = "assets/images/shared/404.png";
const String aUpdate = "assets/images/shared/update.png";
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

enum AppType {
  CustomerApp,
  TaxiApp,
  TaxiAdminApp,
  DeliveryAdminApp,
  DeliveryApp,
  LaundryApp
}

extension ParseOrderTypeToString on AppType {
  String toShortString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  ParticipantType? toParticipantType() {
    switch (this) {
      case AppType.CustomerApp:
        return ParticipantType.Customer;
      case AppType.TaxiApp:
        return ParticipantType.Taxi;
      case AppType.TaxiAdminApp:
        return ParticipantType.TaxiAdmin;
      case AppType.DeliveryAdminApp:
        return ParticipantType.DeliveryAdmin;
      default:
        return null;
    }
    return null;
  }
}

extension StringToParseOrderType on String {
  AppType convertStringToAppType() {
    return AppType.values.firstWhere((AppType e) => e.toShortString() == this);
  }
}

const Color keyAppColor = Color(0xFFAC59FC);
