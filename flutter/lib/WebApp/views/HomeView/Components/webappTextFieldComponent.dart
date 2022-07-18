import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
import 'package:sizer/sizer.dart';

class WebappTextFieldComponent extends StatelessWidget {
  WebappTextFieldComponent(
      {Key? key,
      required this.title,
      this.maxLine = 1,
      required this.controller})
      : super(key: key);
  final String title;
  final int? maxLine;
  final TextEditingController controller;

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 900 &&
      MediaQuery.of(context).size.width >= 650;

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 900;
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: txt.bodyText1!.copyWith(
                color: Colors.black,
                fontSize: getSizeForTitle(context),
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 3.sp,
          ),
          Container(
            height:
                (maxLine! > 1) ? getSizeForHeightOfTextField(context) : null,
            color: Color.fromRGBO(244, 244, 244, 1),
            child: Theme(
              data: ThemeData(),
              child: TextField(
                controller: controller,
                maxLines: maxLine,
                decoration: InputDecoration(
                    contentPadding: (maxLine! > 1)
                        ? EdgeInsets.all(10)
                        : EdgeInsets.symmetric(horizontal: 10),
                    fillColor: Colors.grey,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none),
              ),
            ),
          )
        ],
      ),
    );
  }

  double getSizeForTitle(BuildContext context) {
    if (isDesktop(context)) {
      return 4.sp;
    } else if (isTablet(context)) {
      return 5.sp;
    } else {
      return 8.sp;
    }
  }

  double getSizeForHeightOfTextField(BuildContext context) {
    if (isDesktop(context)) {
      return 50.sp;
    } else if (isTablet(context) || MezCalmosResizer.isSmallTablet(context)) {
      return 55.sp;
    } else {
      return 45.sp;
    }
  }
}
