// WARNING : ===================

// DO NOT TOUCH OR IMPORT ANYTHING IN THIS MAIN PLEASE.
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/appStart/appStartBase.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'dart:html' as html;
import 'dart:js' as js;
import 'package:mezcalmos/env.dart';

final ThemeData _defaultAppTheme = ThemeData(
  primaryColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

class StartingPointWeb extends StartingPointBase {
  //  Sideminu
  StartingPointWeb({
    super.appTheme = null,
    required super.signInCallback,
    required super.signOutCallback,
    required super.routes,
    required super.appType,
    super.sideMenuItems,
    super.locationPermissionType = LocationPermissionType.None,
  });

  @override
  _StartingPointState createState() => _StartingPointState();
}

class _StartingPointState extends StartingPointBaseState {
  _StartingPointState();

  @override
  void initState() {
    super.initState();
    js.context["launchMode"] = MezEnv.appLaunchMode.toShortString();
    html.document.dispatchEvent(html.CustomEvent("dart_loaded"));
  }

  @override
  Future<FirebaseApp> getFirebase() {
    if (MezEnv.appLaunchMode == AppLaunchMode.stage)
      return Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBRQTIUx_-oMdp5_S5e9F8h4Uc4ViZKM4U",
            authDomain: "mezcalmos-staging.firebaseapp.com",
            databaseURL:
                "https://mezcalmos-staging-default-rtdb.firebaseio.com",
            projectId: "mezcalmos-staging",
            storageBucket: "mezcalmos-staging.appspot.com",
            messagingSenderId: "606383265109",
            appId: "1:606383265109:web:a2050a8335ee6e37d8cbdc"),
      );
    else
      return Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB9vaAB9ptXhpeRs_JjxODEyuA_eO0tYu0",
            authDomain: "mezcalmos-31f1c.firebaseapp.com",
            databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
            projectId: "mezcalmos-31f1c",
            storageBucket: "mezcalmos-31f1c.appspot.com",
            messagingSenderId: "804036698204",
            appId: "1:804036698204:web:39b22436cbb4ef633f8699",
            measurementId: "G-5R20EL7CL9"),
      );
  }
}
