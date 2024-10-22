// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/SignInHelper.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/fakeCreds.dart';
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

class SignInView extends StatefulWidget {
  static Future<void> navigateAtInit() {
    return MezRouter.toPath(SharedRoutes.kSignInRoute,
        arguments: {"mode": SignInMode.RequiredSignIn});
  }

  static Future<void> navigateAtOrderTime() {
    return MezRouter.toPath(SharedRoutes.kSignInAtOrderTimeRoute,
        arguments: {"mode": SignInMode.OptionalSignIn});
  }

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final RxBool clickedLogin = false.obs;
  late SignInMode mode;
  @override
  void initState() {
    mode = MezRouter.bodyArguments?["mode"] ?? SignInMode.RequiredSignIn;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10),
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
                // SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  width: Get.width,
                  child: MezcalmosSharedWidgets.mezcalmosTitle(
                      textSize: 35.mezSp, isBold: true),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(_i18n()["title"],
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 10,
                ),
                ...buildSignInButtons(MezEnv.appLaunchMode),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
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
        if (!kIsWeb) facebookLoginBtn(lmode),
        SizedBox(
          height: 10,
        ),
        smsLoginBtn(),
        SizedBox(
          height: 10,
        ),
        if (lmode != AppLaunchMode.dev && !kIsWeb && Platform.isIOS)
          appleLoginBtn(),
        if (MezEnv.appLaunchMode == AppLaunchMode.stage)
          ...stageLoginBtns(stageCredentials),
        if (MezEnv.appLaunchMode == AppLaunchMode.dev)
          ...stageLoginBtns(devCredentials),
      ];
    }
  }

  List<Widget> stageLoginBtns(List<Credential> credentials) {
    return credentials.fold<List<Widget>>([],
        (List<Widget> list, Credential credential) {
      list.add(Container(
        width: double.infinity,
        child: TextButton(
            onPressed: () {
              clickedLogin.value = true;
              signIn(credential.username, credential.password)
                  .whenComplete(() => clickedLogin.value = false);
            },
            style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                fixedSize: Size(double.infinity, 50)),
            child: Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(Ionicons.log_in)),
                  Expanded(
                    child: Text(
                      "${_i18n()['loginAs']} ${_i18n()[credential.identifier.toLowerCase()]}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 11.mezSp),
                    ),
                  ),
                ],
              ),
            )),
      ));

      list.add(SizedBox(
        height: 10,
      ));
      list.add(Container(
        width: double.infinity,
        child: TextButton(
            onPressed: () {
              clickedLogin.value = true;
              signUp('${generateString()}@mezc.com', 'password')
                  .whenComplete(() => clickedLogin.value = false);
            },
            style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                fixedSize: Size(double.infinity, 50)),
            child: Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(Ionicons.log_in)),
                  Expanded(
                    child: Text(
                      "${_i18n()['loginAs']} random",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 11.mezSp),
                    ),
                  ),
                ],
              ),
            )),
      ));
      list.add(SizedBox(
        height: 10,
      ));
      return list;
    });
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
                Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(Ionicons.logo_apple)),
                Expanded(
                  child: Text(
                    _i18n()["loginWithApple"],
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 11.mezSp),
                  ),
                ),
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
                Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(Ionicons.log_in)),
                Expanded(
                  child: Text(
                    _i18n()["loginWithSms"],
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 11.mezSp),
                  ),
                ),
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
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(Ionicons.logo_facebook),
                ),
                Expanded(
                  child: Text(
                    lmode != AppLaunchMode.dev
                        ? _i18n()["fbBtn"]
                        : "test mode login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 11.mezSp),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
