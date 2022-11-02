import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/WebApp/screens/AuthScreen/SignInScreen/componenets/signInScreenDesktop.dart';
import 'package:mezcalmos/WebApp/screens/AuthScreen/SignInScreen/componenets/signInScreenMobile.dart';
import 'package:mezcalmos/WebApp/screens/components/installAppBarComponent.dart';
import 'package:mezcalmos/WebApp/screens/components/webAppBarComponent.dart';
import 'package:mezcalmos/WebApp/widgets/mezBottomBar.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/widgets/mezLoaderWidget.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/webHelpers/setUpHelper.dart';

import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return FutureBuilder<bool>(
        future: setupFirebase(
          launchMode: typeMode.toLaunchMode(),
        ),
        builder: (context, snapShot) {
          if (snapShot.hasData && snapShot.data == true) {
            final LanguageController Lcontroller =
                Get.find<LanguageController>();

            var xLang = QR.params["lang"].toString().contains("es")
                ? LanguageType.ES
                : LanguageType.EN;
            print("xLang is now ${xLang}");
            if (mounted) {
              Future.delayed(Duration(seconds: 1)).then((value) {
                Lcontroller.changeLangForWeb(xLang);
              });
            }

            return Scaffold(
              appBar: InstallAppBarComponent(
                automaticallyGetBack: true,
              ),
              bottomNavigationBar: const MezBottomBar(),
              body: Scaffold(
                appBar: (MezCalmosResizer.isMobile(context) ||
                        MezCalmosResizer.isSmallMobile(context))
                    ? null
                    : WebAppBarComponent(
                        type: WebAppBarType.Normal,
                      ),
                body: LayoutBuilder(
                  builder: (context, constarints) {
                    if (MezCalmosResizer.isMobile(context) ||
                        MezCalmosResizer.isSmallMobile(context)) {
                      return SigninScreenMobile();
                    } else {
                      return SigninScreenDesktop();
                    }
                  },
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(child: MezLoaderWidget()),
            );
          }
        });
    // return Scaffold(
    //   body: Center(child: Text("this is the sign in sceen")),
    // );
  }
}
