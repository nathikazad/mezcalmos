import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/WebApp/webHelpers/setUpHelper.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';

import 'package:qlevar_router/qlevar_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;
import 'package:sizer/sizer.dart';

const Color backGroundColor = Color.fromRGBO(225, 228, 255, 1);
const Color primaryColor = Color.fromRGBO(103, 121, 254, 1);

class InstallAppBarComponent extends StatefulWidget
    implements PreferredSizeWidget {
  InstallAppBarComponent({Key? key, this.automaticallyGetBack = true})
      : super(key: key);

  final bool? automaticallyGetBack;

  @override
  State<InstallAppBarComponent> createState() => _InstallAppBarComponentState();

  @override
  Size get preferredSize => Size(Get.width, kToolbarHeight);
}

class _InstallAppBarComponentState extends State<InstallAppBarComponent> {
  @override
  void initState() {
    putControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        child: _buildWidget(context, widget.automaticallyGetBack!),
      );
    });
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
Widget _buildWidget(BuildContext context, bool automaticallyGetBack) {
  dynamic _i18n() => Get.find<LanguageController>().strings["WebApp"]["screens"]
      ["components"]["InstallAppBarComponent"]["install"];
  //mezDbgPrint("this is a test ${_i18n()["title"].toString()} hhh");
  return Container(
    width: Get.width,
    height: kToolbarHeight,
    color: backGroundColor,
    padding: EdgeInsets.symmetric(
        horizontal: MezCalmosResizer.getWepPageHorizontalPadding(context)),
    child: Row(
      children: [
        if (automaticallyGetBack)
          Row(
            children: [
              _BackButtonAppBar(),
              SizedBox(
                width: Get.width * 0.05,
              ),
            ],
          ),
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
                child: Obx(
                  () => Text(
                    "${_i18n()["installBtn"]}",
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
        ),
        SizedBox(
          width: Get.width * 0.025,
        ),
        Expanded(
            child: Container(
          child: Obx(
            () => Text(
              "${_i18n()["title"]}",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      wordSpacing: (MezCalmosResizer.isMobile(context) ||
                              MezCalmosResizer.isSmallMobile(context))
                          ? 0
                          : 0.5,
                      letterSpacing: 0.25,
                      fontSize: getText2Size(context),
                      color: primaryColor,
                      fontWeight: FontWeight.w600)),
            ),
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

Widget _BackButtonAppBar() {
  return Transform.scale(
    scale: 1,
    child: InkWell(
      onTap: () {
        QR.back();
      },
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 0,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white),
        child: Icon(
          Icons.arrow_back_ios_new,
          color: primaryBlueColor,
        ),
      ),
    ),
  );
}
