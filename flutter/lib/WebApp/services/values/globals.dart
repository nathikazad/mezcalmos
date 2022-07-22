import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';

///change this [typeMode] to prod or dev
/// if you want to build for production
String typeMode = AppLaunchMode.stage.toShortString();

const Color myColor = Color.fromRGBO(103, 121, 254, 1);

///images strings home index page

const String homeMobileUIImageEN = "assets/images/webApp/home_pageEN.png";
const String laundryMobileUIImageEN = "assets/images/webApp/laundry_listEN.png";
const String restaurantMobileUiImageEN =
    "assets/images/webApp/restaurant_listEN.png";

const String homeMobileUIImageES = "assets/images/webApp/home_pageES.png";
const String laundryMobileUIImageES = "assets/images/webApp/laundry_listES.png";
const String restaurantMobileUiImageES =
    "assets/images/webApp/restaurant_listES.png";

/// images for services
const String foodServiceOne = "assets/images/webApp/foodServiceImage1.jpeg";
const String foodServiceTwo = "assets/images/webApp/foodServiceImage2.jpeg";
const String foodServiceThree = "assets/images/webApp/foodServiceImage3.jpg";

const String laundryServiceOne =
    "assets/images/webApp/laundryServiceImage1.jpeg";
const String laundryServiceTwo =
    "assets/images/webApp/laundryServiceImage2.jpeg";
const String laundryServiceThree =
    "assets/images/webApp/laundryServiceImage3.jpeg";

/// reg experisions
RegExp emailEeg = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
