import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class WebSiteFotterWedgetComponent extends StatelessWidget {
  WebSiteFotterWedgetComponent({required this.controller});
  final AutoScrollController controller;
  final LanguageController langController = Get.find<LanguageController>();
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
              (MezCalmosResizer.isMobile(context) ||
                      MezCalmosResizer.isSmallMobile(context))
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

  Future _scrollToCounter(AutoScrollController controller, int index) async {
    await controller.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    controller.highlight(index);
  }

  Widget BuildWidgetForMobile(BuildContext context) {
    return Container(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            width: Get.width,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Obx(
                  () => FotterBottonsComponents(
                    text:
                        "${langController.strings["WebApp"]["fotterBar"]["mobile"]["services"]}",
                    func: () {
                      _scrollToCounter(controller, 0);
                    },
                  ),
                ),
                Spacer(),
                Obx(
                  () => FotterBottonsComponents(
                    text:
                        "${langController.strings["WebApp"]["fotterBar"]["mobile"]["blog"]}",
                    func: () {
                      _scrollToCounter(controller, 2);
                    },
                  ),
                ),
                Spacer(),
                Obx(
                  () => FotterBottonsComponents(
                    text:
                        "${langController.strings["WebApp"]["fotterBar"]["mobile"]["fAQ"]}",
                    func: () {
                      _scrollToCounter(controller, 1);
                    },
                  ),
                ),
                Spacer(),
                Obx(
                  () => FotterBottonsComponents(
                    text:
                        "${langController.strings["WebApp"]["fotterBar"]["mobile"]["contactUs"]}",
                    func: () {
                      _scrollToCounter(controller, 3);
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          BuildDivider(),
          SizedBox(height: 10),
          BuildSocailMedaiIcons(context),
          SizedBox(
            height: 5,
          ),
          BuidCopyRightText(context),
          SizedBox(
            height: 5,
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
            Obx(
              () => FotterBottonsComponents(
                text:
                    "${langController.strings["WebApp"]["fotterBar"]["desktopAndTablet"]["services"]}",
                func: () {
                  _scrollToCounter(controller, 0);
                },
              ),
            ),
            Obx(
              () => FotterBottonsComponents(
                text:
                    "${langController.strings["WebApp"]["fotterBar"]["desktopAndTablet"]["vision"]}",
                func: () {},
              ),
            ),
            Obx(
              () => FotterBottonsComponents(
                text:
                    "${langController.strings["WebApp"]["fotterBar"]["desktopAndTablet"]["business"]}",
                func: () {
                  print("test 3");
                },
              ),
            ),
            Obx(
              () => FotterBottonsComponents(
                text:
                    "${langController.strings["WebApp"]["fotterBar"]["desktopAndTablet"]["blog"]}",
                func: () {
                  _scrollToCounter(controller, 2);
                },
              ),
            ),
            Obx(
              () => FotterBottonsComponents(
                text:
                    "${langController.strings["WebApp"]["fotterBar"]["desktopAndTablet"]["fAQ"]}",
                func: () {
                  _scrollToCounter(controller, 1);
                },
              ),
            ),
            Obx(
              () => FotterBottonsComponents(
                text:
                    "${langController.strings["WebApp"]["fotterBar"]["desktopAndTablet"]["contactUs"]}",
                func: () {
                  _scrollToCounter(controller, 3);
                },
              ),
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
    return Obx(
      () => Text(
        "© Mezcalmos ${DateTime.now().year}, ${langController.strings["WebApp"]["fotterBar"]["allRightReserved"]}",
        style:
            TextStyle(color: Colors.white, fontSize: getSizeForText(context)),
      ),
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
    return Obx(
      () => InkWell(
        onTap: () async {
          await launchUrl(Uri.parse("https://mezweb.web.app/privacy-policies"));
        },
        child: Text(
          "${langController.strings["WebApp"]["fotterBar"]["policy"]}",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: getSizeForText(context)),
        ),
      ),
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
      return 25.sp;
    }
  }

  double getSpaceSize(context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 7.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 8.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 15.sp;
    } else {
      return 15;
    }
  }

  double getIconSize(context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 5.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 7.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 11.sp;
    } else {
      return 11.sp;
    }
  }

  double getSizeForText(context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 3.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 7.sp;
    } else {
      return 7.sp;
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
    return InkWell(
      onTap: () {
        func();
      },
      child: Text(
        text,
        style:
            TextStyle(color: Colors.white, fontSize: getSizeForText(context)),
      ),
    );
  }

  double getSizeForText(context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 3.5.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 13.sp;
    } else if (MezCalmosResizer.isSmallTablet(context)) {
      return 8.sp;
    } else {
      return 15.sp;
    }
  }
}
