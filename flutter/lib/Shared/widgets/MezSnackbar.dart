import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

void MezSnackbar(String title, String msg,
        {SnackPosition position = SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3)}) =>
    ScaffoldMessenger.of(QR.context!).showSnackBar(SnackBar(
        content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [Text(title), Text(msg)],
    )));
// title, msg,
//   duration: duration,
//   messageText: Text(
//     "$msg",
//     style: context.txt.bodyText2?.copyWith(color: Colors.white),
//     maxLines: 2,
//   ),
//   colorText: Colors.white,
//   backgroundColor: Colors.black87,
//   snackPosition: position,
//   snackStyle: SnackStyle.FLOATING, content: null,);

void customSnackBar(
    {Color backgroundColor = Colors.black,
    String? title,
    String? subTitle,
    Widget? titleWidget,
    Color textColor = Colors.white,
    Icon? icon,
    SnackPosition position = SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    EdgeInsetsGeometry? padding}) {
  ScaffoldMessenger.of(QR.context!).showSnackBar(SnackBar(
      duration: duration,
      padding: padding ?? EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          titleWidget ??
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (icon != null) ...[icon],
                  SizedBox(
                    width: 10.w,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: '$title\n', style: TextStyle(color: textColor)),
                    WidgetSpan(
                        child: SizedBox(
                      height: 10,
                    )),
                    TextSpan(
                      text: subTitle ?? '',
                      style: TextStyle(color: textColor),
                    )
                  ]))
                ],
              ),
        ],
      )));
}
