import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';

import 'package:qlevar_router/qlevar_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:js' as js;
import 'dart:html' as html;

class UnfoundPageScreen extends StatefulWidget {
  UnfoundPageScreen({Key? key}) : super(key: key);

  @override
  State<UnfoundPageScreen> createState() => _UnfoundPageScreenState();
}

class _UnfoundPageScreenState extends State<UnfoundPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  bottomNavigationBar: MezBottomBar(),
        body: LayoutBuilder(builder: ((context, constraints) {
      // if (MezCalmosResizer.isMobile(context) ||
      //     MezCalmosResizer.isSmallDesktop(context)) {
      //   return UnfoundPageForMobile();
      // } else {
      //   return UnfoundPageForDisktop();
      // }
      return UnfoundPageFor();
    })));
  }
}

class UnfoundPageForDisktop extends StatelessWidget {
  const UnfoundPageForDisktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: Get.width * 0.3,
              child: FittedBox(
                child: Text(
                  "404",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(103, 121, 254, 1)),
                ),
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: Get.width * 0.3,
              child: FittedBox(
                child: Text(
                  "Sorry, page not found!",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(103, 121, 254, 1)),
                ),
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: Get.width * 0.3,
              child: FittedBox(
                child: Text(
                  "The page you are looking for may be temporarily\nunavailable or not found.",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(103, 121, 254, 1)),
                  textAlign: TextAlign.center,
                ),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Back to home",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.trending_flat,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(172, 89, 252, 1),
                      Color.fromRGBO(103, 121, 254, 1)
                    ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UnfoundPageFor extends StatelessWidget {
  const UnfoundPageFor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: getCurrentSize(context),
              child: FittedBox(
                child: Text(
                  "404",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(103, 121, 254, 1)),
                ),
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: getCurrentSize(context),
              child: FittedBox(
                child: Text(
                  "Sorry, page not found!",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(103, 121, 254, 1)),
                ),
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: getCurrentSize(context),
              child: FittedBox(
                child: Text(
                  "The page you are looking for may be temporarily\nunavailable or not found.",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(103, 121, 254, 1)),
                  textAlign: TextAlign.center,
                ),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: (() async {
                // js.context.callMethod(
                //     'open', ['https://www.mezcalmos.com/', '_self']);

                QR.to("/restaurants");
              }),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getTextSize(context) * 2,
                    vertical: getTextSize(context) / 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Back to home",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: getTextSize(context)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.trending_flat,
                      color: Colors.white,
                      size: getTextSize(context),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(172, 89, 252, 1),
                      Color.fromRGBO(103, 121, 254, 1)
                    ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double getTextSize(BuildContext context) {
  if (MezCalmosResizer.isDesktop(context)) {
    //Desktop
    return 20;
  } else if (MezCalmosResizer.isTablet(context)) {
    // tablet
    return 19;
  } else if (MezCalmosResizer.isMobile(context)) {
    // mobile
    return 16;
  } else {
    //small mobile
    return 15;
  }
}

double getCurrentSize(BuildContext context) {
  if (MezCalmosResizer.isDesktop(context)) {
    //Desktop
    return Get.width * 0.3;
  } else if (MezCalmosResizer.isTablet(context) ||
      MezCalmosResizer.isSmallTablet(context)) {
    // tablet
    return Get.width * 0.3;
  } else if (MezCalmosResizer.isMobile(context)) {
    // mobile
    return Get.width * 0.5;
  } else {
    //small mobile
    return Get.width * 0.5;
  }
}
