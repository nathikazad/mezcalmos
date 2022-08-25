import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mez_services_web_app/services/widgets/mezCalmosResizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;
import 'package:sizer/sizer.dart';

const Color backGroundColor = Color.fromRGBO(225, 228, 255, 1);
const Color primaryColor = Color.fromRGBO(103, 121, 254, 1);

class InstallAppBarComponent extends StatefulWidget
    implements PreferredSizeWidget {
  InstallAppBarComponent({Key? key}) : super(key: key);

  @override
  State<InstallAppBarComponent> createState() => _InstallAppBarComponentState();

  @override
  Size get preferredSize => Size(Get.width, kToolbarHeight);
}

class _InstallAppBarComponentState extends State<InstallAppBarComponent> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        child: _buildWidget(context),
      );
    });
    // return Container(
    //   width: Get.width,
    //   height: kToolbarHeight,
    //   color: Color.fromRGBO(225, 228, 255, 1),
    //   padding: const EdgeInsets.symmetric(horizontal: 15),
    //   child: Row(
    //     children: [
    //       InkWell(
    //         onTap: () {
    //           _launchURL(context);
    //         },
    //         child: Container(
    //           height: 35,
    //           decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(39),
    //               color: Color.fromRGBO(103, 121, 254, 1)),
    //           child: Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 15),
    //             child: Center(
    //               child: Text(
    //                 "Install App",
    //                 style: TextStyle(
    //                     fontSize: 13,
    //                     color: Colors.white,
    //                     fontFamily: "Montserrat",
    //                     fontWeight: FontWeight.w700),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       SizedBox(
    //         width: Get.width * 0.1,
    //       ),
    //       Expanded(
    //           child: Container(
    //         child: Text(
    //           "Install the app \nto make orders online.",
    //           style: TextStyle(
    //               fontSize: 13,
    //               fontFamily: "Montserrat",
    //               color: Color.fromRGBO(103, 121, 254, 1),
    //               fontWeight: FontWeight.w600),
    //         ),
    //       ))
    //     ],
    //   ),
    // );
  }
}

EdgeInsetsGeometry buildButtonPadding(BuildContext context) {
  if (MezCalmosResizer.isDesktop(context)) {
    //Desktop
    return EdgeInsets.only(left: 25, right: 25, bottom: 2);
  } else if (MezCalmosResizer.isTablet(context)) {
    // tablet
    return EdgeInsets.symmetric(horizontal: 20);
  } else if (MezCalmosResizer.isMobile(context)) {
    // mobile
    return EdgeInsets.symmetric(horizontal: 15);
  } else {
    //small mobile
    return EdgeInsets.symmetric(horizontal: 10);
  }
}

double getTextSize(BuildContext context) {
  if (MezCalmosResizer.isDesktop(context)) {
    //Desktop
    return 15;
  } else if (MezCalmosResizer.isTablet(context)) {
    // tablet
    return 14;
  } else if (MezCalmosResizer.isMobile(context)) {
    // mobile
    return 13;
  } else {
    //small mobile
    return 12.5;
  }
}

double getText2Size(BuildContext context) {
  if (MezCalmosResizer.isDesktop(context)) {
    //Desktop
    return 18;
  } else if (MezCalmosResizer.isTablet(context)) {
    // tablet
    return 15;
  } else if (MezCalmosResizer.isMobile(context)) {
    // mobile
    return 14;
  } else {
    //small mobile
    return 13.5;
  }
}

// desktop Widget
Widget _buildWidget(BuildContext context) {
  return Container(
    width: Get.width,
    height: kToolbarHeight,
    color: backGroundColor,
    padding: EdgeInsets.symmetric(
        horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context)),
    child: Row(
      children: [
        InkWell(
          onTap: () {
            _launchURL(context);
          },
          child: Container(
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(39), color: primaryColor),
            child: Padding(
              padding: buildButtonPadding(context),
              child: Center(
                child: Text(
                  "Install App",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: getTextSize(context),
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: Get.width * 0.1,
        ),
        Expanded(
            child: Container(
          child: Text(
            "Install the app to make orders online.",
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: getText2Size(context),
                    color: primaryColor,
                    fontWeight: FontWeight.w600)),
          ),
        ))
      ],
    ),
  );
}

_launchURL(BuildContext context) async {
  if (Theme.of(context).platform == TargetPlatform.android) {
    await launchUrl(Uri.parse(
        "https://play.google.com/store/apps/details?id=com.mezcalmos.customer"));
  } else if (Theme.of(context).platform == TargetPlatform.iOS) {
    await launchUrl(
        Uri.parse("https://apps.apple.com/us/app/mezcalmos/id1595882320"));
  } else if (Theme.of(context).platform == TargetPlatform.macOS) {
    await launchUrl(
        Uri.parse("https://apps.apple.com/us/app/mezcalmos/id1595882320"));
  } else {
    await launchUrl(Uri.parse(
        "https://play.google.com/store/apps/details?id=com.mezcalmos.customer"));
  }
}
