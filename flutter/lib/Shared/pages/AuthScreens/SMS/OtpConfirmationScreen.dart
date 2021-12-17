import 'dart:async';
import 'dart:ui';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpConfirmationScreen extends GetView<AuthController> {
  LanguageController lang = Get.find<LanguageController>();
  RxBool clickedSignInOtp = false.obs;
  RxInt _timeBetweenResending = 0.obs;
  int get timeBetweenResending => _timeBetweenResending.value;
  void resendOtpTimerActivate(double time) {
    _timeBetweenResending.value = time.toInt();
    const second = const Duration(seconds: 1);
    Timer.periodic(
      second,
      (Timer __t) {
        print(
            "OTP Code resending available after $timeBetweenResending Seconds !");
        if (_timeBetweenResending.value == 0)
          __t.cancel();
        else
          _timeBetweenResending.value--;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _otpCodeTextController = TextEditingController();
    RxBool canConfirmOtp = false.obs;
    String otpCode = "";
    String _phonePassed = Get.arguments;

    responsiveSize(context);

    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: mezcalmosAppBar(AppBarLeftButtonType.Back),
        body: Container(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              // height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Obx(
                    () => Text(
                        lang.strings['shared']['login']["OtpConfirmation"],
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 45.sp)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.grey.shade200, width: 1),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(
                            () => RichText(
                              text: new TextSpan(
                                style: TextStyle(
                                    fontFamily: 'psr',
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                                children: <TextSpan>[
                                  new TextSpan(
                                    text: lang.strings['shared']['login']
                                        ["enterOtpCode"],
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  new TextSpan(
                                    text: "  ${Get.arguments ?? _phonePassed}",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
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
                            textStyle: TextStyle(
                                fontSize: 18.sp, color: Colors.black87),
                            pinTheme: PinTheme(
                              borderRadius: BorderRadius.circular(5),
                              borderWidth: 0.0,
                              fieldHeight: Get.width * 0.13,
                              fieldWidth: Get.width * 0.13,
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
                                onTap: timeBetweenResending == 0
                                    ? () async {
                                        // resend code !
                                        canConfirmOtp.value = false;
                                        _otpCodeTextController.clear();
                                        ServerResponse response =
                                            await controller.sendOTPForLogin(
                                                Get.arguments ?? _phonePassed);
                                        mezDbgPrint(response.data);
                                        if (!response.success) {
                                          resendOtpTimerActivate(response
                                              .data['secondsLeft'] as double);
                                          MezSnackbar(
                                              response.status.toShortString(),
                                              response.errorMessage.toString(),
                                              position: SnackPosition.TOP);
                                        }
                                      }
                                    : null,
                                child: Text(
                                  timeBetweenResending == 0
                                      ? lang.strings['shared']['login']
                                          ["resend"]
                                      : "${lang.strings['shared']['login']["resendAfter"]} ${timeBetweenResending} ${lang.strings['shared']['login']["seconds"]}",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: timeBetweenResending == 0
                                          ? Colors.black
                                          : Colors.grey.shade400,
                                      fontSize: 17.5.sp,
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
                            fontWeight: FontWeight.w500, fontSize: 11.sp),
                      ),
                    ),
                  ),
                  Spacer(),
                  Obx(
                    () => Container(
                      padding: const EdgeInsets.only(bottom: 40),
                      width: double.infinity,
                      child: TextButton(
                        onPressed: canConfirmOtp.value &&
                                !clickedSignInOtp.value
                            ? () async {
                                clickedSignInOtp.value = true;
                                mezDbgPrint(
                                    "${Get.arguments ?? _phonePassed} -------------- $otpCode ");
                                ServerResponse? _resp =
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
                                      fontSize: 15.sp),
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
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.005,
                  ),
                ],
              ),
            )));
  }
}
