import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:sizer/sizer.dart';

class ROpDashboardPage extends StatelessWidget {
  const ROpDashboardPage(
      {super.key, required this.viewController, required this.pageController});
  final ROpEditInfoController viewController;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        _navigationLink(
            onClick: () {
              // pageController.animateTo(MediaQuery.of(context).size.width,
              //     duration: new Duration(seconds: 1), curve: Curves.easeIn);
              pageController.animateToPage(1,
                  duration: Duration(milliseconds: 1), curve: Curves.easeIn);
            },
            icon: Icons.person,
            titleWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Restaurant informations",
                  style: Get.textTheme.bodyText1?.copyWith(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade900),
                ),
                Text(
                  "Name, description, image,languages...",
                  style: Get.textTheme.subtitle1
                      ?.copyWith(color: Colors.grey.shade700, fontSize: 11.sp),
                  maxLines: 1,
                ),
              ],
            )),
        _divider(),
        _navigationLink(
            onClick: () {
              pageController.animateToPage(2,
                  duration: Duration(milliseconds: 1), curve: Curves.easeIn);
            },
            icon: Icons.business_outlined,
            titleWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Schedule",
                  style: Get.textTheme.bodyText1?.copyWith(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade900),
                ),
                Text(
                  "Working hours and availabilty",
                  style: Get.textTheme.subtitle1
                      ?.copyWith(color: Colors.grey.shade700, fontSize: 11.sp),
                  maxLines: 1,
                ),
              ],
            )),
        _divider(),
        _navigationLink(
            onClick: () {
              pageController.animateToPage(3,
                  duration: Duration(milliseconds: 1), curve: Curves.easeIn);
            },
            icon: Icons.account_balance,
            titleWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payments",
                  style: Get.textTheme.bodyText1?.copyWith(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade900),
                ),
                Text(
                  "Payments methods and fees",
                  style: Get.textTheme.subtitle1
                      ?.copyWith(color: Colors.grey.shade700, fontSize: 11.sp),
                  maxLines: 1,
                ),
              ],
            )),
      ],
    );
  }

  Divider _divider() {
    return Divider(
      endIndent: 16,
      indent: 16,
      height: 15,
      thickness: 0.2,
    );
  }

  Widget _navigationLink(
      {required IconData icon,
      required Widget titleWidget,
      void Function()? onClick}) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: secondaryLightBlueColor, shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  icon,
                  color: primaryBlueColor,
                  size: 22,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Flexible(fit: FlexFit.tight, child: titleWidget),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }
}
