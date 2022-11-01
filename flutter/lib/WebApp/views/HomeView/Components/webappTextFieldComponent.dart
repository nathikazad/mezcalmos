import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosResizer.dart';
import 'package:sizer/sizer.dart';

class WebappTextFieldComponent extends StatelessWidget {
  WebappTextFieldComponent(
      {Key? key,
      required this.title,
      this.maxLine = 1,
      this.onSave,
      this.onValidate,
      required this.controller})
      : super(key: key);
  final String title;
  final int? maxLine;
  final FormFieldSetter<String?>? onSave;
  final FormFieldValidator<String?>? onValidate;
  final TextEditingController controller;

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
            height: (maxLine! > 1)
                ? getSizeForHeightOfTextField(context)
                : (MezCalmosResizer.isDesktop(context) ||
                        MezCalmosResizer.isTablet(context) ||
                        MezCalmosResizer.isSmallTablet(context))
                    ? null
                    : null,
            color: Color.fromRGBO(244, 244, 244, 1),
            child: Theme(
              data: ThemeData(),
              child: TextFormField(
                controller: controller,
                maxLines: maxLine,
                onSaved: onSave,
                validator: onValidate,
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
    if (MezCalmosResizer.isDesktop(context)) {
      return 4.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 5.sp;
    } else if (MezCalmosResizer.isMobile(context)) {
      return 11.sp;
    } else {
      return 11.5.sp;
    }
  }

  double getSizeForHeightOfTextField(BuildContext context) {
    if (MezCalmosResizer.isDesktop(context)) {
      return 50.sp;
    } else if (MezCalmosResizer.isTablet(context) ||
        MezCalmosResizer.isSmallTablet(context)) {
      return 55.sp;
    } else {
      return 100;
    }
  }
}
