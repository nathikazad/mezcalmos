import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';

enum SignInMode {
  OptionalSignIn,
  RequiredSignIn,
}

class SignIn extends GetWidget<AuthController> {
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  final SignInMode mode;
  SignIn({required this.mode});
  LanguageController lang = Get.find<LanguageController>();
  RxBool clickedLogin = false.obs;

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);

    final sw = MediaQuery.of(context).size.width.w;
    final sh = MediaQuery.of(context).size.height.h;
    final lmode = GetStorage().read(getxLmodeKey);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              (mode == SignInMode.OptionalSignIn)
                  ? Container(
                      padding: const EdgeInsets.all(15),
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
                  : Container(),
              MezcalmosSharedWidgets.logo(
                  size: getSizeRelativeToScreen(60.w, sh, sw)),
              SizedBox(height: 10),
              MezcalmosSharedWidgets.mezcalmosTitle(
                  textSize: 40.sp, isBold: true),
              SizedBox(
                height: 25,
              ),
              Flexible(
                flex: 2,
                child: Obx(
                  () => Text(lang.strings['shared']['login']["title"],
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1),
                ),
              ),

              Spacer(),
              facebookLoginBtn(lmode),
              SizedBox(
                height: 10,
              ),
              smsLoginBtn(),
              SizedBox(
                height: 10,
              ),
              // if (lmode != "dev" && Platform.isIOS)
              appleLoginBtn(),
            ],
          ),
        ),
      )),
    );
  }

  Widget appleLoginBtn() {
    return Obx(
      () => TextButton.icon(
          onPressed: clickedLogin.value
              ? null
              : () async {
                  clickedLogin.value = true;
                  await controller.signInWithApple();
                  clickedLogin.value = false;
                },
          style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              fixedSize: Size(double.infinity, 50)),
          icon: (!clickedLogin.value)
              ? Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(Ionicons.logo_apple))
              : Container(),
          label: Container(
            alignment: Alignment.center,
            child: (clickedLogin.value)
                ? SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Text(
                    lang.strings['shared']['login']["loginWithApple"],
                  ),
          )),
    );
  }

  Obx smsLoginBtn() {
    return Obx(
      () => TextButton.icon(
          onPressed: clickedLogin.value ? null : () => Get.toNamed(kOtpRoute),
          style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              fixedSize: Size(double.infinity, 50)),
          icon: (!clickedLogin.value)
              ? Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(Ionicons.chatbox))
              : Container(),
          label: Container(
            alignment: Alignment.center,
            child: (clickedLogin.value)
                ? SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Text(
                    lang.strings['shared']['login']["loginWithSms"],
                  ),
          )),
    );
  }

  Widget facebookLoginBtn(lmode) {
    return Obx(
      () => TextButton.icon(
          onPressed: clickedLogin.value
              ? null
              : () async {
                  clickedLogin.value = true;
                  lmode != "dev"
                      ? await controller.signInWithFacebook()
                      : await Get.defaultDialog(
                          title: "Choose Test User",
                          content: Column(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                    controller.signIn(
                                        tTestCustomerValue, tEmailTestPassword);
                                  },
                                  child: Text(tTestCustomerValue)),
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                    controller.signIn(
                                        tTestTaxiValue, tEmailTestPassword);
                                  },
                                  child: Text(tTestTaxiValue)),
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                    controller.signIn(
                                        tTestAdminValue, tEmailTestPassword);
                                  },
                                  child: Text(tTestAdminValue))
                            ],
                          ));

                  clickedLogin.value = false;
                },
          style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 58, 85, 159),
              fixedSize: Size(double.infinity, 50)),
          icon: (!clickedLogin.value)
              ? Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(Ionicons.logo_facebook),
                )
              : Container(),
          label: Container(
            alignment: Alignment.center,
            child: (clickedLogin.value)
                ? SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Text(
                    lmode != "dev"
                        ? lang.strings['shared']['login']["fbBtn"]
                        : "test mode login",
                  ),
          )),
    );
  }
}
