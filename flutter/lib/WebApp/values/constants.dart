import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';

import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

const String db = "mezcalmos-31f1c-default-rtdb";
const String stagingDb =
    "https://mezcalmos-staging-default-rtdb.firebaseio.com";
const String localhost = "http://127.0.0.1";
const String authPort = ":9099";
const String dbRoot = ":9000/?ns=$db";
const int functionPort = 5001;
const String placesApikey = "AIzaSyACS-jr0KWCzCN0WFqbltolpX1dqhB2OjY";

const String markerForWeb = "assets/images/web/destinationImg.png";

const String logo = "assets/images/web/logo.png";
const String aLocationPicker = "assets/images/web/purpleLocationPicker.png";

/// bottom bar social media links
const String facebookSvg = "assets/images/web/facebook-f.svg";
const String linkedInSvg = "assets/images/web/linkedin.svg";
const String instagramSvg = "assets/images/web/instagram.svg";

/// bottom bar social media urls
const String facbookUrl = "https://web.facebook.com/mezcalmos";
const String instagramUrl = "https://www.instagram.com/mezcalmos/";
const String linkedInUrl = "https://www.linkedin.com/company/mezcalmos/";

const String getxUserId = "userid";
const String defaultUserImgUrl =
    "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/logo%402x.png?alt=media&token=4a18a710-e267-40fd-8da7-8c12423cc56d";

///change this [typeMode] to prod or dev
/// if you want to build for production
String typeMode = AppLaunchMode.stage.toShortString();

const LanguageType sDefaultLanguage = LanguageType.ES;
const String enLang = "assets/i18n/en.json";
const String esLang = "assets/i18n/es.json";
const Color purpleColor = Color(0xFFAC59FC);
const Color primaryBlueColor = Color(0xFF6779FE);
const Color SecondaryLightBlueColor = Color(0xFFE1E4FF);
const Color offRedColor = Color(0xFFF9D8D6);
const LinearGradient bluePurpleGradient = LinearGradient(
  colors: [
    primaryBlueColor,
    purpleColor,
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
