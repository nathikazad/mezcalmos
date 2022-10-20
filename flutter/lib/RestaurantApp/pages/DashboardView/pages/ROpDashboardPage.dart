import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/components/ROpOpenClose.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpEditInfoView']['ROpEditInfoView'];

class ROpDashboardPage extends StatelessWidget {
  const ROpDashboardPage(
      {super.key, required this.viewController, required this.pageController});
  final ROpEditInfoController viewController;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          CircleAvatar(
            radius: 40,
            backgroundImage: CachedNetworkImageProvider(
                viewController.restaurant.value!.info.image),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            viewController.restaurant.value!.info.name,
            style: Get.textTheme.headline3,
          ),
          SizedBox(
            height: 30,
          ),
          _settingsList(),
          SizedBox(
            height: 30,
          ),
          _shortcutsList(),
        ],
      ),
    );
  }

  Widget _settingsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "Settings ",
            style: Get.textTheme.bodyText1,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          // margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _navigationLink(
                  onClick: () {
                    // pageController.animateTo(MediaQuery.of(context).size.width,
                    //     duration: new Duration(seconds: 1), curve: Curves.easeIn);
                    pageController.animateToPage(1,
                        duration: Duration(milliseconds: 1),
                        curve: Curves.easeIn);
                  },
                  icon: Icons.person,
                  titleWidget: Text(
                    "Restaurant informations",
                    style: Get.textTheme.bodyText1?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
              _divider(),
              _navigationLink(
                  onClick: () {
                    pageController.animateToPage(2,
                        duration: Duration(milliseconds: 1),
                        curve: Curves.easeIn);
                  },
                  icon: Icons.business_outlined,
                  titleWidget: Text(
                    "Schedule",
                    style: Get.textTheme.bodyText1?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
              _divider(),
              _navigationLink(
                  onClick: () {
                    pageController.animateToPage(3,
                        duration: Duration(milliseconds: 1),
                        curve: Curves.easeIn);
                  },
                  icon: Icons.account_balance,
                  titleWidget: Text(
                    "Payments",
                    style: Get.textTheme.bodyText1?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
              _divider(),
              _navigationLink(
                  onClick: () {
                    pageController.animateToPage(4,
                        duration: Duration(milliseconds: 1),
                        curve: Curves.easeIn);
                  },
                  icon: Icons.star_rate_rounded,
                  titleWidget: Text(
                    "Reviews",
                    style: Get.textTheme.bodyText1?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget _shortcutsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "Shortcuts ",
            style: Get.textTheme.bodyText1,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          // margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _navigationLink(
                  onClick: () {
                    // pageController.animateTo(MediaQuery.of(context).size.width,
                    //     duration: new Duration(seconds: 1), curve: Curves.easeIn);
                    pageController.animateToPage(1,
                        duration: Duration(milliseconds: 1),
                        curve: Curves.easeIn);
                  },
                  icon: Icons.share,
                  titleWidget: Text(
                    "Share restaurant",
                    style: Get.textTheme.bodyText1?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
              _divider(),
              _navigationLink(
                  onClick: () {
                    pageController.animateToPage(2,
                        duration: Duration(milliseconds: 1),
                        curve: Curves.easeIn);
                  },
                  icon: Icons.delivery_dining,
                  trailingWidget: Switch(
                    value: true,
                    onChanged: (bool v) {},
                    activeColor: primaryBlueColor,
                  ),
                  titleWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Self delivery",
                        style: Get.textTheme.bodyText1?.copyWith(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade900),
                      ),
                      Text(
                        "Turn on self delivery to control your own deliveries.",
                        style: Get.textTheme.subtitle1
                            ?.copyWith(color: Colors.grey.shade500),
                      ),
                    ],
                  )),
              _divider(),
              ROpOpenClose(
                  title: '${_i18n()["openTitle"]}',
                  subtitle: '${_i18n()["openSubtitle"]}',
                  onTurnedOn: () {
                    viewController.switchAv(true);
                  },
                  onTurnedOff: () {
                    viewController.switchAv(false);
                  },
                  initialSwitcherValue: viewController.isAvailable.value),
              _divider(),
              _navigationLink(
                  onClick: () {
                    pageController.animateToPage(3,
                        duration: Duration(milliseconds: 1),
                        curve: Curves.easeIn);
                  },
                  icon: Icons.privacy_tip,
                  titleWidget: Text(
                    "Privacy Policy",
                    style: Get.textTheme.bodyText1?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
              _divider(),
              _navigationLink(
                  onClick: () {
                    pageController.animateToPage(4,
                        duration: Duration(milliseconds: 1),
                        curve: Curves.easeIn);
                  },
                  icon: Icons.logout,
                  iconColor: Colors.red,
                  titleWidget: Text(
                    "Log Out",
                    style: Get.textTheme.bodyText1?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.red),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Divider _divider() {
    return Divider(
      // endIndent: 16,
      // indent: 16,
      height: 15,
      thickness: 0.2,
    );
  }

  Widget _navigationLink(
      {required IconData icon,
      required Widget titleWidget,
      Widget? trailingWidget,
      Color? iconColor,
      void Function()? onClick}) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                icon,
                color: iconColor ?? Color(0xFFC4C4C4),
                size: 22,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Flexible(fit: FlexFit.tight, child: titleWidget),
            SizedBox(
              width: 5,
            ),
            if (trailingWidget != null) trailingWidget
          ],
        ),
      ),
    );
  }
}
