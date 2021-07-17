import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/routes/SimpleRouter.dart';

class SignIn extends GetWidget<AuthController> {
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  LanguageController lang = Get.find<LanguageController>();
  RxBool clickedLogin = false.obs;

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    final lmode = GetStorage().read("lmod");

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.ltr,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: MezcalmosSharedWidgets.logo(
                    size: getSizeRelativeToScreen(80, sh, sw)),
              ),
              SizedBox(height: getSizeRelativeToScreen(25, sh, sw)),
              MezcalmosSharedWidgets.mezcalmos(
                  textSize: getSizeRelativeToScreen(25, sh, sw), isBold: true),
              SizedBox(
                height: getSizeRelativeToScreen(20, sh, sw),
              ),
              Flexible(
                child: Text(
                  lang.strings['shared']['login']["title"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getSizeRelativeToScreen(18, sh, sw),
                  ),
                ),
              ),
              SizedBox(
                height: getSizeRelativeToScreen(20, sh, sw),
              ),
              Flexible(
                  fit: FlexFit.loose,
                  child: Obx(
                    () => TextButton(
                      onPressed: clickedLogin.value
                          ? null
                          : () async {
                              clickedLogin.value = true;
                              lmode != "dev"
                                  ? await controller.signInWithFacebook()
                                  : await controller.signIn(
                                      tEmailTestValue, tEmailTestPassword);
                              clickedLogin.value = false;
                            },
                      child: clickedLogin.value
                          ? Center(
                              child: SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.facebook),
                                Text(lmode != "dev"
                                    ? lang.strings['shared']['login']["fbBtn"]
                                    : "test mode login")
                              ],
                            ),
                      style: ButtonStyle(
                        // padding:  MaterialStateProperty.<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 10)),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                            new TextStyle(
                                fontSize: getSizeRelativeToScreen(10, sh, sw),
                                fontWeight: FontWeight.bold)),
                        fixedSize: MaterialStateProperty.all<Size>(new Size(
                            getSizeRelativeToScreen(150, sh, sw),
                            getSizeRelativeToScreen(25, sh, sw))),
                        elevation: MaterialStateProperty.all<double>(2),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 58, 85, 159)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                  )),
              SizedBox(
                height: getSizeRelativeToScreen(5, sh, sw),
              ),
              Flexible(
                  fit: FlexFit.loose,
                  child: Obx(
                    () => TextButton(
                      onPressed: clickedLogin.value
                          ? null
                          : () => Get.toNamed(kOtpRoute),
                      child: clickedLogin.value
                          ? Center(
                              child: SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.email_outlined),
                                Text(lang.strings['shared']['login']
                                    ["loginWithSms"])
                              ],
                            ),
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all<TextStyle>(
                            new TextStyle(
                                fontSize: getSizeRelativeToScreen(10, sh, sw),
                                fontWeight: FontWeight.bold)),
                        fixedSize: MaterialStateProperty.all<Size>(new Size(
                            getSizeRelativeToScreen(150, sh, sw),
                            getSizeRelativeToScreen(25, sh, sw))),
                        elevation: MaterialStateProperty.all<double>(2),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 92, 127, 255)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
