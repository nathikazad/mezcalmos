import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/routes/SimpleRouter.dart';

class PhoneNumberScreen extends GetView<AuthController> {
  TextEditingController _prefixTextFieldController = TextEditingController();
  TextEditingController _numberTextFieldController = TextEditingController();

  RxBool canSendOtp = false.obs;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar("back", () => Get.back(closeOverlays: true), bgColor: Colors.grey[50]),
      body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("OTP Code", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 45)),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Enter your phone number to receive the OTP code",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.5,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Row(
                        // direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextFormField(
                              onChanged: (s) {
                                if (_prefixTextFieldController.value.text.length > 0 && _numberTextFieldController.value.text.length >= 8) {
                                  canSendOtp.value = true;
                                } else
                                  canSendOtp.value = false;
                              },
                              autofocus: true,
                              maxLength: 3,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  hintText: "+",
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), gapPadding: 1, borderSide: BorderSide(color: Colors.blue)),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), gapPadding: 1)),
                              controller: _prefixTextFieldController,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 3,
                            child: TextFormField(
                              onChanged: (s) {
                                if (_prefixTextFieldController.text.length > 0 && _numberTextFieldController.text.length >= 8) {
                                  canSendOtp.value = true;
                                } else
                                  canSendOtp.value = false;
                              },
                              maxLength: 9,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "number",
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), gapPadding: 1, borderSide: BorderSide(color: Colors.purple)),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), gapPadding: 1)),
                              controller: _numberTextFieldController,
                            ),
                          ),
                        ],
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
                    onPressed: canSendOtp.value
                        ? () async {
                            String phone = "${_prefixTextFieldController.text}${_numberTextFieldController.text}";
                            if (!phone.startsWith('+')) phone = "+" + phone;
                            print(phone);
                            if (phone.isPhoneNumber) {
                              dynamic response = await controller.sendOTPForLogin(phone);
                              print("++++++++++++ response >>> $response");
                              if (response == null) {
                                mezcalmosSnackBar("Error", "Null response !");
                              } else if (response['status'] == "Success") {
                                mezcalmosSnackBar("Notice ~", "OTP Sent code to : $phone");
                                Get.toNamed(kOtpConfirmRoute, arguments: phone);
                              } else {
                                mezcalmosSnackBar('Error', response['errorMessage']);
                              }
                            } else
                              mezcalmosSnackBar("Error", "Invalid phone Number !");
                          }
                        : null,
                    child: Text(
                      "SEND",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(Get.width, 50)),
                        alignment: Alignment.center,
                        backgroundColor: MaterialStateProperty.all(canSendOtp.value ? Colors.blue : Colors.grey)),
                  ))
            ],
          )),
    );
  }
}
