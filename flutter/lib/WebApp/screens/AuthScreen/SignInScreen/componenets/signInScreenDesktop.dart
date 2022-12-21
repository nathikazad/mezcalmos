import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/WebApp/routes/AuthRoutes.dart';
import 'package:mezcalmos/WebApp/screens/AuthScreen/components/MezButtonWidget.dart';
import 'package:mezcalmos/WebApp/widgets/MezSnackbar.dart';

import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ["AuthScreens"]["SMS"]["PhoneNumberScreen"];

class SigninScreenDesktop extends StatefulWidget {
  const SigninScreenDesktop({Key? key}) : super(key: key);

  @override
  State<SigninScreenDesktop> createState() => _SigninScreenDesktopState();
}

class _SigninScreenDesktopState extends State<SigninScreenDesktop> {
  FirbaseAuthController controller = Get.find<FirbaseAuthController>();
  final TextEditingController _prefixTextFieldController =
      TextEditingController();
  final TextEditingController _numberTextFieldController =
      TextEditingController();

  RxBool canSendOtp = false.obs;
  RxBool clickedSendOtp = false.obs;
  RxBool hasError = false.obs;
  @override
  void initState() {
    _prefixTextFieldController..text = "+52";

    super.initState();
  }

  @override
  void dispose() {
    _prefixTextFieldController.dispose();
    _numberTextFieldController.dispose();

    super.dispose();
  }

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
            "Log in to keep in touch with us.",
            style: txt.bodyText1!.copyWith(
                fontSize: 8.5.sp,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 5.sp,
          ),
          Container(
            width: 130.sp,
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 25.sp,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(237, 237, 237, 0.6),
                          borderRadius: BorderRadius.circular(4)),
                      child: Theme(
                        data: ThemeData(),
                        child: TextField(
                          controller: _prefixTextFieldController,
                          keyboardType: TextInputType.phone,
                          onChanged: (s) {
                            if (_prefixTextFieldController.value.text.length >
                                    0 &&
                                _numberTextFieldController.value.text.length >=
                                    8) {
                              canSendOtp.value = true;
                            } else {
                              canSendOtp.value = false;
                            }
                            print(canSendOtp.value);
                          },
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            //labelStyle: TextStyle(fontSize: 105),
                            contentPadding: EdgeInsets.symmetric(vertical: 25),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    Expanded(
                      child: Container(
                        // width: 100.sp,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(237, 237, 237, 0.6),
                            borderRadius: BorderRadius.circular(4)),
                        child: Theme(
                          data: ThemeData(),
                          child: TextField(
                            controller: _numberTextFieldController,
                            autofocus: false,
                            onChanged: (s) {
                              if (_prefixTextFieldController.text.length > 0 &&
                                  _numberTextFieldController.text.length >= 8) {
                                canSendOtp.value = true;
                              } else {
                                canSendOtp.value = false;
                              }
                              print(canSendOtp.value);
                            },
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              hintText:
                                  "Enter your phone number to receive OTP code",
                              hintStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Color.fromRGBO(196, 196, 196, 1)),
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              //labelStyle: TextStyle(fontSize: 105),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 15),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Obx(
                  () => Visibility(
                    visible: hasError.value,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.warning_amber_outlined,
                            color: Colors.red,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "This phone number is invalid",
                            style: txt.bodyText1!.copyWith(
                                fontSize: 15,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w400,
                                color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Container(
                    width: Get.width,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: canSendOtp.value && !clickedSendOtp.value
                          ? const LinearGradient(
                              colors: <Color>[
                                Color.fromRGBO(103, 121, 254, 1),
                                Color.fromRGBO(172, 89, 252, 1),
                              ],
                            )
                          : LinearGradient(
                              colors: <Color>[
                                Colors.grey,
                                Colors.grey,
                              ],
                            ),
                    ),
                    child: MezButton(
                        btnMargin: const EdgeInsets.all(0),
                        backColor: Colors.transparent,
                        borderColor: Colors.transparent,
                        content: (clickedSendOtp.value)
                            ? CircularProgressIndicator()
                            : Text(
                                _i18n()["submit"],
                                style: TextStyle(color: Colors.white),
                              ),
                        onPress: canSendOtp.value && !clickedSendOtp.value
                            ? () async {
                                clickedSendOtp.value = true;
                                String phone =
                                    "${_prefixTextFieldController.text}${_numberTextFieldController.text}";
                                if (!phone.startsWith('+')) phone = "+" + phone;
                                print(phone);
                                if (phone.isPhoneNumber) {
                                  ServerResponse response =
                                      await controller.sendOTPForLogin(phone);
                                  print("++++++++++++ response >>> $response");
                                  String xParams =
                                      QR.currentPath.split("?").last;
                                  mezDbgPrint(" xParams $xParams");

                                  if (response.success) {
                                    // change this and make it as native snackbar
                                    hasError.value = false;
                                    MezSnackbarForWeb("Notice ~",
                                        "OTP Sent code to : $phone", context);
                                    // change this route to QR route for confirmation

                                    QR.to("signIn/" +
                                        AuthRoutes.verificationScreen +
                                        "?phone=$phone&$xParams");
                                    // Get.toNamed(kOtpConfirmRoute, arguments: phone);
                                  } else {
                                    MezSnackbarForWeb(
                                        response.errorCode.toString(),
                                        response.errorMessage.toString(),
                                        context);
                                  }
                                } else
                                  MezSnackbarForWeb("Error",
                                      "Invalid phone Number !", context);
                                hasError.value = true;
                                clickedSendOtp.value = false;
                              }
                            : null),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    "By continuing, you will receive a verification code to your phone number by SMS. Message and data rates may apply.",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(120, 120, 120, 1),
                        fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
