// ----------------- CONNECTIVITY STRINGS ----------------- //
// PLEASE DO NOT TOUCH ANYTHING IN CONNECTIVITY STRINGS , UNLESS YOU INFORM OTHERS.
// import 'package:flutter/material.dart';

import 'package:mezcalmos/Shared/models/Chat.dart';

const String db = "mezcalmos-31f1c-default-rtdb";
const String stagingDb =
    "https://mezcalmos-staging-default-rtdb.firebaseio.com";
const String localhost = "http://127.0.0.1";
const String authPort = ":9099";
const String dbRoot = ":9000/?ns=$db";
const String functionPort = ":5001";
const String placesApikey =
    "AIzaSyACS-jr0KWCzCN0WFqbltolpX1dqhB2OjY"; //"AIzaSyACS-jr0KWCzCN0WFqbltolpX1dqhB2OjY";
// can be dev / prod

// ----------------- TEST STRINGS ----------------- //

const String tTestTaxiValue = "taxi.one@mezcalmos.com";
const String tTestCustomerValue = "customer.one@mezcalmos.com";
const String tTestAdminValue = "admin@mezcalmos.com";
const String tEmailTestPassword = "password";

// ----------------- Costants Numbers ----------------- //

const double nDefaultMezcalmosTextSize = 30.5;
const int nSplashScreenTimer = 1;
// ----------------- Costants Strings ----------------- //

const String tPrivacyPolicy = "https://meztaxi.com/privacy-policy.html";

const String tDefaultLanguage = "es";
const String tDefaultTheme = "light";

const String tMez = "MEZ";
const String tCalmos = "CALMOS";
const String tMezcalmos = "MEZCALMOS";

const String tDefaultUserName = "Unknown";
const String tDefaultCustomerName = "Unknown";

// ----------------- GetStorage Strings ----------------- //
const String getxLmodeKey = "lmod";
const String getxGmapBottomPaddingKey = "gmap_bottom_padding";
const String getxUserDescriptionPlaceHolder = "user_descriptor_placeholder";
const String getxTaxiDescriptor = "taxi_descriptor";
const String getxDestinationDescriptor = "destination_descriptor";
const String getxUserId = "userid";
const String getxVersion = "version";
// ----------------- Assets Strings ----------------- //

const String aLogoPath = "assets/images/shared/logo.png";
const String aDefaultAvatar = "assets/images/shared/noUserImage.jpg";
const String aMapUserImgNotSignedIn = "assets/images/shared/mapUser.png";
const String aNoImgAsset = "assets/images/shared/noImg.png";
const String enLang = "assets/i18n/en.json";
const String esLang = "assets/i18n/es.json";
const String aLocationPermissionAsset =
    "assets/images/shared/enableMapIllustration.png";

const String aPurpleLocationCircle =
    "assets/images/shared/purpleLocationCircle.png";
const String aLocationPicker = "assets/images/shared/purpleLocationPicker.png";
const String aOrderUnavailable = "assets/images/shared/circularCancel.png";

enum AppType { CustomerApp, TaxiApp, TaxiAdminApp, DeliveryAdminApp }

extension ParseOrderTypeToString on AppType {
  String toShortString() {
    String str = this.toString().split('.').last;
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
    }
  }
}

extension StringToParseOrderType on String {
  AppType convertStringToAppType() {
    return AppType.values.firstWhere((e) => e.toShortString() == this);
  }
}
