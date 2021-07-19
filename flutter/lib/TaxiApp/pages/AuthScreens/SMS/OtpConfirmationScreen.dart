import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/routes/SimpleRouter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpConfirmationScreen extends GetView<AuthController> {
  LanguageController lang = Get.find<LanguageController>();
  RxBool clickedSignInOtp = false.obs;

  @override
  Widget build(BuildContext context) {
    TextEditingController _otpCodeTextController = TextEditingController();
    RxBool canConfirmOtp = false.obs;
    String otpCode = "";
    String _phonePassed = Get.arguments;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
            "back", () => Get.back(closeOverlays: true),
            bgColor: Colors.grey[50]),
        body: Container(
            height: double.infinity,
            // color: Colors.white,
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                        lang.strings['shared']['login']["OtpConfirmation"],
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 45)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: Get.height * 0.25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.grey.shade200, width: 1),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => RichText(
                              text: new TextSpan(
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.5,
                                ),
                                children: <TextSpan>[
                                  new TextSpan(
                                      text: lang.strings['shared']['login']
                                          ["enterOtpCode"],
                                      style: TextStyle(color: Colors.black87)),
                                  new TextSpan(
                                    text: Get.arguments ?? _phonePassed,
                                    style: TextStyle(color: Colors.blue),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          PinCodeTextField(
                            onTap: () {
                              canConfirmOtp.value = false;
                              _otpCodeTextController.clear();
                            },

                            controller: _otpCodeTextController,
                            enabled: canConfirmOtp.value ? false : true,
                            enableActiveFill: true,
                            appContext: context,
                            hintCharacter: "#",
                            length: 6,
                            // backgroundColor: Colors.grey.shade200,
                            onChanged: (s) {
                              otpCode = s;
                              if (s.length != 6)
                                canConfirmOtp.value = false;
                              else {
                                canConfirmOtp.value = true;
                                otpCode = s;
                              }
                            },

                            cursorColor: Colors.purpleAccent,
                            keyboardType: TextInputType.number,
                            textStyle:
                                TextStyle(fontSize: 18, color: Colors.black87),
                            pinTheme: PinTheme(
                              borderRadius: BorderRadius.circular(5),
                              borderWidth: 0.0,
                              fieldHeight: 50,
                              fieldWidth: 46,
                              shape: PinCodeFieldShape.box,
                              selectedFillColor: Colors.grey.shade100,
                              activeColor: Colors.transparent,
                              disabledColor: Colors.grey,
                              inactiveColor: Colors.transparent,
                              selectedColor: Colors.purple,
                              activeFillColor: Colors.grey.shade100,
                              inactiveFillColor: Colors.grey.shade100,
                            ),
                          ),
                          Obx(
                            () => GestureDetector(
                                onTap: controller.timeBetweenResending == 0
                                    ? () async {
                                        // resend code !
                                        canConfirmOtp.value = false;
                                        _otpCodeTextController.clear();
                                        await controller.sendOTPForLogin(
                                            Get.arguments ?? _phonePassed);
                                      }
                                    : null,
                                child: Text(
                                  controller.timeBetweenResending == 0
                                      ? lang.strings['shared']['login']
                                          ["resend"]
                                      : "${lang.strings['shared']['login']["resendAfter"]} ${controller.timeBetweenResending} ${lang.strings['shared']['login']["seconds"]}",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color:
                                          controller.timeBetweenResending == 0
                                              ? Colors.black
                                              : Colors.grey.shade400,
                                      fontSize: 17.5,
                                      decoration: TextDecoration.underline),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Obx(
                      () => Text(
                        lang.strings['shared']['login']["twilioNote"],
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 11),
                      ),
                    ),
                  ),
                  Obx(() => TextButton(
                        onPressed:
                            canConfirmOtp.value && !clickedSignInOtp.value
                                ? () async {
                                    clickedSignInOtp.value = true;
                                    print(
                                        "${Get.arguments ?? _phonePassed} -------------- $otpCode ");
                                    await controller.signInUsingOTP(
                                        Get.arguments ?? _phonePassed, otpCode);

                                    clickedSignInOtp.value = false;
                                  }
                                : null,
                        child: clickedSignInOtp.value
                            ? SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Obx(
                                () => Text(
                                  lang.strings['shared']['login']["confirm"],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                        style: ButtonStyle(
                            fixedSize:
                                MaterialStateProperty.all(Size(Get.width, 50)),
                            alignment: Alignment.center,
                            backgroundColor: MaterialStateProperty.all(
                                canConfirmOtp.value
                                    ? Colors.blue
                                    : Colors.grey)),
                      ))
                ],
              ),
            )));
  }
}
