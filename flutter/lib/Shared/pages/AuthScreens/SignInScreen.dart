import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends GetWidget<AuthController> {
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
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
        child: Center(
          child: FittedBox(
            child: Container(
              height: sh,
              width: sw,
              child: Flex(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.vertical,

                crossAxisAlignment: CrossAxisAlignment.center,
                // spacing: 20,
                textDirection: TextDirection.ltr,
                children: [
                  Center(
                    child: Container(
                      child: MezcalmosSharedWidgets.logo(
                          size: getSizeRelativeToScreen(60.w, sh, sw)),
                    ),
                  ),
                  SizedBox(height: (Get.height * 0.05).h),
                  MezcalmosSharedWidgets.mezcalmosTitle(
                      // textSize: getSizeRelativeToScreen(25, sh, sw).sp,
                      textSize: Get.width > 320
                          ? getSizeRelativeToScreen(23, sh, sw).sp
                          : 45.sp,
                      isBold: true),
                  SizedBox(
                    height: (Get.height * 0.05).h,
                  ),
                  Flexible(
                    flex: 2,
                    child: Obx(
                      () => Text(
                        lang.strings['shared']['login']["title"],
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'psb',
                          fontSize: getSizeRelativeToScreen(16, sh, sw).sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getSizeRelativeToScreen(20, sh, sw),
                  ),
                  Flexible(
                      fit: FlexFit.loose,
                      child: Obx(
                        () => TextButton(
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
                                                  onPressed: () =>
                                                      controller.signIn(
                                                          tTestCustomerValue,
                                                          tEmailTestPassword),
                                                  child:
                                                      Text(tTestCustomerValue)),
                                              TextButton(
                                                  onPressed: () =>
                                                      controller.signIn(
                                                          tTestTaxiValue,
                                                          tEmailTestPassword),
                                                  child: Text(tTestTaxiValue)),
                                              TextButton(
                                                  onPressed: () =>
                                                      controller.signIn(
                                                          tTestAdminValue,
                                                          tEmailTestPassword),
                                                  child: Text(tTestAdminValue))
                                            ],
                                          ));

                                  clickedLogin.value = false;
                                },
                          child: clickedLogin.value
                              ? Center(
                                  child: SizedBox(
                                    height: 18,
                                    width: 18,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Icon(MezcalmosIcons.facebook_f),
                                    ),
                                    Flexible(
                                        fit: FlexFit.tight,
                                        child: Text(
                                          lmode != "dev"
                                              ? lang.strings['shared']['login']
                                                  ["fbBtn"]
                                              : "test mode login",
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          //style: TextStyle(fontSize: 20.sp),
                                          overflow: TextOverflow.ellipsis,
                                          textScaleFactor: 0.9,
                                        ))
                                  ],
                                ),
                          style: ButtonStyle(
                            // padding:  MaterialStateProperty.<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 10)),
                            textStyle: MaterialStateProperty.all<TextStyle>(
                                new TextStyle(
                                    fontSize:
                                        getSizeRelativeToScreen(10, sh, sw),
                                    fontWeight: FontWeight.bold)),
                            fixedSize: MaterialStateProperty.all<Size>(new Size(
                                getSizeRelativeToScreen(150, sh, sw),
                                getSizeRelativeToScreen(25, sh, sw))),
                            elevation: MaterialStateProperty.all<double>(2),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 58, 85, 159)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: getSizeRelativeToScreen(5, sh, sw),
                  ),
                  Flexible(
                      fit: FlexFit.loose,
                      child: Obx(
                        () => TextButton(
                          onPressed: clickedLogin.value
                              ? null
                              : () => Get.toNamed(kOtpRoute),
                          child: clickedLogin.value
                              ? Center(
                                  child: SizedBox(
                                    height: 18,
                                    width: 18,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Icon(MezcalmosIcons.envelope),
                                    ),
                                    Flexible(
                                        fit: FlexFit.tight,
                                        child: Text(
                                          lang.strings['shared']['login']
                                              ["loginWithSms"],
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textScaleFactor: 0.9,
                                        ))
                                  ],
                                ),
                          style: ButtonStyle(
                            textStyle: MaterialStateProperty.all<TextStyle>(
                                new TextStyle(
                                    fontSize:
                                        getSizeRelativeToScreen(10, sh, sw),
                                    fontWeight: FontWeight.bold)),
                            fixedSize: MaterialStateProperty.all<Size>(new Size(
                                getSizeRelativeToScreen(150, sh, sw),
                                getSizeRelativeToScreen(25, sh, sw))),
                            elevation: MaterialStateProperty.all<double>(2),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 92, 127, 255)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                        ),
                      )),
                  lmode != "dev" && Platform.isIOS
                      ? SizedBox(
                          height: getSizeRelativeToScreen(5, sh, sw),
                        )
                      : SizedBox(),
                  lmode != "dev" && Platform.isIOS
                      ? Flexible(
                          fit: FlexFit.loose,
                          child: Obx(
                            () => TextButton(
                              onPressed: clickedLogin.value
                                  ? null
                                  : () async {
                                      clickedLogin.value = true;
                                      await controller.signInWithApple();
                                      clickedLogin.value = false;
                                    },
                              child: clickedLogin.value
                                  ? Center(
                                      child: SizedBox(
                                        height: 18,
                                        width: 18,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15.0),
                                          child: Icon(
                                            MezcalmosIcons.apple,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: Text(
                                            lang.strings['shared']['login']
                                                ["loginWithApple"],
                                            softWrap: true,
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textScaleFactor: 0.9,
                                          ),
                                        )
                                      ],
                                    ),
                              style: ButtonStyle(
                                // padding:  MaterialStateProperty.<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 10)),
                                textStyle: MaterialStateProperty.all<TextStyle>(
                                    new TextStyle(
                                        fontSize:
                                            getSizeRelativeToScreen(10, sh, sw),
                                        fontWeight: FontWeight.bold)),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    new Size(
                                        getSizeRelativeToScreen(150, sh, sw),
                                        getSizeRelativeToScreen(25, sh, sw))),
                                elevation: MaterialStateProperty.all<double>(2),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                            ),
                          ))
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
