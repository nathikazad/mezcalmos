import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:url_launcher/url_launcher.dart';

class MezBottomBar extends StatefulWidget {
  const MezBottomBar({Key? key}) : super(key: key);

  @override
  State<MezBottomBar> createState() => _MezBottomBarState();
}

class _MezBottomBarState extends State<MezBottomBar> {
  @override
  void initState() {
    // ever(Get.find<LanguageController>().controllerHasInitialized, (bool val) {
    //   if (val) {
    //     /// do something
    //   } else {
    //     /// do something
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final lang = Get.find<LanguageController>();
    print("the current langauge is${lang.userLanguageKey}");
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context)),
      height: kToolbarHeight,
      color: Colors.black,
      width: Get.width,
      child: Container(
        child: Row(
          children: [
            InkWell(
              onTap: () {
                lang.changeLangForWeb(lang.userLanguageKey == LanguageType.EN
                    ? LanguageType.ES
                    : LanguageType.EN);
                var xPath = QR.currentPath;
                var str = xPath.split('?');
                QR.navigator.replaceAll(
                    "${str[0]}?lang=${(lang.userLanguageKey == LanguageType.EN) ? "en" : "es"}");
                mezDbgPrint(
                    "this is a test the current path is xPath $xPath ${lang.controllerHasInitialized}");
              },
              child: Obx(
                () => RichText(
                  text: TextSpan(
                    text: lang.userLanguageKey == LanguageType.EN
                        ? 'Language :'
                        : "Lenguaje :",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 15),
                    children: [
                      TextSpan(
                          text: lang.userLanguageKey == LanguageType.EN
                              ? " Español"
                              : ' English',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 15)),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () async {
                await launchUrl(Uri.parse(linkedInUrl));
              },
              icon: Container(
                height: 20,
                width: 20,
                child: Icon(Icons.home),
                // child: SvgPicture.asset(linkedInSvg,
                //     color: Colors.white, semanticsLabel: 'A red up arrow'),
              ),
            ),
            // IconButton(
            //   onPressed: () async {
            //     await launchUrl(Uri.parse(facbookUrl));
            //   },
            //   icon: Container(
            //     height: 20,
            //     width: 20,
            //     child: SvgPicture.asset(facebookSvg,
            //         color: Colors.white, semanticsLabel: 'A red up arrow'),
            //   ),
            // ),
            // IconButton(
            //   onPressed: () async {
            //     await launchUrl(Uri.parse(instagramUrl));
            //   },
            //   icon: Container(
            //     height: 20,
            //     width: 20,
            //     child: SvgPicture.asset(instagramSvg,
            //         color: Colors.white, semanticsLabel: 'A red up arrow'),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
