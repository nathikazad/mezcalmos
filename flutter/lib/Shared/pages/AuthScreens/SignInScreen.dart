// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/SignInHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';
import 'package:mezcalmos/env.dart';
import 'package:sizer/sizer.dart';

enum SignInMode {
  OptionalSignIn,
  RequiredSignIn,
}

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ["AuthScreens"]["SignInScreen"];

class SignIn extends GetWidget<AuthController> {
  final SignInMode mode;
  SignIn({required this.mode});
  final RxBool clickedLogin = false.obs;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(8.0),
              width: Get.width,
              height: Get.height,
              alignment: Alignment.center,
              child: Obx(
                () => Column(
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    (mode == SignInMode.OptionalSignIn && !clickedLogin.value)
                        ? Container(
                            // padding: const EdgeInsets.only(top: 5),
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                MezRouter.back();
                              },
                            ),
                          )
                        : SizedBox(
                            height: 30,
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: MezcalmosSharedWidgets.logo(size: 15.h),
                    ),
                    SizedBox(height: 10),
                    MezcalmosSharedWidgets.mezcalmosTitle(
                        textSize: 35.sp, isBold: true),
                    Spacer(),
                    Text(_i18n()["title"],
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    Spacer(),
                    ...buildSignInButtons(MezEnv.appLaunchMode),
                    Spacer(),
                  ],
                ),
              )),
        )));
  }

  List<Widget> buildSignInButtons(AppLaunchMode lmode) {
    if (clickedLogin.value) {
      return <Widget>[
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: CircularProgressIndicator(
              color: Colors.black,
              strokeWidth: 2.5,
            )),
      ];
    } else {
      return <Widget>[
        SizedBox(
          height: 20,
        ),
        facebookLoginBtn(lmode),
        SizedBox(
          height: 10,
        ),
        smsLoginBtn(),
        SizedBox(
          height: 10,
        ),
        if (lmode != AppLaunchMode.dev && !kIsWeb && Platform.isIOS)
          appleLoginBtn(),
      ];
    }
  }

  Widget appleLoginBtn() {
    return Container(
      width: double.infinity,
      child: TextButton(
          onPressed: () {
            clickedLogin.value = true;
            signInWithApple().whenComplete(() => clickedLogin.value = false);
          },
          style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              fixedSize: Size(double.infinity, 50)),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.05, right: Get.width * 0.05),
                    child: Icon(Ionicons.logo_apple)),
                Spacer(),
                Text(
                  _i18n()["loginWithApple"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer()
              ],
            ),
          )),
    );
  }

  Widget smsLoginBtn() {
    return Container(
      width: double.infinity,
      child: TextButton(
          onPressed: () => MezRouter.toNamed(SharedRoutes.kOtpRoute),
          style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              fixedSize: Size(double.infinity, 50)),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.05, right: Get.width * 0.05),
                    child: Icon(Ionicons.chatbox)),
                Spacer(),
                Text(
                  _i18n()["loginWithSms"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
          )),
    );
  }

  Widget facebookLoginBtn(AppLaunchMode lmode) {
    return Container(
      width: double.infinity,
      child: TextButton(
          onPressed: () async {
            clickedLogin.value = true;
            lmode != AppLaunchMode.dev
                ? signInWithFacebook()
                    .whenComplete(() => clickedLogin.value = false)
                : await Get.defaultDialog<dynamic>(
                    title: "Choose Test User",
                    content: Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              signIn(tTestCustomerValue, tEmailTestPassword);
                            },
                            child: Text(tTestCustomerValue)),
                        TextButton(
                            onPressed: () {
                              signIn(
                                  tTestRestaurantOpValue, tEmailTestPassword);
                            },
                            child: Text(tTestRestaurantOpValue)),
                        TextButton(
                            onPressed: () {
                              signIn(tTestAdminValue, tEmailTestPassword);
                            },
                            child: Text(tTestAdminValue)),
                        TextButton(
                          onPressed: () {
                            signIn(tTestDeliveryOpValue, tEmailTestPassword);
                          },
                          child: Text(tTestDeliveryOpValue),
                        ),
                      ],
                    ));

            // clickedLogin.value = false;
          },
          style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 58, 85, 159),
              fixedSize: Size(double.infinity, 50)),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: Get.width * 0.05, right: Get.width * 0.05),
                  child: Icon(Ionicons.logo_facebook),
                ),
                Spacer(),
                Text(
                  lmode != AppLaunchMode.dev
                      ? _i18n()["fbBtn"]
                      : "test mode login",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
          )),
    );
  }
}
