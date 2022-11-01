import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';

///change this [typeMode] to prod or dev
/// if you want to build for production
String typeMode = AppLaunchMode.stage.toShortString();

const Color myColor = Color.fromRGBO(103, 121, 254, 1);

///images strings home index page

const String homeMobileUIImageEN =
    "https://firebasestorage.googleapis.com/v0/b/mezcalmos-staging.appspot.com/o/webApp%2Fhome_pageEN.png?alt=media&token=a6f1e28b-6458-4d13-b2de-cf5464355898";
const String laundryMobileUIImageEN =
    "https://firebasestorage.googleapis.com/v0/b/mezcalmos-staging.appspot.com/o/webApp%2Flaundry_listEN.png?alt=media&token=b79148fe-d0fa-4f14-bb53-d20967f7aa48";
const String restaurantMobileUiImageEN =
    "https://firebasestorage.googleapis.com/v0/b/mezcalmos-staging.appspot.com/o/webApp%2Frestaurant_listEN.png?alt=media&token=8f8c6555-ad38-489a-80bc-53b31d02a5fa";

const String homeMobileUIImageES =
    "https://firebasestorage.googleapis.com/v0/b/mezcalmos-staging.appspot.com/o/webApp%2Fhome_pageES.png?alt=media&token=de29c436-6da7-4b03-bdc9-66e1dcd642aa";
const String laundryMobileUIImageES =
    "https://firebasestorage.googleapis.com/v0/b/mezcalmos-staging.appspot.com/o/webApp%2Flaundry_listES.png?alt=media&token=97cb35aa-2bac-4896-a4a7-84802fd12fb5";
const String restaurantMobileUiImageES =
    "https://firebasestorage.googleapis.com/v0/b/mezcalmos-staging.appspot.com/o/webApp%2Frestaurant_listES.png?alt=media&token=cbe84a9a-d720-416f-8ae6-7cb3a63a4637";

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
