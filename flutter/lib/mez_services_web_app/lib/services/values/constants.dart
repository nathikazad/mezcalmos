import 'package:flutter/material.dart';
import 'package:mez_services_web_app/models/Generic.dart';

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
