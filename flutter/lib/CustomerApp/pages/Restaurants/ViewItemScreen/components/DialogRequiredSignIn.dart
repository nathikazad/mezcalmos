import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';
import 'package:sizer/sizer.dart';

void dialogRequiredSignIn(
    {BuildContext? context, Function? navigationCallback}) {
  dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
          ["pages"]["Restaurants"]["ViewItemScreen"]["components"]
      ["DialogRequiredSignIn"];

  var child = Material(
    child: Container(
      color: Colors.white,
      padding: (context != null)
          ? EdgeInsets.symmetric(
              horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context))
          : null,
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              // margin: const EdgeInsets.only(top: 25),
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  mezDbgPrint("Clicked back");
                  if (context != null) {
                    Navigator.of(context).pop();
                  } else
                    Get.back<void>();
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Text(
                    "${_i18n()["title"]}",
                    textAlign: TextAlign.center,
                    style: Get.textTheme.headline3
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 15),
                Image.asset(
                  "assets/images/${(context != null) ? "web" : "shared"}/loginPopUp.png",
                  fit: BoxFit.contain,
                  height: 50.h,
                  width: double.infinity,
                ),
                const SizedBox(height: 15),
                MezButton(
                  onClick: () async {
                    if (context != null) {
                      Navigator.of(context).pop();
                      navigationCallback?.call();
                    } else {
                      // to remove the SignIn popUp first!
                      Get.back<void>();
                      // then head to kSignInRoute.
                      Get.find<AuthController>()
                          .preserveNavigationStackAfterSignIn = true;
                      // ignore: unawaited_futures
                      Get.toNamed<void>(kSignInRouteOptional);
                    }
                  },
                  label: "${_i18n()["signBtn"]}",
                  textStyle: context != null ? TextStyle(fontSize: 18) : null,
                  withGradient: true,
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    if (context != null) {
                      Navigator.of(context).pop();
                    } else
                      Get.back<void>();
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        "${_i18n()["notNowBtn"]}",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: (context != null) ? 18 : null),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  if (context != null) {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return child;
        });
  } else {
    Get.dialog<void>(
      child,
      useSafeArea: false,
    );
  }
}
