import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/views/components/webAppExpensionPanelComponent.dart';
import 'package:sizer/sizer.dart';

class FrequentlyAskedQuestions extends StatelessWidget {
  FrequentlyAskedQuestions({Key? key}) : super(key: key);
  final LanguageController langController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Column(
      children: [
        SizedBox(
          height: getSpaceOnTop(context),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
              horizontal:
                  MezCalmosResizer.getWepPageHorizontalPadding(context)),
          child: Obx(
            () => Text(
              "${langController.strings["WebApp"]["FAQ(FAQ)"]}",
              style: txt.headline1!.copyWith(
                  fontSize: getSizeForTitle(context),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Montserrat",
                  color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  MezCalmosResizer.getWepPageHorizontalPadding(context)),
          child: GetListOfQuestions(
              textTheme: txt,
              separateSize: getSizeForSpaceBetweenQuestions(context),
              leadingSize: getSizeForLeadingOfListTile(context),
              titleSize: getSizeForListTileTitle(context),
              trailingSize: getSizeForListTileTraillingIcon(context)),
        ),
      ],
    );
  }

  Widget GetListOfQuestions({
    required TextTheme textTheme,
    required double separateSize,
    required double leadingSize,
    required double titleSize,
    required double trailingSize,
  }) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: separateSize,
            ),
            Container(
              width: Get.width -
                  (MezCalmosResizer.getWepPageHorizontalPadding(context) * 2),
              child: MezExpansionTile(
                  IconSize: trailingSize,
                  title: Container(
                      child: Row(
                    children: [
                      Text(
                        "01.",
                        style: textTheme.bodyText1!.copyWith(
                            fontSize: leadingSize,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          "What kind of services Mezcalmos offer?",
                          overflow: TextOverflow.clip,
                          style: textTheme.bodyText1!.copyWith(
                              fontSize: titleSize,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Montserrat",
                              color: Colors.black),
                        ),
                      ),
                    ],
                  )),
                  children: [
                    Container(
                      child: Text(
                        """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. """,
                        style: TextStyle(
                            fontSize:
                                getSizeForTextInsideExpensionPenel(context)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ]),
            ),
            Container(
              width: Get.width -
                  (MezCalmosResizer.getWepPageHorizontalPadding(context) * 2),
              child: MezExpansionTile(
                  IconSize: trailingSize,
                  title: Container(
                      child: Row(
                    children: [
                      Text(
                        "02.",
                        style: textTheme.bodyText1!.copyWith(
                            fontSize: leadingSize,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          "What kind of services Mezcalmos offer?",
                          overflow: TextOverflow.clip,
                          style: textTheme.bodyText1!.copyWith(
                              fontSize: titleSize,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Montserrat",
                              color: Colors.black),
                        ),
                      ),
                    ],
                  )),
                  children: [
                    Container(
                      child: Text(
                        """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. """,
                        style: TextStyle(
                            fontSize:
                                getSizeForTextInsideExpensionPenel(context)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ]),
            ),
            Container(
              width: Get.width -
                  (MezCalmosResizer.getWepPageHorizontalPadding(context) * 2),
              child: MezExpansionTile(
                  IconSize: trailingSize,
                  title: Container(
                      child: Row(
                    children: [
                      Text(
                        "03.",
                        style: textTheme.bodyText1!.copyWith(
                            fontSize: leadingSize,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          "How can Mezcalmos help to grow my business?",
                          overflow: TextOverflow.clip,
                          style: textTheme.bodyText1!.copyWith(
                              fontSize: titleSize,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Montserrat",
                              color: Colors.black),
                        ),
                      ),
                    ],
                  )),
                  children: [
                    Container(
                      child: Text(
                        """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. """,
                        style: TextStyle(
                            fontSize:
                                getSizeForTextInsideExpensionPenel(context)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ]),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.black,
            ),
          ],
        ),
      );
    });
  }

  double getSizeForTextInsideExpensionPenel(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 4.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 8.sp;
    } else {
      return 8.5.sp;
    }
  }

  double getSpaceOnTop(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 15.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 14.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 25.sp;
    } else {
      return 25.sp;
    }
  }

  double getSizeForTitle(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 8.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 8.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 15.sp;
    } else {
      return 15.sp;
    }
  }

  double getSizeForSpaceBetweenQuestions(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 11.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 10.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 15.sp;
    } else {
      return 15.sp;
    }
  }

  double getSizeForLeadingOfListTile(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 3.5.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 7.sp;
    } else {
      return 7.sp;
    }
  }

  double getSizeForListTileTitle(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 4.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 10.sp;
    } else {
      return 10.sp;
    }
  }

  double getSizeForListTileTraillingIcon(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 6.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 6.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 11.sp;
    } else {
      return 11.sp;
    }
  }
}
