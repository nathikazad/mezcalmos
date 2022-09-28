import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

dynamic lang() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ["SomethingWentWrongScreen"];

String getUserPhoneOrEmail() {
  final User? u = Get.find<AuthController>().fireAuthUser;
  if (u?.email != null) {
    return "${u!.email!}";
  } else if (u?.phoneNumber != null)
    return "${u!.phoneNumber!}";
  else
    return "${u!.uid}";
}

class SomethingWentWrongScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: mezcalmosAppBar(
          AppBarLeftButtonType.Lang,
        ),
        body: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 2,
              child: Image.asset(
                a404,
                fit: BoxFit.contain,
              ),
            ),
            Flexible(
              //bottom: 100,
              // left: MediaQuery.of(context).size.width * 0.3,
              // right: MediaQuery.of(context).size.width * 0.3,
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        lang()['noRestaurantFoundOnOperator'] +
                            " (${getUserPhoneOrEmail()}).",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        lang()['pleaseContactAdmin'] + ": +2126899034",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
