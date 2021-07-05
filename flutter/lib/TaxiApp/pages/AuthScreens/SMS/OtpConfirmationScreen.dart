import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/smsController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpConfirmationScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _otpCodeTextController = TextEditingController();
    SmsController _smsController = Get.find<SmsController>();

    RxBool canConfirmOtp = false.obs;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: MezcalmosSharedWidgets.mezcalmosAppBar("back", () => Get.back(closeOverlays: true), bgColor: Colors.grey[50]),
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
                  Text("Confirm the OTP Code", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 45)),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: Get.height * 0.25,
                    decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey.shade200, width: 1), borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: new TextSpan(
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.5,
                              ),
                              children: <TextSpan>[
                                new TextSpan(text: "Enter the OTP code sent to ", style: TextStyle(color: Colors.black87)),
                                new TextSpan(
                                  text: _smsController.phoneNumber,
                                  style: TextStyle(color: Colors.blue),
                                )
                              ],
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
                              _smsController.otpCode = s;
                              if (s.length != 6)
                                canConfirmOtp.value = false;
                              else {
                                canConfirmOtp.value = true;
                                _smsController.otpCode = s;
                              }
                            },

                            cursorColor: Colors.purpleAccent,
                            keyboardType: TextInputType.number,
                            textStyle: TextStyle(fontSize: 18, color: Colors.black87),
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

                                        await controller.sendOTPForLogin(_smsController.phoneNumber);
                                      }
                                    : null,
                                child: Text(
                                  controller.timeBetweenResending == 0 ? "Resend" : "Resend after ${controller.timeBetweenResending} seconds",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: controller.timeBetweenResending == 0 ? Colors.black : Colors.grey.shade400, fontSize: 17.5, decoration: TextDecoration.underline),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Text(
                      "By continuing you will receive a verification code to your phone number by SMS. Rates may apply for messages and data.",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
                    ),
                  ),
                  Obx(() => TextButton(
                        onPressed: canConfirmOtp.value
                            ? () async {
                                print("${_smsController.phoneNumber} -------------- ${_smsController.otpCode} ");
                                bool res = await controller.signInUsingOTP(_smsController.phoneNumber, _smsController.otpCode);
                                // controller.resendOtpTimerActivate();

                                if (res) {
                                  Get.back(closeOverlays: true);
                                } else {
                                  mezcalmosSnackBar("Error", "OTP Code confirmation failed :(");
                                }
                              }
                            : null,
                        child: Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(Get.width, 50)),
                            alignment: Alignment.center,
                            backgroundColor: MaterialStateProperty.all(canConfirmOtp.value ? Colors.blue : Colors.grey)),
                      ))
                ],
              ),
            )));
  }
}
