import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void MezSnackbar(String title, String? msg,
    {Alignment position = Alignment.topCenter,
    Color backgorundColor = Colors.black,
    duration = const Duration(seconds: 3)}) {
  BotToast.showSimpleNotification(
    align: position,
    duration: duration,
    title: title,
    subTitle: msg,
    backgroundColor: backgorundColor,
  );
}

void customSnackBar(
    {Color backgroundColor = Colors.black,
    required String title,
    String? subTitle,
    Color textColor = Colors.white,
    Function()? onTap,
    Widget? icon,
    Alignment position = Alignment.topCenter,
    duration = const Duration(seconds: 1),
    EdgeInsetsGeometry padding = const EdgeInsets.all(8)}) {
  BotToast.showNotification(
    onTap: onTap,
    align: position,
    duration: duration,
    contentPadding: padding,
    borderRadius: 0,
    title: (cancelFunc) => Text(
      title,
      style: TextStyle(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w600,
        fontSize: 12.sp,
        color: textColor,
      ),
    ),
    subtitle: (subTitle != null)
        ? (cancelFunc) => Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                subTitle,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w500,
                  fontSize: 10.sp,
                  color: textColor,
                ),
              ),
            )
        : null,
    leading: (icon != null) ? (cancelFunc) => icon : null,
    backgroundColor: backgroundColor,
  );
}

// void customSnackBar(
//     {Color backgroundColor = Colors.black,
//     String? title,
//     String? subTitle,
//     Widget? titleWidget,
//     Color textColor = Colors.white,
//     Widget? icon,
//     SnackPosition position = SnackPosition.BOTTOM,
//     duration = const Duration(seconds: 3),
//     EdgeInsetsGeometry? padding}) {
//   ScaffoldMessenger.of(QR.context!).showSnackBar(SnackBar(
//       duration: duration,
//       backgroundColor: backgroundColor,
//       behavior: SnackBarBehavior.floating,
//       elevation: 0.3,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       padding: padding ?? EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//       content: Container(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             titleWidget ??
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     if (icon != null) ...[icon],
//                     SizedBox(
//                       width: 10,
//                     ),
//                     RichText(
//                         text: TextSpan(children: [
//                       TextSpan(
//                         text: '$title\n',
//                         style: TextStyle(
//                           fontFamily: "Montserrat",
//                           fontWeight: FontWeight.w600,
//                           fontSize: 13.sp,
//                           color: textColor,
//                         ),
//                       ),
//                       WidgetSpan(
//                           child: SizedBox(
//                         height: 10,
//                       )),
//                       TextSpan(
//                         text: subTitle ?? '',
//                         style: TextStyle(color: textColor),
//                       )
//                     ]))
//                   ],
//                 ),
//           ],
//         ),
//       )));
// }
