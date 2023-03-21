import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

void MezSnackbar(String title, String msg,
        {SnackPosition position = SnackPosition.BOTTOM,
        duration = const Duration(seconds: 3)}) =>
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

void internetErrorSnackbar(
    {Color backgroundColor = Colors.black,
    required String title,
    String? subTitle,
    Widget? titleWidget,
    required BuildContext context,
    Color textColor = Colors.white,
    Widget? icon,
    SnackPosition position = SnackPosition.BOTTOM,
    duration = const Duration(seconds: 3),
    EdgeInsetsGeometry? padding}) {
  BotToast.showNotification(
    align: Alignment.topCenter,
    title: (cancelFunc) => Text(
      title,
      style: TextStyle(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w600,
        fontSize: 13.sp,
        color: textColor,
      ),
    ),
    subtitle: (subTitle != null)
        ? (cancelFunc) => Text(
              subTitle,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                fontSize: 11.sp,
                color: textColor,
              ),
            )
        : null,
    leading: (icon != null) ? (cancelFunc) => icon : null,
    backgroundColor: backgroundColor,
  );
}

void customSnackBar(
    {Color backgroundColor = Colors.black,
    String? title,
    String? subTitle,
    Widget? titleWidget,
    Color textColor = Colors.white,
    Icon? icon,
    SnackPosition position = SnackPosition.BOTTOM,
    duration = const Duration(seconds: 3),
    EdgeInsetsGeometry? padding}) {
  ScaffoldMessenger.of(QR.context!).showSnackBar(SnackBar(
      duration: duration,
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      elevation: 0.3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            titleWidget ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (icon != null) ...[icon],
                    SizedBox(
                      width: 10,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: '$title\n',
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          fontSize: 13.sp,
                          color: textColor,
                        ),
                      ),
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
        ),
      )));
}
