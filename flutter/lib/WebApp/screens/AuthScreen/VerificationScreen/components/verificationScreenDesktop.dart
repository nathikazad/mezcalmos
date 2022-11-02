import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/WebApp/controllers/authWebController.dart';
import 'package:mezcalmos/WebApp/screens/AuthScreen/components/MezButtonWidget.dart';
import 'package:mezcalmos/WebApp/widgets/MezSnackbar.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/src/services/text_formatter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ["AuthScreens"]["SMS"]["OtpConfirmationScreen"];

class VerificationScreenDesktop extends StatefulWidget {
  VerificationScreenDesktop({Key? key, required this.passedPhone})
      : super(key: key);

  final String passedPhone;

  @override
  State<VerificationScreenDesktop> createState() =>
      _VerificationScreenDesktopState();
}

class _VerificationScreenDesktopState extends State<VerificationScreenDesktop> {
  RxBool clickedSignInOtp = false.obs;
  RxInt _timeBetweenResending = 0.obs;
  RxBool canConfirmOtp = false.obs;

  void resendOtpTimerActivate(double time) {
    _timeBetweenResending.value = time.toInt();
    const Duration second = Duration(seconds: 1);
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
  AuthController controller = Get.find<AuthController>();
  String otpCode = '';

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
        height: Get.height - (kToolbarHeight * 3),
        width: Get.width,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "OTP Code Confirmation",
                style: txt.bodyText1!.copyWith(
                    fontSize: getTitleSize(context),
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: getHeightSize(context) / 2,
              ),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: getSubtitleSize(context),
                      color: Color.fromRGBO(38, 50, 56, 1)),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Enter OTP code sent to ",
                    ),
                    TextSpan(
                      text: "+${widget.passedPhone}",
                      style: TextStyle(
                        color: Color.fromRGBO(103, 121, 254, 1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Container(
                width: getWidthOfContainer(context),
                child: Column(
                  children: [
                    FittedBox(
                      child: Container(
                        width: getWidthOfContainer(context),
                        child: PinCodeTextField(
                          onTap: () {
                            canConfirmOtp.value = false;
                            _otpCodeTextController.clear();
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter(RegExp(r'\d'),
                                allow: true)
                          ],
                          controller: _otpCodeTextController,
                          enabled: canConfirmOtp.value ? false : true,
                          enableActiveFill: true,
                          appContext: context,
                          hintCharacter: "#",
                          length: 6,

                          // backgroundColor: Colors.grey.shade200,
                          onCompleted: (String value) {
                            canConfirmOtp.value = true;
                            otpCode = value;
                            print(value);
                          },
                          onChanged: (String s) {
                            otpCode = s;
                          },

                          cursorColor: Colors.purpleAccent,
                          keyboardType: TextInputType.number,
                          textStyle: TextStyle(
                              fontSize: getSubtitleSize(context),
                              color: Colors.black87),
                          pinTheme: PinTheme(
                            borderRadius: BorderRadius.circular(5),
                            borderWidth: 0.0,
                            fieldHeight: getWidthAndHeightOfTextPen(context),
                            fieldWidth: getWidthAndHeightOfTextPen(context),
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
                      ),
                    ),
                    SizedBox(
                      height: getHeightSize(context),
                    ),
                    Container(
                      width: getWidthOfContainer(context),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "You haven't receive the text?",
                            style: GoogleFonts.montserrat(
                                fontSize: getSubtitleSize(context),
                                fontWeight: FontWeight.w500),
                          ),
                          Expanded(
                              child: Obx(
                            () => MezButton(
                              backColor: _timeBetweenResending.value == 0
                                  ? const Color.fromRGBO(103, 121, 254, 1)
                                  : Colors.grey,
                              content: Container(
                                  alignment: Alignment.center,
                                  height: getHeightOfButton(context),
                                  child: Text(
                                    _timeBetweenResending.value == 0
                                        ? _i18n()["resend"]
                                        : "${_i18n()["resendAfter"]} ${_timeBetweenResending.value} ${_i18n()["seconds"]}",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  )),
                              onPress: _timeBetweenResending.value == 0
                                  ? () async {
                                      // resend code !
                                      canConfirmOtp.value = false;
                                      _otpCodeTextController.clear();
                                      final ServerResponse response =
                                          await controller.sendOTPForLogin(
                                              widget.passedPhone);
                                      print(response.data);
                                      setState(() {});
                                      if (!response.success) {
                                        resendOtpTimerActivate(
                                            response.data['secondsLeft']);
                                        MezSnackbarForWeb(
                                            response.status.toShortString(),
                                            response.errorMessage.toString(),
                                            context);
                                      }
                                    }
                                  : () {
                                      print("this is another test");
                                    },
                            ),
                          ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getHeightSize(context),
                    ),
                    Divider(),
                    SizedBox(
                      height: getHeightSize(context),
                    ),
                    Container(
                        width: Get.width,
                        height: getHeightOfButton(context) * 1.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient:
                                // canSendOtp.value &&
                                //         !clickedSendOtp.value
                                //     ?
                                const LinearGradient(
                              colors: <Color>[
                                Color.fromRGBO(103, 121, 254, 1),
                                Color.fromRGBO(172, 89, 252, 1),
                              ],
                            )
                            // : LinearGradient(
                            //     colors: <Color>[
                            //       Colors.grey,
                            //       Colors.grey,
                            //     ],
                            //   ),
                            ),
                        child: Obx(
                          () => MezButton(
                            btnMargin: const EdgeInsets.all(0),
                            backColor: Colors.transparent,
                            borderColor: Colors.transparent,
                            content: Text(
                              "Confirm",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPress: canConfirmOtp.value
                                ? () async {
                                    clickedSignInOtp.value = true;
                                    print(
                                        "${Get.arguments ?? widget.passedPhone} -------------- $otpCode ");
                                    final ServerResponse? _resp =
                                        await controller.signInUsingOTP(
                                            Get.arguments ??
                                                "+" + widget.passedPhone,
                                            otpCode);
                                    switch (_resp?.success) {
                                      case null:
                                        clickedSignInOtp.value = false;
                                        break;

                                      case false:
                                        MezSnackbarForWeb("Oops ..",
                                            _i18n()['wrongOTPCode'], context);

                                        clickedSignInOtp.value = false;
                                        break;
                                    }
                                  }
                                : null,
                          ),
                        ))
                  ],
                ),
              )
            ]));
  }
}

double getTitleSize(BuildContext context) {
  if (MezCalmosResizer.isDesktop(context)) {
    return 8.5.sp;
  } else {
    return 10.sp;
  }
}

double getSubtitleSize(BuildContext context) {
  if (MezCalmosResizer.isDesktop(context)) {
    return 4.sp;
  } else {
    return 7.sp;
  }
}

double getWidthAndHeightOfTextPen(BuildContext context) {
  if (MezCalmosResizer.isDesktop(context)) {
    return 15.sp;
  } else {
    return 17.sp;
  }
}

double getWidthOfContainer(BuildContext context) {
  if (MezCalmosResizer.isDesktop(context)) {
    return 130.sp;
  } else {
    return 150.sp;
  }
}

double getHeightSize(BuildContext context) {
  if (MezCalmosResizer.isDesktop(context)) {
    return 5.sp;
  } else {
    return 8.sp;
  }
}

double getHeightOfButton(BuildContext context) {
  if (MezCalmosResizer.isDesktop(context)) {
    return 8.sp;
  } else {
    return 11.sp;
  }
}
