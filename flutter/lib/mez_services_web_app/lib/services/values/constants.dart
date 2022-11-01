import 'package:flutter/material.dart';
import 'package:mez_services_web_app/helpers/GeneralPurposeHelper.dart';
import 'package:mez_services_web_app/models/Generic.dart';

const String db = "mezcalmos-31f1c-default-rtdb";
const String stagingDb =
    "https://mezcalmos-staging-default-rtdb.firebaseio.com";
const String localhost = "http://127.0.0.1";
const String authPort = ":9099";
const String dbRoot = ":9000/?ns=$db";
const int functionPort = 5001;
const String placesApikey = "AIzaSyACS-jr0KWCzCN0WFqbltolpX1dqhB2OjY";

///change this [typeMode] to prod or dev
/// if you want to build for production
String typeMode = AppLaunchMode.prod.toShortString();

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
