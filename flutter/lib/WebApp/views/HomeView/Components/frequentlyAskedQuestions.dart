import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
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

  Widget GetListOfQuestions(
      {required TextTheme textTheme,
      required double separateSize,
      required double leadingSize,
      required double titleSize,
      required double trailingSize}) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: separateSize,
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.black,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            minLeadingWidth: 15,
            minVerticalPadding: 15,
            leading: Text(
              "01.",
              style: textTheme.bodyText1!.copyWith(
                  fontSize: leadingSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                  color: Colors.black),
            ),
            title: Text(
              "What kind of services Mezcalmos offer?",
              style: textTheme.bodyText1!.copyWith(
                  fontSize: titleSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Montserrat",
                  color: Colors.black),
            ),
            trailing: Icon(
              Icons.add,
              size: trailingSize,
              color: Color.fromRGBO(103, 121, 254, 1),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.black,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            minLeadingWidth: 15,
            minVerticalPadding: 15,
            leading: Text(
              "02.",
              style: textTheme.bodyText1!.copyWith(
                  fontSize: leadingSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                  color: Colors.black),
            ),
            title: Text(
              "What kind of services Mezcalmos offer?",
              style: textTheme.bodyText1!.copyWith(
                  fontSize: titleSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Montserrat",
                  color: Colors.black),
            ),
            trailing: Icon(
              Icons.add,
              color: Color.fromRGBO(103, 121, 254, 1),
              size: trailingSize,
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.black,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            minLeadingWidth: 15,
            minVerticalPadding: 15,
            leading: Text(
              "03.",
              style: textTheme.bodyText1!.copyWith(
                  fontSize: leadingSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                  color: Colors.black),
            ),
            title: Text(
              "How can Mezcalmos help to grow my business?",
              style: textTheme.bodyText1!.copyWith(
                  fontSize: titleSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Montserrat",
                  color: Colors.black),
            ),
            trailing: Icon(
              Icons.add,
              size: trailingSize,
              color: Color.fromRGBO(103, 121, 254, 1),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.black,
          ),
        ],
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

  double getSizeForTitle(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 8.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
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
    } else if (MezCalmosResizer.isTablet(context)) {
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
    } else if (MezCalmosResizer.isTablet(context)) {
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
    } else if (MezCalmosResizer.isTablet(context)) {
      return 4.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 10.sp;
    } else {
      return 10.sp;
    }
  }

  double getSizeForListTileTraillingIcon(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isTablet(context)) {
      return 4.5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 8.sp;
    } else {
      return 8.sp;
    }
  }
}
