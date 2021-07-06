import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/routes/SimpleRouter.dart';

class SignIn extends GetWidget<AuthController> {
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

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
                child: MezcalmosSharedWidgets.logo(size: getSizeRelativeToScreen(80, sh, sw)),
              ),
              SizedBox(height: getSizeRelativeToScreen(25, sh, sw)),
              MezcalmosSharedWidgets.mezcalmos(textSize: getSizeRelativeToScreen(25, sh, sw), isBold: true),
              SizedBox(
                height: getSizeRelativeToScreen(20, sh, sw),
              ),
              Flexible(
                child: Text(
                  tConnectMessage,
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
                  child: TextButton(
                    onPressed: () async => lmode != "dev" ? await controller.signInWithFacebook() : await controller.signIn(tEmailTestValue, tEmailTestPassword), //controller.signInWithFacebook(),//
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Icon(Icons.facebook), Text(lmode != "dev" ? tFacebookSigning : "test mode login")],
                    ),

                    style: ButtonStyle(
                      // padding:  MaterialStateProperty.<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 10)),
                      textStyle: MaterialStateProperty.all<TextStyle>(new TextStyle(fontSize: getSizeRelativeToScreen(10, sh, sw), fontWeight: FontWeight.bold)),
                      fixedSize: MaterialStateProperty.all<Size>(new Size(getSizeRelativeToScreen(150, sh, sw), getSizeRelativeToScreen(25, sh, sw))),
                      elevation: MaterialStateProperty.all<double>(2),
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 58, 85, 159)),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  )),
              SizedBox(
                height: getSizeRelativeToScreen(5, sh, sw),
              ),
              Flexible(
                  fit: FlexFit.loose,
                  child: TextButton(
                    onPressed: () => Get.toNamed(kOtpRoute),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Icon(Icons.email_outlined), Text(tSmsSigning)],
                    ),
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all<TextStyle>(new TextStyle(fontSize: getSizeRelativeToScreen(10, sh, sw), fontWeight: FontWeight.bold)),
                      fixedSize: MaterialStateProperty.all<Size>(new Size(getSizeRelativeToScreen(150, sh, sw), getSizeRelativeToScreen(25, sh, sw))),
                      elevation: MaterialStateProperty.all<double>(2),
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 92, 127, 255)),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
