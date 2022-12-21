import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/WebApp/routes/AuthRoutes.dart';
import 'package:mezcalmos/WebApp/widgets/MezSnackbar.dart';

import 'package:qlevar_router/qlevar_router.dart';

const mypadding = EdgeInsets.only(left: 15, right: 15);

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ["AuthScreens"]["SMS"]["PhoneNumberScreen"];

class SigninScreenMobile extends StatefulWidget {
  @override
  State<SigninScreenMobile> createState() {
    return _SigninScreenMobileState();
  }
}

class _SigninScreenMobileState extends State<SigninScreenMobile> {
  FirbaseAuthController controller = Get.find<FirbaseAuthController>();

  TextEditingController _prefixTextFieldController = TextEditingController();
  TextEditingController _numberTextFieldController = TextEditingController();
  // final phoneNumberFocusNode = FocusNode();

  RxBool canSendOtp = false.obs;
  RxBool clickedSendOtp = false.obs;

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

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Sign in',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      bottomSheet: BottomSheet(
          enableDrag: false,
          backgroundColor: Colors.transparent,
          onClosing: () {},
          builder: (context) {
            return SubmitButton(context);
          }),
      // bottomSheet: Theme(
      //     data: Theme.of(context).copyWith(

      //         bottomSheetTheme: BottomSheetThemeData(
      //             backgroundColor: Colors.red,
      //             modalBackgroundColor: Colors.red),
      //         backgroundColor: Colors.transparent,
      //         scaffoldBackgroundColor: Colors.transparent,
      //         canvasColor: Colors.transparent),
      //     child: SubmitButton(context)),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 5,
            ),
            Obx(
              () => Container(
                padding: const EdgeInsets.all(10),
                child: Text(

                    ///****add ths to lan file */
                    _i18n()["otpCode"],
                    style: Theme.of(context).textTheme.headline1),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            NumberInputCard(context),
            Obx(
              () => Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Text(
                  _i18n()["twilioNote"],
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card NumberInputCard(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Text(_i18n()["enterPhoneNumber"],
                  // "Enter Phone To Recieve OPT Code",
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              // direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 0.5, color: Color.fromRGBO(236, 236, 236, 0)),
                      color: Theme.of(context).scaffoldBackgroundColor),
                  child: Container(
                    height: 49,
                    width: 91,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                              autofocus: false,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                              onChanged: (s) {
                                if (_prefixTextFieldController
                                            .value.text.length >
                                        0 &&
                                    _numberTextFieldController
                                            .value.text.length >=
                                        8) {
                                  canSendOtp.value = true;
                                } else {
                                  canSendOtp.value = false;
                                }
                                print(canSendOtp.value);
                              },
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "+52",
                                border: InputBorder.none,
                              ),
                              controller: _prefixTextFieldController,
                              keyboardType: TextInputType.phone),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  flex: 100,
                  child: Container(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 0.5, color: Color.fromRGBO(236, 236, 236, 0)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: TextFormField(
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
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
                      decoration: InputDecoration(
                          hintText: "Enter number", border: InputBorder.none),
                      controller: _numberTextFieldController,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        // ),
      ),
    );
  }

  Widget SubmitButton(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.all(12),
        child: TextButton(
            onPressed: canSendOtp.value && !clickedSendOtp.value
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
                      String xParams = QR.currentPath.split("?").last;
                      mezDbgPrint(" xParams $xParams");

                      if (response.success) {
                        // change this and make it as native snackbar
                        MezSnackbarForWeb(
                            "Notice ~", "OTP Sent code to : $phone", context);
                        // change this route to QR route for confirmation
                        QR.to("signIn/" +
                            AuthRoutes.verificationScreen +
                            "?phone=$phone&$xParams");
                        // Get.toNamed(kOtpConfirmRoute, arguments: phone);
                      } else {
                        MezSnackbarForWeb(response.errorCode.toString(),
                            response.errorMessage.toString(), context);
                      }
                    } else
                      MezSnackbar("Error", "Invalid phone Number !");
                    clickedSendOtp.value = false;
                  }
                : null,
            style: TextButton.styleFrom(
                fixedSize: Size(double.infinity, 60),
                backgroundColor: canSendOtp.value && !clickedSendOtp.value
                    ? Theme.of(context).primaryColorLight
                    : Colors.grey),
            child: Container(
              alignment: Alignment.center,
              child: (clickedSendOtp.value)
                  ? CircularProgressIndicator()
                  : Text(_i18n()["submit"]),
            )),
      ),
    );
  }
}
