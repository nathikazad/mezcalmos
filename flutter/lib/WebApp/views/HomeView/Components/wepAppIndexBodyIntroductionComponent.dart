import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/WebApp/services/values/globals.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import '../../../services/widgets/mezCalmosResizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["WebApp"];

class WepAppIndexBodyIntroductionComponent extends StatelessWidget {
  WepAppIndexBodyIntroductionComponent({Key? key, required this.controller})
      : super(key: key);
  final AutoScrollController controller;
  final LanguageController langController = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    return Padding(
        //padding
        padding: EdgeInsets.only(
            left: MezCalmosResizer.getWepPageHorizontalPadding(context),
            top: getVerticalPadding(context)),
        child: (MezCalmosResizer.isMobile(context) ||
                MezCalmosResizer.isSmallMobile(context))
            ? buildWidgetForMobile(context)
            : buildWidgetForTabletAndDesktop(context));
  }

  Widget buildWidgetForMobile(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    final LanguageController lang = Get.find<LanguageController>();
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 60.sp,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: (size.width * 0.3),
                  child: Obx(
                    () => Image.network(
                      lang.userLanguageKey == LanguageType.EN
                          ? homeMobileUIImageEN
                          : homeMobileUIImageES,
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                        if (frame != null) {
                          return child;
                        } else {
                          return Container(
                            width: Get.width * 0.25,
                            height: Get.width * 0.55,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Shimmer.fromColors(
                                child: Container(
                                  color: Colors.grey,
                                ),
                                highlightColor: Colors.grey[400]!,
                                baseColor: Colors.grey[300]!,
                                direction: ShimmerDirection.ltr,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 30.sp,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: (size.width * 0.3),
                  child: Obx(
                    () => Image.network(
                        lang.userLanguageKey == LanguageType.EN
                            ? restaurantMobileUiImageEN
                            : restaurantMobileUiImageES,
                        frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) {
                      if (frame != null) {
                        return child;
                      } else {
                        return Container(
                          width: Get.width * 0.25,
                          height: Get.width * 0.55,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Shimmer.fromColors(
                              child: Container(
                                color: Colors.grey,
                              ),
                              highlightColor: Colors.grey[400]!,
                              baseColor: Colors.grey[300]!,
                              direction: ShimmerDirection.ltr,
                            ),
                          ),
                        );
                      }
                    }),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: (size.width * 0.3),
              child: Obx(() => Image.network(
                      lang.userLanguageKey == LanguageType.EN
                          ? laundryMobileUIImageEN
                          : laundryMobileUIImageES,
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                    if (frame != null) {
                      return child;
                    } else {
                      return Container(
                        margin: EdgeInsets.only(left: 10),
                        width: Get.width * 0.25,
                        height: Get.width * 0.55,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Shimmer.fromColors(
                            child: Container(
                              color: Colors.grey,
                            ),
                            highlightColor: Colors.grey[400]!,
                            baseColor: Colors.grey[300]!,
                            direction: ShimmerDirection.ltr,
                          ),
                        ),
                      );
                    }
                  })),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        firstText(context),
        SizedBox(
          height: 10,
        ),
        Container(
            margin: EdgeInsets.only(
                right: MezCalmosResizer.getWepPageHorizontalPadding(context)),
            child: secondText(context)),
        Padding(
            padding: EdgeInsets.symmetric(
                // horizontal:
                //     MezCalmosResizer.getWepPageHorizontalPadding(context),
                vertical: 25),
            child: getAppBtn(context)),
      ],
    );
  }

  Widget firstText(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
      alignment: Alignment.centerLeft,
      child: Obx(
        () => Text(
          "${langController.strings["WebApp"]["title"]}",
          style: txt.headline1!.copyWith(
              fontWeight: FontWeight.w700,
              fontFamily: "Montserrat",
              height: 1.3,
              fontSize: getSizeForFirstText(context),
              color: Colors.black),
        ),
      ),
    );
  }

  Widget secondText(BuildContext context) {
    final txt = Theme.of(context).textTheme;

    return Container(
      alignment: Alignment.centerLeft,
      child: Obx(
        () => Text(
          "${langController.strings["WebApp"]["subtitle"]}",
          textAlign: TextAlign.left,
          style: txt.bodyText1!.copyWith(
              color: Colors.black,
              fontSize: getSizeForSecondText(context),
              fontWeight: FontWeight.w300,
              fontFamily: "Nunito"),
        ),
      ),
    );
  }

  Widget getAppBtn(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(279),
          ),
          child: InkWell(
            onTap: () {
              _scrollToCounter(controller, 4);
              print("get App");
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MezCalmosResizer.isMobile(context) ||
                          MezCalmosResizer.isMobile(context)
                      ? 15
                      : 25),
              // width: getSizeForGetAppBtn(context) * 12,
              height: getSizeForGetAppBtn(context) * 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(279),
                ),
                gradient: LinearGradient(
                    begin: Alignment(1, 0.5),
                    end: Alignment(-0.75, 0.75),
                    colors: [
                      Color.fromRGBO(172, 89, 252, 1),
                      Color.fromRGBO(103, 121, 254, 1)
                    ]),
              ),
              child: Center(
                  child: Obx(
                () => Text(
                  "${langController.strings["WebApp"]["getAppBtn"]}",
                  style: txt.bodyText1!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: getSizeForGetAppBtn(context),
                      fontFamily: "Montserrat"),
                ),
              )),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildWidgetForTabletAndDesktop(BuildContext context) {
    final LanguageController lang = Get.find<LanguageController>();
    final txt = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //first container
        Container(
          width: size.width * 0.5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              firstText(context),
              SizedBox(
                height: 10,
              ),
              secondText(context),
              SizedBox(
                height: 25,
              ),
              getAppBtn(context)
            ],
          ),
        ),
        //second container
        Container(
          width: size.width * 0.32,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 130.sp,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 45.sp,
                              child: Container(
                                height: 82.sp,
                                child: Obx(
                                  () => Image.network(
                                    lang.userLanguageKey == LanguageType.EN
                                        ? restaurantMobileUiImageEN
                                        : restaurantMobileUiImageES,
                                    frameBuilder: (context, child, frame,
                                        wasSynchronouslyLoaded) {
                                      if (frame != null) {
                                        return child;
                                      } else {
                                        return Container(
                                          width: Get.width * 0.13,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            child: Shimmer.fromColors(
                                              child: Container(
                                                color: Colors.grey,
                                              ),
                                              highlightColor: Colors.grey[400]!,
                                              baseColor: Colors.grey[300]!,
                                              direction: ShimmerDirection.ltr,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 50.sp,
                              child: Container(
                                height: 82.sp,
                                child: Obx(
                                  () => Image.network(
                                    lang.userLanguageKey == LanguageType.EN
                                        ? laundryMobileUIImageEN
                                        : laundryMobileUIImageES,
                                    frameBuilder: (context, child, frame,
                                        wasSynchronouslyLoaded) {
                                      if (frame != null) {
                                        return child;
                                      } else {
                                        return Container(
                                          width: Get.width * 0.13,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            child: Shimmer.fromColors(
                                              child: Container(
                                                color: Colors.grey,
                                              ),
                                              highlightColor: Colors.grey[400]!,
                                              baseColor: Colors.grey[300]!,
                                              direction: ShimmerDirection.ltr,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 25.sp,
                              //
                              left: 25.sp,
                              child: Container(
                                height: 82.sp,
                                child: Obx(
                                  () => Image.network(
                                    lang.userLanguageKey == LanguageType.EN
                                        ? homeMobileUIImageEN
                                        : homeMobileUIImageES,
                                    frameBuilder: (context, child, frame,
                                        wasSynchronouslyLoaded) {
                                      if (frame != null) {
                                        return child;
                                      } else {
                                        return Container(
                                          width: Get.width * 0.13,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            child: Shimmer.fromColors(
                                              child: Container(
                                                color: Colors.grey,
                                              ),
                                              highlightColor: Colors.grey[400]!,
                                              baseColor: Colors.grey[300]!,
                                              direction: ShimmerDirection.ltr,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getBottomSizeForWidget(context),
              )
            ],
          ),
        ),
      ],
    );
  }

  double getSizeForFirstText(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 16.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 17.sp;
    } else {
      return 30.sp;
    }
  }

  double getSizeForGetAppBtn(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 5.5.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 6.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 11.sp;
    } else {
      return 11.5.sp;
    }
  }

  double getBottomSizeForWidget(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 8.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 9.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 16.sp;
    } else {
      return 17.5.sp;
    }
  }

  double getSizeForSecondText(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 5.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 5.5.sp;
    } else {
      return 10.sp;
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

  Future _scrollToCounter(AutoScrollController controller, int index) async {
    await controller.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    controller.highlight(index);
  }
}
