import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ["AuthScreens"]["SMS"]["OtpConfirmationScreen"];

class OtpConfirmationScreen extends GetView<AuthController> {
  RxBool clickedSignInOtp = false.obs;
  RxInt _timeBetweenResending = 0.obs;
  RxBool canConfirmOtp = false.obs;
  // int get timeBetweenResending => _timeBetweenResending.value;
  void resendOtpTimerActivate(double time) {
    _timeBetweenResending.value = time.toInt();
    const second = const Duration(seconds: 1);
    Timer.periodic(
      second,
      (Timer __t) {
        print(
            "OTP Code resending available after ${_timeBetweenResending.value} Seconds !");
        if (_timeBetweenResending.value == 0)
          __t.cancel();
        else
          _timeBetweenResending.value--;
      },
    );
  }

  TextEditingController _otpCodeTextController = TextEditingController();

  String _phonePassed = Get.arguments;
  String otpCode = '';

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('${_i18n()["confirmation"]}'),
        ),
        bottomSheet: BottomSheet(
            enableDrag: false,
            backgroundColor: Colors.transparent,
            onClosing: () {},
            builder: (context) {
              return Obx(
                () => confirmButton(_phonePassed, otpCode, context),
              );
            }),
        body: SingleChildScrollView(
          reverse: true,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Obx(
                  () => Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(_i18n()["OtpConfirmation"],
                        overflow: TextOverflow.visible, style: txt.headline1),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                otpConfimCard(
                    txt, _phonePassed, context, _otpCodeTextController),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: Obx(
                    () => Text(
                      _i18n()["twilioNote"],
                      style: txt.bodyText2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget otpConfimCard(TextTheme txt, String _phonePassed, BuildContext context,
      TextEditingController _otpCodeTextController) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => RichText(
                text: new TextSpan(
                  style: txt.bodyText2,
                  children: <TextSpan>[
                    new TextSpan(
                        text: _i18n()["enterOtpCode"], style: txt.bodyText2),
                    new TextSpan(
                        text: "  ${Get.arguments ?? _phonePassed}",
                        style: txt.bodyText1!.copyWith(
                            color: Theme.of(context).primaryColorLight))
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
              inputFormatters: [
                FilteringTextInputFormatter(RegExp(r'\d'), allow: true)
              ],
              controller: _otpCodeTextController,
              //  enabled: canConfirmOtp.value ? false : true,
              enableActiveFill: true,
              appContext: context,
              hintCharacter: "#",
              length: 6,
              // backgroundColor: Colors.grey.shade200,
              onCompleted: (value) {
                canConfirmOtp.value = true;
                otpCode = value;
                mezDbgPrint(value);
              },
              onChanged: (s) {
                otpCode = s;
              },

              cursorColor: Colors.purpleAccent,
              keyboardType: TextInputType.number,
              textStyle: TextStyle(fontSize: 18.sp, color: Colors.black87),
              pinTheme: PinTheme(
                borderRadius: BorderRadius.circular(5),
                borderWidth: 0.0,
                // fieldHeight: Get.width * 0.13,
                // fieldWidth: Get.width * 0.13,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${_i18n()["otpDidnReceiveTxt"]}",
                  style: txt.bodyText2,
                ),
                Obx(
                  () => Flexible(
                    child: TextButton(
                        onPressed: _timeBetweenResending.value == 0
                            ? () async {
                                // resend code !
                                canConfirmOtp.value = false;
                                _otpCodeTextController.clear();
                                ServerResponse response =
                                    await controller.sendOTPForLogin(
                                        Get.arguments ?? _phonePassed);
                                mezDbgPrint(response.data);
                                if (!response.success) {
                                  resendOtpTimerActivate(
                                      response.data['secondsLeft']);
                                  MezSnackbar(response.status.toShortString(),
                                      response.errorMessage.toString(),
                                      position: SnackPosition.TOP);
                                }
                              }
                            : null,
                        style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.bodyText2,
                            backgroundColor: _timeBetweenResending.value == 0
                                ? Theme.of(context)
                                    .primaryColorLight
                                    .withOpacity(0.8)
                                : Colors.grey),
                        child: Text(
                          _timeBetweenResending.value == 0
                              ? _i18n()["resend"]
                              : "${_i18n()["resendAfter"]} ${_timeBetweenResending.value} ${_i18n()["seconds"]}",
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget confirmButton(
      String _phonePassed, String otpCode, BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(12),
      child: TextButton(
          onPressed: canConfirmOtp.value
              ? () async {
                  clickedSignInOtp.value = true;
                  mezDbgPrint(
                      "${Get.arguments ?? _phonePassed} -------------- $otpCode ");
                  ServerResponse? _resp = await controller.signInUsingOTP(
                      Get.arguments ?? _phonePassed, otpCode);
                  switch (_resp?.success) {
                    case null:
                      clickedSignInOtp.value = false;
                      break;

                    case false:
                      MezSnackbar("Oops ..",
                          _i18n()['wrongOTPCode']);
                      clickedSignInOtp.value = false;
                      break;
                  }
                }
              : null,
          style: TextButton.styleFrom(
              fixedSize: Size(double.infinity, 60),
              backgroundColor: canConfirmOtp.value && !clickedSignInOtp.value
                  ? Theme.of(context).primaryColorLight
                  : Colors.grey),
          child: Container(
            alignment: Alignment.center,
            child: (clickedSignInOtp.value)
                ? CircularProgressIndicator()
                : Text(_i18n()["confirm"]),
          )),
    );
  }
}
