import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
import 'package:sizer/sizer.dart';

class WebSiteFotterWedgetComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(
          height: getSpaceOnTop(context),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal:
                  MezCalmosResizer.getWepPageHorizontalPadding(context)),
          color: Colors.black,
          // height: 200,
          width: Get.width,
          child: Column(
            children: [
              MezCalmosResizer.isMobile(context)
                  //for mobile
                  ? BuildWidgetForMobile(context)
                  :
                  // for tablet and desktop
                  BuildWidgetForTabletAndDesktop(context),
              SizedBox(
                height: getSpaceSize(context) / 2,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget BuildWidgetForMobile(BuildContext context) {
    return Container(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getSpaceSize(context) / 2,
          ),
          Container(
            width: Get.width,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FotterBottonsComponents(
                  text: "services",
                  func: () {},
                ),
                Spacer(),
                FotterBottonsComponents(
                  text: "Blog",
                  func: () {},
                ),
                Spacer(),
                FotterBottonsComponents(
                  text: "FAQ",
                  func: () {},
                ),
                Spacer(),
                FotterBottonsComponents(
                  text: "Contact us",
                  func: () {
                    // print("test ome");
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: getSpaceSize(context) / 3,
          ),
          BuildDivider(),
          SizedBox(
            height: getSpaceSize(context) / 3,
          ),
          BuildSocailMedaiIcons(context),
          SizedBox(
            height: getSpaceSize(context) / 2,
          ),
          BuidCopyRightText(context),
          SizedBox(
            height: getSpaceSize(context) / 3,
          ),
          BuildPrivacyAndPolicyText(context)
        ],
      ),
    );
  }

  Widget BuildWidgetForTabletAndDesktop(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getSpaceSize(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FotterBottonsComponents(
              text: "Our services",
              func: () {},
            ),
            FotterBottonsComponents(
              text: "Our vision",
              func: () {},
            ),
            FotterBottonsComponents(
              text: "For business",
              func: () {},
            ),
            FotterBottonsComponents(
              text: "Blog",
              func: () {},
            ),
            FotterBottonsComponents(
              text: "FAQ",
              func: () {},
            ),
            FotterBottonsComponents(
              text: "Contact us",
              func: () {
                // print("test ome");
              },
            )
          ],
        ),
        SizedBox(
          height: getSpaceSize(context),
        ),
        BuildDivider(),
        SizedBox(
          height: getSpaceSize(context) / 2,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            BuidCopyRightText(context),
            Spacer(),
            BuildPrivacyAndPolicyText(context),
            Spacer(),
            BuildSocailMedaiIcons(context)
          ],
        ),
      ],
    );
  }

  Widget BuidCopyRightText(BuildContext context) {
    return Text(
      "© Mezcalmos ${DateTime.now().year}, All right reserved",
      style: TextStyle(color: Colors.white, fontSize: getSizeForText(context)),
    );
  }

  Widget BuildDivider() {
    return Divider(
      thickness: 0.5,
      color: Colors.white,
    );
  }

  Widget BuildSocailMedaiIcons(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.linkedinIn,
              size: getIconSize(context),
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.facebookF,
              size: getIconSize(context),
              color: Colors.white,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.instagram,
                size: getIconSize(context),
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  Widget BuildPrivacyAndPolicyText(BuildContext context) {
    return Text(
      "Privacy policy",
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: getSizeForText(context)),
    );
  }

  double getSpaceOnTop(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 15.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 14.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 25.sp;
    } else {
      return 0;
    }
  }

  double getSpaceSize(context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 7.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 8.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 15.sp;
    } else {
      return 0;
    }
  }

  double getIconSize(context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 5.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 7.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 11.sp;
    } else {
      return 0;
    }
  }

  double getSizeForText(context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 3.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 7.sp;
    } else {
      return 0;
    }
  }
}

class FotterBottonsComponents extends StatelessWidget {
  FotterBottonsComponents({Key? key, required this.text, required this.func})
      : super(key: key);
  final String text;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: func(),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith((states) {
          return TextStyle(
              fontFamily: "Montserrat",
              fontSize: getSizeForText(context),
              fontWeight: FontWeight.w600,
              color: Colors.white);
        }),
      ),
    );
  }

  double getSizeForText(context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 3.5.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 7.sp;
    } else {
      return 0;
    }
  }
}
