import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/WebApp/screens/AuthScreen/VerificationScreen/components/verificationScreenDesktop.dart';
import 'package:mezcalmos/WebApp/screens/AuthScreen/VerificationScreen/components/verificationScreenMobile.dart';
import 'package:mezcalmos/WebApp/screens/components/installAppBarComponent.dart';
import 'package:mezcalmos/WebApp/screens/components/webAppBarComponent.dart';
import 'package:mezcalmos/WebApp/services/values/constants.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezBottomBar.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezLoaderWidget.dart';
import 'package:mezcalmos/WebApp/webHelpers/setUpHelper.dart';

import 'package:qlevar_router/qlevar_router.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late String phone;

  TextEditingController _otpCodeTextController = TextEditingController();
  String otpCode = '';

  @override
  void initState() {
    phone = QR.params['phone'].toString();
    super.initState();
  }

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
                automaticallyGetBack: MezCalmosResizer.isMobile(context) ||
                        MezCalmosResizer.isSmallMobile(context)
                    ? false
                    : true,
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
                      return VerificationScreenMobile(
                        passedPhone: phone,
                      );
                    } else {
                      return VerificationScreenDesktop(passedPhone: phone);
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
