import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

enum TwoButtonDialogButton { Left, Right }
enum YesNoDialogButton { Yes, No }

extension TwoButtonExtension on TwoButtonDialogButton {
  /// @param: [right] this is used to bind [YesNoDialogButton] with [TwoButtonDialogButton.Right]
  ///
  /// @param: [left] this is used to bind [YesNoDialogButton] with [TwoButtonDialogButton.Left]
  YesNoDialogButton toYesNo(
      {required YesNoDialogButton right, required YesNoDialogButton left}) {
    if (this == TwoButtonDialogButton.Right)
      return right;
    else
      return left;
  }
}

// TODO: @Saad make sure network images work
Future<void> oneButtonDialog(
    {String? title,
    required String message,
    required String imagUrl,
    String buttonText = "Ok"}) async {
  await Get.defaultDialog(
    backgroundColor: Colors.grey.shade100,
    title: title ?? '',
    content: Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            fit: FlexFit.loose,
            child: Container(
              height: Get.height / 4,
              width: Get.width / 2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: handleIfNetworkImage(url: imagUrl).image,
                      // image: AssetImage(imagUrl),
                      fit: BoxFit.contain)),
            )),
        Flexible(
            fit: FlexFit.loose,
            child: SizedBox(
              height: 20,
            )),
        Flexible(
            fit: FlexFit.loose,
            child: Center(
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'psr',
                    fontSize: 20,
                    color: Colors.grey.shade700),
              ),
            ))
      ],
    ),
  );
}

Future<TwoButtonDialogButton> twoButtonDialog(
    {required String title,
    required String body,
    required String leftButtonText,
    String? imageUrl,
    Function? leftButtonCallback,
    required String rightButtonText,
    Function? rightButtonCallback}) async {
  LanguageController lang = Get.find<LanguageController>();
  late TwoButtonDialogButton twoButtonDialogButton;
  await Get.defaultDialog<TwoButtonDialogButton>(
    radius: 4,
    title: "",
    content: Container(
      color: const Color(0xffffffff),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            child: Icon(
              Icons.highlight_off,
              size: 65,
              color: Color(0xffdb2846),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text("$title",
              style: const TextStyle(
                  color: const Color(0xff000f1c),
                  fontWeight: FontWeight.w700,
                  fontFamily: "ProductSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 25.0),
              textAlign: TextAlign.center),
          SizedBox(
            height: 8,
          ),
          Text("$body",
              style: const TextStyle(
                  color: const Color(0xff1d1d1d),
                  fontWeight: FontWeight.w400,
                  fontFamily: "ProductSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 15.0),
              textAlign: TextAlign.center),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    width: 88,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0x2eff0000),
                            offset: Offset(0, 6),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                      color: const Color(0xffdb2846),
                    ),
                    child: Center(
                      child: Text("${lang.strings["taxi"]["taxiView"]["yes"]}",
                          style: const TextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              fontFamily: "ProductSans",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  onTap: () {
                    twoButtonDialogButton = TwoButtonDialogButton.Left;
                    leftButtonCallback?.call();
                    Get.back();
                    // onConform();
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  child: Container(
                    width: 88,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0x334c504a),
                            offset: Offset(0, 6),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                      color: const Color(0xfffdfdfd),
                    ),
                    child: Center(
                      child: Text("${lang.strings["taxi"]["taxiView"]["no"]}",
                          style: const TextStyle(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "ProductSans",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  onTap: () {
                    // onCancel();
                    twoButtonDialogButton = TwoButtonDialogButton.Right;
                    rightButtonCallback?.call();
                    Get.back();
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    ),
  );
  return Future.value(twoButtonDialogButton);
}

Future<YesNoDialogButton> yesNoDialog(
    {required String text, required String body, String? imgUrl}) async {
  //return YesNoDialogButton.No;
  // TODO: @Saad use two button dialog
  // OLD CODE BELOW

  return (await twoButtonDialog(
    title: text,
    body: body,
    imageUrl: imgUrl,
    rightButtonText: Get.find<LanguageController>().strings['shared']['popUps']
        ['yes'],
    leftButtonText: Get.find<LanguageController>().strings['shared']['popUps']
        ['no'],
  ))
      .toYesNo(right: YesNoDialogButton.No, left: YesNoDialogButton.Yes);
}

// Future<bool> yesNoDefaultConfirmationDialog(String text) async {
//   bool res = true;
//
//   await Get.defaultDialog<bool>(
//     backgroundColor: Colors.grey.shade100,
//     title: '',
//     content: Flex(
//       direction: Axis.vertical,
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Flexible(
//             fit: FlexFit.loose,
//             child: Icon(
//               MezcalmosIcons.times_circle,
//               size: 40,
//               color: Colors.black,
//             )),
//         Flexible(
//             fit: FlexFit.loose,
//             child: SizedBox(
//               height: 20,
//             )),
//         Flexible(
//             fit: FlexFit.loose,
//             child: Text(
//               text,
//               textAlign: TextAlign.center,
//               style: TextStyle(fontFamily: 'psr', fontSize: 18),
//             )),
//         Flexible(
//             child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             TextButton(
//                 style: ButtonStyle(
//                     minimumSize: MaterialStateProperty.all<Size>(
//                         (Size(double.infinity, 50))),
//                     backgroundColor: MaterialStateProperty.all<Color>(
//                         (Colors.grey.shade300))),
//                 onPressed: () {
//                   res = true;
//                   Get.back();
//                 },
//                 child: Obx(() => Text(
//                     Get.find<LanguageController>().strings['taxi']['taxiView']
//                         ['yes'],
//                     style: TextStyle(
//                       fontFamily: 'psr',
//                       fontSize: 14,
//                       color: Colors.black,
//                     )))),
//             SizedBox(
//               height: 5,
//             ),
//             TextButton(
//                 style: ButtonStyle(
//                     minimumSize: MaterialStateProperty.all<Size>(
//                         (Size(double.infinity, 50))),
//                     backgroundColor: MaterialStateProperty.all<Color>(
//                         (Colors.grey.shade300))),
//                 onPressed: () {
//                   res = false;
//                   Get.back();
//                 },
//                 child: Obx(() => Text(
//                     Get.find<LanguageController>().strings['taxi']['taxiView']
//                         ['no'],
//                     style: TextStyle(
//                       fontFamily: 'psr',
//                       fontSize: 14,
//                       color: Colors.black,
//                     ))))
//           ],
//         )),
//       ],
//     ),
//   );

//   return Future.value(res);
// }

Future<YesNoDialogButton> cancelAlertDialog({
  required String title,
  required String body,
}) async {
  return (await twoButtonDialog(
    title: title,
    body: body,
    rightButtonText: Get.find<LanguageController>().strings['shared']['popUps']
        ['yes'],
    leftButtonText: Get.find<LanguageController>().strings['shared']['popUps']
        ['no'],
  ))
      .toYesNo(right: YesNoDialogButton.Yes, left: YesNoDialogButton.No);
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mezcalmos/Shared/controllers/languageController.dart';

// Future<bool> cancelAlertDailog(String title, String subTitle,
//     Function onConform, Function onCancel) async {
//   LanguageController lang = Get.find<LanguageController>();
//   return await Get.defaultDialog(
//     radius: 4,
//     title: "",
//     content: Container(
//       color: const Color(0xffffffff),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             child: Icon(
//               Icons.highlight_off,
//               size: 65,
//               color: Color(0xffdb2846),
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Text("$title",
//               style: const TextStyle(
//                   color: const Color(0xff000f1c),
//                   fontWeight: FontWeight.w700,
//                   fontFamily: "ProductSans",
//                   fontStyle: FontStyle.normal,
//                   fontSize: 25.0),
//               textAlign: TextAlign.center),
//           SizedBox(
//             height: 8,
//           ),
//           Text("$subTitle",
//               style: const TextStyle(
//                   color: const Color(0xff1d1d1d),
//                   fontWeight: FontWeight.w400,
//                   fontFamily: "ProductSans",
//                   fontStyle: FontStyle.normal,
//                   fontSize: 15.0),
//               textAlign: TextAlign.center),
//           SizedBox(
//             height: 15,
//           ),
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   child: Container(
//                     width: 88,
//                     height: 35,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(4)),
//                       boxShadow: [
//                         BoxShadow(
//                             color: const Color(0x2eff0000),
//                             offset: Offset(0, 6),
//                             blurRadius: 10,
//                             spreadRadius: 0)
//                       ],
//                       color: const Color(0xffdb2846),
//                     ),
//                     child: Center(
//                       child: Text("${lang.strings["taxi"]["taxiView"]["yes"]}",
//                           style: const TextStyle(
//                               color: const Color(0xffffffff),
//                               fontWeight: FontWeight.w700,
//                               fontFamily: "ProductSans",
//                               fontStyle: FontStyle.normal,
//                               fontSize: 14.0),
//                           textAlign: TextAlign.center),
//                     ),
//                   ),
//                   onTap: () {
//                     onConform();
//                   },
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 InkWell(
//                   child: Container(
//                     width: 88,
//                     height: 35,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(4)),
//                       boxShadow: [
//                         BoxShadow(
//                             color: const Color(0x334c504a),
//                             offset: Offset(0, 6),
//                             blurRadius: 10,
//                             spreadRadius: 0)
//                       ],
//                       color: const Color(0xfffdfdfd),
//                     ),
//                     child: Center(
//                       child: Text("${lang.strings["taxi"]["taxiView"]["no"]}",
//                           style: const TextStyle(
//                               color: const Color(0xff000000),
//                               fontWeight: FontWeight.w700,
//                               fontFamily: "ProductSans",
//                               fontStyle: FontStyle.normal,
//                               fontSize: 14.0),
//                           textAlign: TextAlign.center),
//                     ),
//                   ),
//                   onTap: () {
//                     // Get.back();
//                     onCancel();
//                   },
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//         ],
//       ),
//     ),
//   );
// }
