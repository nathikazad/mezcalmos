import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

String defaultPic =
    "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/logo%402x.png?alt=media&token=4a18a710-e267-40fd-8da7-8c12423cc56d";

Widget meddleWidgetUserProfile(
    {required bool isEditing,
    required TextEditingController controller,
    required GlobalKey<FormState> keyForm}) {
  final RegExp nameExp = new RegExp(r"^[a-z ,.'-]+$", caseSensitive: false);
  LanguageController lang = Get.find<LanguageController>();
  AuthController auth = Get.find<AuthController>();
  //this widget dispaly the user name when the isEditing var is ture
  // and if the isEditing var false show the user a
  // textField in which the user can write his name
  return Container(
    child: Column(
      children: [
        SizedBox(
          height: 50.sp,
        ),
        Container(
            child: !isEditing
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                            (auth.user?.name == null)
                                ? "User"
                                : "${auth.user!.name}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'psb',
                              fontSize: 35.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.sp,
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          lang.strings['shared']['userInfo']["fullName"],
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '${lang.strings['shared']['userInfo']['validationTxtOne']}';
                            } else {
                              if (!nameExp.hasMatch(value)) {
                                return '${lang.strings['shared']['userInfo']['validationTxtTwo']}';
                              }
                              // if (auth.fireAuthUser?.photoURL == defaultPic) {
                              //   return "select a user photo";
                              // }
                              return null;
                            }
                          },
                          controller: controller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                gapPadding: 0,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              hintText:
                                  "${lang.strings['shared']['userInfo']["hintTxt"]}",
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10)),
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )),
        SizedBox(
          height: 50.sp,
        ),
      ],
    ),
  );
}
