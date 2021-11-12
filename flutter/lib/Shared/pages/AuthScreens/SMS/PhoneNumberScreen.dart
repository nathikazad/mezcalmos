import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const mypadding = EdgeInsets.only(left: 15, right: 15);

class PhoneNumberScreen extends GetView<AuthController> {
  LanguageController lang = Get.find<LanguageController>();

  TextEditingController _prefixTextFieldController = TextEditingController();
  TextEditingController _numberTextFieldController = TextEditingController();
  final phoneNumberFocusNode = FocusNode();

  RxBool canSendOtp = false.obs;
  RxBool clickedSendOtp = false.obs;

  Widget build(BuildContext context) {
    TextEditingController _otpCodeTextController = TextEditingController();
    RxBool canConfirmOtp = false.obs;
    String otpCode = "";
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _prefixTextFieldController..text = "+52";
    });
    responsiveSize(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,

      /// i rewrite the appbar to soleve the title size i thoutht the title shoud be static

      /// have the same the size to avoid flexign issuse

      // fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
      /// have the same the size to avoid flexing issuses
      appBar: mezcalmosAppBar("back", () {
        Get.back();
      }),
      // mezcalmosAppBar(
      //     "back", () => Get.back(closeOverlays: true),
      //     bgColor: Colors.grey[50]),
      body: Column(
        children: [
          Expanded(
            // height: Get.height * 0.90,
            // color: Colors.red,
            //  padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Obx(() => Container(
                      padding: mypadding,
                      child: Text(lang.strings['shared']['login']["otpCode"],
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 45.sp)),
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: mypadding,
                  child: Text(
                    ///****add ths to lan file */
                    lang.strings['shared']['login']["otpSubtitleNumber"],
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: mypadding,
                  //  height: Get.height * 0.30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200, width: 1),
                      borderRadius: BorderRadius.circular(8)),
                  //r  child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text(
                          lang.strings['shared']['login']["enterPhoneNumber"],
                          // "Enter Phone To Recieve OPT Code",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
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
                                    width: 0.5,
                                    color: Color.fromRGBO(236, 236, 236, 0)),
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            child: Container(
                              height: 49,
                              width: 91,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: TextFormField(
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

                              // child: TextFormField(

                              //   // maxLength: 4,
                              //   keyboardType: TextInputType.phone,
                              //   decoration: InputDecoration(
                              //       hintText: "+52", border: InputBorder.none
                              //       // focusedBorder: OutlineInputBorder(
                              //       //     borderRadius: BorderRadius.circular(5),
                              //       //     // gapPadding: 1,
                              //       //     borderSide:
                              //       //         BorderSide(color: Colors.blue)),
                              //       // border: OutlineInputBorder(
                              //       //     borderRadius: BorderRadius.circular(5),
                              //       //     gapPadding: 1)
                              //       ),
                              //   controller: _prefixTextFieldController,
                              // ),
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
                                    width: 0.5,
                                    color: Color.fromRGBO(236, 236, 236, 0)),
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              child: TextFormField(
                                autofocus: true,
                                onChanged: (s) {
                                  if (_prefixTextFieldController.text.length >
                                          0 &&
                                      _numberTextFieldController.text.length >=
                                          8) {
                                    canSendOtp.value = true;
                                  } else {
                                    canSendOtp.value = false;
                                  }
                                  mezDbgPrint(canSendOtp.value);
                                },
                                //maxLength: 10,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: "Enter number",
                                    // focusedBorder: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(5),
                                    //     gapPadding: 1,
                                    //     borderSide:
                                    //         BorderSide(color: Colors.purple)),
                                    // border: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(5),
                                    // gapPadding: 1)
                                    border: InputBorder.none),
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
                // SizedBox(
                //   height: 30,
                // ),
                // Container(
                //   padding: mypadding,
                //   child: Text(
                //     "Invalid OTP Code Error Message",
                //     style:
                //         TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                //   ),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                //////////////////////////////////////////////////////////////////////////////////

                Obx(
                  () => Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Text(
                      lang.strings['shared']['login']["twilioNote"],
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 11.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: Get.height * 0.10,
            child: Center(
              child: Obx(
                () => Container(
                  padding: mypadding,
                  child: MaterialButton(
                    elevation: 2,
                    padding: const EdgeInsets.all(0),
                    onPressed: canSendOtp.value && !clickedSendOtp.value
                        ? () async {
                            clickedSendOtp.value = true;
                            String phone =
                                "${_prefixTextFieldController.text}${_numberTextFieldController.text}";
                            if (!phone.startsWith('+')) phone = "+" + phone;
                            mezDbgPrint(phone);
                            if (phone.isPhoneNumber) {
                              dynamic response =
                                  await controller.sendOTPForLogin(phone);
                              mezDbgPrint(
                                  "++++++++++++ response >>> $response");
                              if (response == null) {
                                mezcalmosSnackBar("Error", "Null response !");
                              } else if (response['status'] == "Success") {
                                mezcalmosSnackBar(
                                    "Notice ~", "OTP Sent code to : $phone");
                                Get.toNamed(kOtpConfirmRoute, arguments: phone);
                              } else {
                                mezcalmosSnackBar(
                                    'Error', response['errorMessage']);
                              }
                            } else
                              mezcalmosSnackBar(
                                  "Error", "Invalid phone Number !");
                            clickedSendOtp.value = false;
                          }
                        : () => Get.toNamed(kOtpConfirmRoute,
                            arguments:
                                "${_prefixTextFieldController.text}${_numberTextFieldController.text}"),
                    child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(81, 132, 255, 1),
                                Color.fromRGBO(206, 73, 252, 1)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                        ),
                        child: Center(
                          child: Text(
                            lang.strings['shared']['login']["submit"],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700),
                          ),
                        )),
                  ),

                  // child: Obx(
                  //   () => clickedSendOtp.value
                  //       ? SizedBox(
                  //           height: 15,
                  //           width: 15,
                  //           child: CircularProgressIndicator(
                  //             color: Colors.white,
                  //             strokeWidth: 2,
                  //           ),
                  //         )
                  //       : Text(
                  //           lang.strings['shared']['login']["submit"],
                  //           style: TextStyle(
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.w600,
                  //               fontSize: 15),
                  //         ),
                  // ),
                  // style: ButtonStyle(
                  //     fixedSize:
                  //         MaterialStateProperty.all(Size(Get.width, 50)),
                  //     alignment: Alignment.center,
                  //     backgroundColor: MaterialStateProperty.all(
                  //         canSendOtp.value ? Colors.blue : Colors.grey)),
                ),
              ),
            ),
          ),
        ],
      ),

      //   ActionButtons(Icons.notifications_outlined, true),
      //   ActionButtons(Icons.history_outlined)
      // ],

      // mezcalmosAppBar(
      //     "back", () => Get.back(closeOverlays: true),
      //     bgColor: Colors.grey[50]),
    );
  }
}

//this will be responsible for buttons in the appbar
// class ActionButtons extends StatelessWidget {
//   final IconData icon;
//   // this boolen will show users if they got any notications or not
//   final bool hasNotif;
//   ActionButtons(this.icon, [this.hasNotif = false]);
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             //border: Border.all(color: Colors.black, width: 1),
//             color: Colors.grey[200]),
//         padding: const EdgeInsets.all(8),
//         margin: const EdgeInsets.only(right: 5, top: 10, bottom: 10),
//         child: Stack(
//           children: [
//             Icon(
//               icon,
//               size: 20,
//               color: Colors.purple[900],
//             ),
//             (hasNotif == false)
//                 ? Container()
//                 : Positioned(
//                     left: 11,
//                     top: 3.5,
//                     child: Container(
//                       height: 7,
//                       width: 7,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.red),
//                     ),
//                   ),
//           ],
//         ),
//       ),
//       onTap: () {
//         mezDbgPrint("this button clicked");
//       },
//     );
//   }
// }
