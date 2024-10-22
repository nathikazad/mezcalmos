import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:sizer/sizer.dart';

enum TwoButtonDialogButton { Left, Right }

enum YesNoDialogButton { Yes, No }

dynamic _i18n() =>
    Get.find<LanguageController>().strings['Shared']['widgets']["MezDialogs"];

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

// ok button is not showing
Future<void> oneButtonDialog({
  String? title,
  required String body,
  String? imagUrl,
  Widget? buttonStyle,
  Color? bodyTextColor,
  double fontSize = 20,
  String buttonText = "Ok",
}) async {
  await Get.defaultDialog(
    backgroundColor: Colors.white,
    contentPadding: const EdgeInsets.all(5),
    titlePadding: const EdgeInsets.all(5),
    radius: 8,
    title: title ?? '',
    content: Container(
      //  height: 80.h,
      // width: 90.w,
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imagUrl != null)
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                height: 20.h,
                width: 20.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: mLoadImage(url: imagUrl).image,
                        alignment: Alignment.center,
                        // image: AssetImage(imagUrl),
                        fit: BoxFit.contain)),
              ),
            ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              body,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'psr',
                  fontSize: fontSize,
                  color: bodyTextColor ?? Colors.grey.shade700),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: 80,
              child: InkWell(
                child: buttonStyle,
                onTap: MezRouter.back,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Future<TwoButtonDialogButton?> twoButtonDialog({
  required String title,
  required String body,
  TextStyle? bodyTextStyle,
  //required String leftButtonText,
  bool titleUp = false,
  double? buttonsWidthSize = 80,
  Function? leftButtonCallback,
  // required String rightButtonText,
  Widget? dialogIcon,
  Widget? leftButton,
  Widget? rightButton,
  Function? rightButtonCallback,
  VoidCallback? onTapButtonLeft,
  VoidCallback? onTapButtonRight,
}) async {
  TwoButtonDialogButton? twoButtonDialogButton;
  await Get.defaultDialog<TwoButtonDialogButton>(
    onWillPop: () async {
      twoButtonDialogButton = null;
      return true;
    },
    backgroundColor: Colors.white,
    contentPadding: const EdgeInsets.all(5),
    titlePadding: const EdgeInsets.all(5),
    radius: 8,
    title: titleUp ? title : "",
    content: Container(
      color: const Color(0xffffffff),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          if (titleUp) const SizedBox(height: 10),
          (dialogIcon != null) ? dialogIcon : Container(),
          if (titleUp)
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                title,
                style: const TextStyle(
                    color: Color(0xff000f1c),
                    fontWeight: FontWeight.w700,
                    fontFamily: "ProductSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 25.0),
                textAlign: TextAlign.center,
              ),
            ),
          if (titleUp) const SizedBox(height: 8),
          Text(
            body,
            style: bodyTextStyle ??
                const TextStyle(
                  color: Color(0xff1d1d1d),
                  fontWeight: FontWeight.w400,
                  fontFamily: "ProductSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 15.0,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: buttonsWidthSize,
                    child: InkWell(
                      child: leftButton,
                      onTap: onTapButtonLeft ??
                          () {
                            MezRouter.back();
                            twoButtonDialogButton = TwoButtonDialogButton.Left;
                            leftButtonCallback?.call();

                            // onConform();
                          },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    width: buttonsWidthSize,
                    child: InkWell(
                      child: rightButton,
                      onTap: onTapButtonRight ??
                          () {
                            MezRouter.back();
                            twoButtonDialogButton = TwoButtonDialogButton.Right;
                            rightButtonCallback?.call();
                          },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    ),
  );
  return Future.value(twoButtonDialogButton);
}

Future<YesNoDialogButton> yesNoDialog({
  required String text,
  required String body,
  TextStyle? bodyTextStyle,
  Widget? icon,
  Widget? buttonLeftStyle = const YesButtonStyle(),
  Widget? buttonRightStyle = const NoButtonStyle(),
  bool titleUp = false,
  String? imgUrl,
}) async {
  final TwoButtonDialogButton? _res = (await twoButtonDialog(
    title: text,
    body: body,
    bodyTextStyle: bodyTextStyle,
    titleUp: titleUp,
    dialogIcon: icon,
    leftButton: buttonLeftStyle,
    rightButton: buttonRightStyle,
  ));
  if (_res != null) {
    return _res.toYesNo(
        right: YesNoDialogButton.No, left: YesNoDialogButton.Yes);
  } else
    return YesNoDialogButton.No;
}

Future<YesNoDialogButton> cancelAlertDialog(
    {required String title, required String body, Widget? icon}) async {
  final TwoButtonDialogButton? _res = (await twoButtonDialog(
    title: title,
    body: body,
    dialogIcon: icon,
    rightButton: NoButtonStyle(),
    leftButton: YesButtonStyle(),
  ));
  if (_res != null) {
    return _res.toYesNo(
        right: YesNoDialogButton.No, left: YesNoDialogButton.Yes);
  } else
    return YesNoDialogButton.No;
}

class MezDialogButtonStyle extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final Color? buttonShadowColor;
  final BoxDecoration? customButtonDecoration;
  final TextStyle? customTextStyle;

  factory MezDialogButtonStyle.customized(
      {BoxDecoration? customButtonDecoration,
      TextStyle? customTextStyle,
      required String buttonText}) {
    return MezDialogButtonStyle(
      customButtonDecoration: customButtonDecoration,
      customTextStyle: customTextStyle,
      buttonText: buttonText,
    );
  }

  const MezDialogButtonStyle(
      {required this.buttonText,
      this.buttonColor,
      this.buttonShadowColor,
      this.customButtonDecoration,
      this.customTextStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 35,
      decoration: customButtonDecoration ??
          BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            boxShadow: [
              if (buttonShadowColor != null)
                BoxShadow(
                    color: buttonShadowColor!,
                    offset: Offset(0, 6),
                    blurRadius: 10,
                    spreadRadius: 0)
            ],
            color: buttonColor,
          ),
      child: Center(
        child: Text(buttonText,
            style: customTextStyle ??
                const TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w700,
                    fontFamily: "ProductSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
            textAlign: TextAlign.center),
      ),
    );
  }
}

class YesButtonStyle extends StatelessWidget {
  final MezDialogButtonStyle? customMezDialogButtonStyle;

  /// use this when using [YesButtonStyle.customized] from outside of a file , because text is required.
  static final String yesText = _i18n()["yes"];

  const YesButtonStyle({this.customMezDialogButtonStyle, Key? key})
      : super(key: key);

  factory YesButtonStyle.customized(
      {MezDialogButtonStyle? customMezDialogButtonStyle}) {
    return YesButtonStyle(
      customMezDialogButtonStyle: customMezDialogButtonStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return customMezDialogButtonStyle ??
        MezDialogButtonStyle(
            buttonText: _i18n()["yes"],
            buttonColor: Color(0xffdb2846),
            buttonShadowColor: Color(0x2eff0000));
  }
}

class NoButtonStyle extends StatelessWidget {
  final MezDialogButtonStyle? customMezDialogButtonStyle;

  /// use this when using [NoButtonStyle.customized] from outside of a file , because text is required.
  static final String noText = _i18n()["no"];

  const NoButtonStyle({this.customMezDialogButtonStyle, Key? key})
      : super(key: key);

  factory NoButtonStyle.customized(
      {MezDialogButtonStyle? customMezDialogButtonStyle}) {
    return NoButtonStyle(
      customMezDialogButtonStyle: customMezDialogButtonStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return customMezDialogButtonStyle ??
        MezDialogButtonStyle(
            buttonText: _i18n()["no"],
            buttonColor: Color(0xfffdfdfd),
            buttonShadowColor: Color(0x334c504a));
  }
}

class MezUpdaterDialog {
  static Future<void> show({
    required BuildContext context,
    required VoidCallback onUpdateClicked,
    String headerImg = "assets/icons/appstore.png",
  }) async {
    final LanguageController langController = Get.find<LanguageController>();

    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return Center(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 60.h,
              width: 60.w,
              child: Flex(
                direction: Axis.vertical,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Obx(
                    () => Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: langController.changeUserLanguage,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(langController.oppositFlag),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('assets/icons/appstore.png'),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    flex: 1,
                    child: Obx(
                      () => FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          _i18n()["mezUpdaterDialog"]["updateAvailable"],
                          textAlign: TextAlign.center,
                          style: Theme.of(ctx).textTheme.bodyLarge!.copyWith(
                                color: Colors.black.withAlpha(200),
                                decoration: TextDecoration.none,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  // flex: 3,
                  Obx(
                    () => Text(
                      _i18n()["mezUpdaterDialog"]["updatePlease"],
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                      style: Theme.of(ctx).textTheme.bodyLarge!.copyWith(
                            color: Colors.black.withAlpha(200),
                            decoration: TextDecoration.none,
                            fontSize: 12.sp,
                          ),
                    ),
                  ),

                  Spacer(),
                  Spacer(),
                  Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: onUpdateClicked,
                      child: Container(
                        height: 40,
                        child: Center(
                          child: Obx(
                            () => FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                _i18n()["mezUpdaterDialog"]["update"],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.purple.shade400,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'psr',
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: GestureDetector(
                        onTap: () => MezRouter.back(),
                        child: Obx(
                          () => FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              _i18n()["mezUpdaterDialog"]["doNotUpdate"],
                              textAlign: TextAlign.center,
                              style:
                                  Theme.of(ctx).textTheme.bodyLarge!.copyWith(
                                        color: Colors.black.withAlpha(200),
                                        decoration: TextDecoration.none,
                                        fontSize: 12.sp,
                                      ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
