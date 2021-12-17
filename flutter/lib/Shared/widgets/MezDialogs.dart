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
// ok button is not showing
Future<void> oneButtonDialog(
    {String? title,
    required String body,
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
                      image: mLoadImage(url: imagUrl).image,
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
                body,
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
    //required String leftButtonText,
    bool? titleUp = false,
    double? buttonsWidthSize = 80,
    Function? leftButtonCallback,
    // required String rightButtonText,
    Widget? dailogIcon,
    Widget? buttonLeftStyle,
    Widget? buttonRightStyle,
    Function? rightButtonCallback}) async {
  LanguageController lang = Get.find<LanguageController>();
  late TwoButtonDialogButton twoButtonDialogButton;
  await Get.defaultDialog<TwoButtonDialogButton>(
    radius: 4,
    title: (titleUp!) ? "$title" : "",
    content: Container(
      color: const Color(0xffffffff),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          (dailogIcon != null) ? dailogIcon : Container(),
          (!titleUp)
              ? Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text("$title",
                      style: const TextStyle(
                          color: const Color(0xff000f1c),
                          fontWeight: FontWeight.w700,
                          fontFamily: "ProductSans",
                          fontStyle: FontStyle.normal,
                          fontSize: 25.0),
                      textAlign: TextAlign.center),
                )
              : Container(),
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
                Expanded(
                  child: Container(
                    width: buttonsWidthSize,
                    child: InkWell(
                      child: buttonLeftStyle,
                      onTap: () {
                        twoButtonDialogButton = TwoButtonDialogButton.Left;
                        leftButtonCallback?.call();
                        Get.back();
                        // onConform();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    width: buttonsWidthSize,
                    child: InkWell(
                      child: buttonRightStyle,
                      onTap: () {
                        // onCancel();
                        twoButtonDialogButton = TwoButtonDialogButton.Right;
                        rightButtonCallback?.call();
                        Get.back();
                      },
                    ),
                  ),
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
    {required String text,
    required String body,
    Widget? icon,
    Widget? buttonLeftStyle = const YesButtonComponetStyle(),
    Widget? buttonRightStyle = const NoButtonComponetStyle(),
    bool? titleUp = false,
    String? imgUrl}) async {
  //return YesNoDialogButton.No;
  // TODO: @Saad use two button dialog
  // OLD CODE BELOW

  return (await twoButtonDialog(
    title: text,
    body: body,
    titleUp: titleUp,
    dailogIcon: icon,
    buttonLeftStyle: buttonLeftStyle,
    buttonRightStyle: buttonRightStyle,
  ))
      .toYesNo(right: YesNoDialogButton.No, left: YesNoDialogButton.Yes);
}

Future<YesNoDialogButton> cancelAlertDialog(
    {required String title, required String body, Widget? icon}) async {
  return (await twoButtonDialog(
    title: title,
    body: body,
    dailogIcon: icon,
    buttonRightStyle: NoButtonComponetStyle(),
    buttonLeftStyle: YesButtonComponetStyle(),
  ))
      .toYesNo(right: YesNoDialogButton.Yes, left: YesNoDialogButton.No);
}

class YesButtonComponetStyle extends StatelessWidget {
  const YesButtonComponetStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Text(
            "${Get.find<LanguageController>().strings["taxi"]["taxiView"]["yes"]}",
            style: const TextStyle(
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
                fontFamily: "ProductSans",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
            textAlign: TextAlign.center),
      ),
    );
  }
}

class NoButtonComponetStyle extends StatelessWidget {
  const NoButtonComponetStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Text(
            "${Get.find<LanguageController>().strings["taxi"]["taxiView"]["no"]}",
            style: const TextStyle(
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
                fontFamily: "ProductSans",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
            textAlign: TextAlign.center),
      ),
    );
  }
}
