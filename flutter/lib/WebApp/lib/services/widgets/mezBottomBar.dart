import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/models/Generic.dart';
import 'package:mez_services_web_app/services/widgets/mezCalmosResizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:url_launcher/url_launcher.dart';

class MezBottomBar extends StatefulWidget {
  const MezBottomBar({Key? key}) : super(key: key);

  @override
  State<MezBottomBar> createState() => _MezBottomBarState();
}

class _MezBottomBarState extends State<MezBottomBar> {
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
                print("this is a test the current path is xPath $xPath");
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
                await launchUrl(Uri.parse(
                    "https://www.linkedin.com/company/mezcalmos/about/"));
              },
              icon: Container(
                height: 20,
                width: 20,
                child: SvgPicture.asset("assets/images/linkedin.svg",
                    color: Colors.white, semanticsLabel: 'A red up arrow'),
              ),
            ),
            IconButton(
              onPressed: () async {
                await launchUrl(
                    Uri.parse("https://web.facebook.com/mezcalmos"));
              },
              icon: Container(
                height: 20,
                width: 20,
                child: SvgPicture.asset("assets/images/facebook-f.svg",
                    color: Colors.white, semanticsLabel: 'A red up arrow'),
              ),
            ),
            IconButton(
              onPressed: () async {
                await launchUrl(
                    Uri.parse("https://www.instagram.com/mezcalmos/"));
              },
              icon: Container(
                height: 20,
                width: 20,
                child: SvgPicture.asset("assets/images/instagram.svg",
                    color: Colors.white, semanticsLabel: 'A red up arrow'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
