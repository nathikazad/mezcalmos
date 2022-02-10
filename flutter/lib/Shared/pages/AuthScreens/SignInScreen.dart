import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';
import 'package:sizer/sizer.dart';

enum SignInMode {
  OptionalSignIn,
  RequiredSignIn,
}

class SignIn extends GetWidget<AuthController> {
  final SignInMode mode;
  SignIn({required this.mode});
  final LanguageController lang = Get.find<LanguageController>();
  RxBool clickedLogin = false.obs;

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);

    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    final lmode = GetStorage().read(getxLmodeKey);

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
                                Get.back();
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
                    Text(i18n.strings['shared']['login']["title"],
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    Spacer(),
                    ...buildSignInButtons(lmode),
                    Spacer(),
                  ],
                ),
              )),
        )));
  }

  List<Widget> buildSignInButtons(String? lmode) {
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
        if (lmode != "dev" && Platform.isIOS) appleLoginBtn(),
      ];
    }
  }

  Widget appleLoginBtn() {
    return Container(
      width: double.infinity,
      child: TextButton(
          onPressed: () async {
            clickedLogin.value = true;
            controller
                .signInWithApple()
                .onError((error, stackTrace) => clickedLogin.value = false);
            // clickedLogin.value = false;
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
                  i18n.strings['shared']['login']["loginWithApple"],
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
          onPressed: () => Get.toNamed(kOtpRoute),
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
                  i18n.strings['shared']['login']["loginWithSms"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
          )),
    );
  }

  Widget facebookLoginBtn(String? lmode) {
    return Container(
      width: double.infinity,
      child: TextButton(
          onPressed: () async {
            clickedLogin.value = true;
            lmode != "dev"
                ? controller
                    .signInWithFacebook()
                    .onError((error, stackTrace) => clickedLogin.value = false)
                : await Get.defaultDialog(
                    title: "Choose Test User",
                    content: Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              // Get.back();
                              controller.signIn(
                                  tTestCustomerValue, tEmailTestPassword);
                            },
                            child: Text(tTestCustomerValue)),
                        TextButton(
                            onPressed: () {
                              // Get.back();
                              controller.signIn(
                                  tTestTaxiValue, tEmailTestPassword);
                            },
                            child: Text(tTestTaxiValue)),
                        TextButton(
                            onPressed: () {
                              // Get.back();
                              controller.signIn(
                                  tTestAdminValue, tEmailTestPassword);
                            },
                            child: Text(tTestAdminValue))
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
                  lmode != "dev"
                      ? i18n.strings['shared']['login']["fbBtn"]
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
