import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

const mypadding = EdgeInsets.only(left: 15, right: 15);

class PhoneNumberScreen extends StatefulWidget {
  @override
  State<PhoneNumberScreen> createState() {
    return _PhoneNumberScreenState();
  }
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  LanguageController lang = Get.find<LanguageController>();
  AuthController controller = Get.find<AuthController>();

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

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // bottomNavigationBar: BottomAppBar(
      //   child: TextButton(
      //     child: Text('Click'),
      //     onPressed: () {},
      //   ),
      // ),
      appBar: AppBar(
        title: Text(
          'Sign in',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 5,
                ),
                Obx(
                  () => Container(
                    padding: const EdgeInsets.all(16),
                    child: Text(

                        ///****add ths to lan file */
                        lang.strings['shared']['login']["otpCode"],
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
                      lang.strings['shared']['login']["twilioNote"],
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 0,
            right: 0,
            child: SubmitButton(context),
          ),
        ],
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
              child: Text(lang.strings['shared']['login']["enterPhoneNumber"],
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
                                mezDbgPrint(canSendOtp.value);
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
                      autofocus: true,
                      onChanged: (s) {
                        if (_prefixTextFieldController.text.length > 0 &&
                            _numberTextFieldController.text.length >= 8) {
                          canSendOtp.value = true;
                        } else {
                          canSendOtp.value = false;
                        }
                        mezDbgPrint(canSendOtp.value);
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
                    mezDbgPrint(phone);
                    if (phone.isPhoneNumber) {
                      ServerResponse response =
                          await controller.sendOTPForLogin(phone);
                      mezDbgPrint("++++++++++++ response >>> $response");

                      if (response.success) {
                        MezSnackbar("Notice ~", "OTP Sent code to : $phone");
                        Get.toNamed(kOtpConfirmRoute, arguments: phone);
                      } else {
                        MezSnackbar(response.errorCode.toString(),
                            response.errorMessage.toString());
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
                  : Text(lang.strings['shared']['login']["submit"]),
            )),
      ),
    );
  }

  @override
  void dispose() {
    _prefixTextFieldController.dispose();
    _numberTextFieldController.dispose();
    super.dispose();
  }
}
