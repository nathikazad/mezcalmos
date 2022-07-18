import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/WebApp/routes/AppRoutes.dart';
import 'package:mezcalmos/WebApp/services/values/globals.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/views/HomeView/Components/components.dart';
import 'package:sizer/sizer.dart';

class ServicesPartComponent extends StatelessWidget {
  ServicesPartComponent({Key? key}) : super(key: key);
  final LanguageController langController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(
            left: MezCalmosResizer.getWepPageHorizontalPadding(context),
            right: MezCalmosResizer.getWepPageHorizontalPadding(context),
            top: getVerticalPadding(context)),
        child: (MezCalmosResizer.isMobile(context) ||
                MezCalmosResizer.isSmallMobile(context))
            ? buildWidgetForMobile(context, txt)
            : buildWidgetForDesktopAndTablet(context, txt));
  }

  Widget buildWidgetForDesktopAndTablet(BuildContext context, TextTheme txt) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: size.width -
              MezCalmosResizer.getWepPageHorizontalPadding(context) * 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // service title
              buildServiceTitle(txt, context),

              //list of services
              ListOfServices(txt, context),
              //
              SizedBox(
                height: 25,
              ),
              buildServicesImages(context),
            ],
          ),
        ),
        // buildServicesImages(context)
      ],
    );
  }

  Widget buildWidgetForMobile(BuildContext context, TextTheme txt) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // service title
        buildServiceTitle(txt, context),
        //list of services
        ListOfServices(txt, context),
        //
        SizedBox(
          height: 25,
        ),
        buildServicesImages(context),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }

  Widget buildServiceTitle(TextTheme txt, BuildContext context) {
    return Obx(
      () => Text(
        "${langController.strings["WebApp"]["appBarActions"]["Services"]}",
        style: txt.bodyText1!.copyWith(
            fontSize: getSizeForTextOne(context),
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget buildServicesImages(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          right: MezCalmosResizer.getWepPageHorizontalPadding(context),
          left: MezCalmosResizer.isMobile(context) ||
                  MezCalmosResizer.isSmallMobile(context)
              ? MezCalmosResizer.getWepPageHorizontalPadding(context)
              : 0,
          top: MezCalmosResizer.isMobile(context) ||
                  MezCalmosResizer.isSmallMobile(context)
              ? 0
              : 50,
        ),
        width: MezCalmosResizer.isMobile(context) ||
                MezCalmosResizer.isSmallMobile(context)
            ? null
            : size.width * 0.35,
        child: Image.asset("assets/images/webApp/servicesImg.png"),
      ),
    );
  }

  Widget ListOfServices(TextTheme txt, BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: MezCalmosResizer.isMobile(context) ||
              MezCalmosResizer.isSmallMobile(context)
          ? Column(
              children: [
                Obx(
                  () => WebServicesCard(
                    firstUrlImage: foodServiceOne,
                    secondUrlImage: foodServiceTwo,
                    thirdUrlImage: foodServiceThree,
                    title: "${langController.strings["WebApp"]["food"]}",
                    subtitle:
                        "${langController.strings["WebApp"]["foodDescription"]}",
                    btnText:
                        "${langController.strings["WebApp"]["viewAllRestaurants"]}",
                    func: () {
                      print("food");
                      Get.toNamed(restaurants);
                    },
                  ),
                ),
                SizedBox(
                  height: MezCalmosResizer.getWepPageHorizontalPadding(context),
                ),
                Obx(
                  () => WebServicesCard(
                    firstUrlImage: laundryServiceOne,
                    secondUrlImage: laundryServiceTwo,
                    thirdUrlImage: laundryServiceThree,
                    title: "${langController.strings["WebApp"]["laundry"]}",
                    subtitle:
                        "${langController.strings["WebApp"]["laundryDescription"]}",
                    btnText:
                        "${langController.strings["WebApp"]["viewAllLaundries"]}",
                    func: () {
                      print("laundry");
                      Get.toNamed(laundries);
                    },
                  ),
                )
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Obx(
                    () => WebServicesCard(
                      firstUrlImage: foodServiceOne,
                      secondUrlImage: foodServiceTwo,
                      thirdUrlImage: foodServiceThree,
                      title: "${langController.strings["WebApp"]["food"]}",
                      subtitle:
                          "${langController.strings["WebApp"]["foodDescription"]}",
                      btnText:
                          "${langController.strings["WebApp"]["viewAllRestaurants"]}",
                      func: () {
                        print("food");
                        Get.toNamed(restaurants);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.05,
                ),
                Expanded(
                    child: Obx(
                  () => WebServicesCard(
                    firstUrlImage: laundryServiceOne,
                    secondUrlImage: laundryServiceTwo,
                    thirdUrlImage: laundryServiceThree,
                    title: "${langController.strings["WebApp"]["laundry"]}",
                    subtitle:
                        "${langController.strings["WebApp"]["laundryDescription"]}",
                    btnText:
                        "${langController.strings["WebApp"]["viewAllLaundries"]}",
                    func: () {
                      print("laundry");
                      Get.toNamed(laundries);
                    },
                  ),
                ))
              ],
            ),
    );
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Padding(
    //       padding: getServiceCardPddining(context),
    //       child: Obx(
    //       () => WebServicesCard(
    //           title: "${langController.strings["WebApp"]["food"]}",
    //           titleSize: getSizeForTextOne(context),
    //           url: "assets/images/customer/restaurants/restaurantService.png",
    //           imageSize: getImageSizeForServiceCard(context),
    //           subtitle:
    //               "${langController.strings["WebApp"]["foodDescription"]}",
    //           subtitleSize: getSizeForTextTwo(context),
    //         ),
    //       ),
    //     ),
    //     Padding(
    //       padding: getServiceCardPddining(context),
    //       child: Obx(
    //         () => WebServicesCard(
    //           title: "${langController.strings["WebApp"]["laundry"]}",
    //           titleSize: getSizeForTextOne(context),
    //           url: "assets/images/customer/laundryService.png",
    //           imageSize: getImageSizeForServiceCard(context),
    //           subtitle:
    //               "${langController.strings["WebApp"]["laundryDescription"]}",
    //           subtitleSize: getSizeForTextTwo(context),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }

  double getSizeForTextOne(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 8.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 7.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 15.sp;
    } else {
      return 15.sp;
    }
  }

  EdgeInsetsGeometry getServiceCardPddining(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return EdgeInsets.only(right: 19.sp, top: 3.sp);
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return EdgeInsets.only(right: 15.sp, top: 2.sp);
    } else if (MezCalmosResizer.isMobile(context)) {
      return EdgeInsets.only(
        right: 11.sp,
        top: 8.sp,
      );
    } else {
      return EdgeInsets.only(
        right: 11.sp,
        top: 8.sp,
      );
    }
  }

  double getSizeForTextTwo(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 3.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 3.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 8.sp;
    } else {
      return 8.sp;
    }
  }

  double getImageSizeForServiceCard(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 25.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 26.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 45.sp;
    } else {
      return 45.sp;
    }
  }

  double getVerticalPadding(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 20;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 20;
    } else {
      return 11.sp;
    }
  }
}
