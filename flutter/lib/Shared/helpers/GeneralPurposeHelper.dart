import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["helpers"]
    ["GeneralPurposeHelper"];

/// This calls will contains all the Formatting Stuff
class MezFormatter {
  static final NumberFormat currency = NumberFormat("#,##0.00", "en_US");
}

/// Call this with the _i18n fucntion and the wanted path.
///
/// PS: Path should be separated using . ex: key1.key2.key3
Object? getMapValueFromPath(
    {required Function i18nFunction, required String path}) {
  if (i18nFunction() is! Map<String, dynamic>) return null;
  final int index = path.indexOf('.');
  if (index < 0) return i18nFunction()[path];
  return getMapValueFromPath(
      i18nFunction: () => i18nFunction()[path.substring(0, index)],
      path: path.substring(index + 1));
}

enum AppLaunchMode { prod, dev, stage }

extension AppLaunchModeParser on String {
  /// if couldn't parse it returns dev as default
  AppLaunchMode toLaunchMode({AppLaunchMode defaultLmode = AppLaunchMode.dev}) {
    mezDbgPrint("Called [toLaunchMode] on $this ");
    return AppLaunchMode.values.firstWhere(
      (AppLaunchMode v) =>
          v.toString().toLowerCase().split('.').last == toLowerCase(),
      orElse: () => defaultLmode,
    );
  }
}

extension AppLaunchModeConverter on AppLaunchMode {
  /// if couldn't parse it returns dev as default
  String toShortString() {
    return toString().toLowerCase().split('.').last;
  }
}

AppLaunchMode getAppLaunchMode() {
  return (GetStorage().read<String>(getxLmodeKey).toString()).toLaunchMode();
}

extension DateTimeCopy on DateTime {
  /// maintain the year/month/day and apply new hour/minutes
  DateTime copyWithTimeOfDay(TimeOfDay t) {
    return new DateTime(year, month, day, t.hour, t.minute);
  }

  /// maintain hours/minutes and override day/moonth/year
  DateTime copyWithDate(DateTime newDate) {
    return new DateTime(newDate.year, newDate.month, newDate.day, hour, minute);
  }
}

Future<DateTime?> getDatePicker(
  BuildContext context, {
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
}) {
  return showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (_, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color.fromRGBO(103, 121, 254, 1),
            // accentColor: Color.fromRGBO(103, 121, 254, 1),
            colorScheme: ColorScheme.light(
              primary: Color.fromRGBO(103, 121, 254, 1),
            ),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: Transform.scale(scale: .9, child: child!),
        );
      });
}

Future<TimeOfDay?> getTimePicker(
  BuildContext context, {
  required TimeOfDay initialTime,
}) {
  final ThemeData theme = ThemeData.light().copyWith(
    timePickerTheme: TimePickerThemeData(
      // backgroundColor: Colors.green.shade200,
      hourMinuteColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) => states.contains(MaterialState.selected)
            ? Color.fromRGBO(103, 121, 254, 1)
            : Color.fromRGBO(236, 236, 236, 1),
      ),
      hourMinuteTextColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) => states.contains(MaterialState.selected)
            ? Color.fromRGBO(236, 236, 236, 1)
            : Colors.black,
      ),
      dayPeriodColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) => states.contains(MaterialState.selected)
            ? Color.fromRGBO(103, 121, 254, 1)
            : Color.fromRGBO(236, 236, 236, 1),
      ),
      dayPeriodTextColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) => states.contains(MaterialState.selected)
            ? Colors.white
            : Colors.black,
      ),
      dialHandColor: Color.fromRGBO(103, 121, 254, 1),
      dialBackgroundColor: Color.fromRGBO(236, 236, 236, 1),
    ),
    textTheme: TextTheme(
      overline: TextStyle(
        color: Color.fromRGBO(120, 120, 120, 1),
        fontFamily: 'Nunito',
        fontSize: 10,
        fontWeight: FontWeight.w600,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) => Color.fromRGBO(103, 121, 254, 1),
        ),
      ),
    ),
  );
  return showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext ctx, Widget? child) {
        return Theme(
          data: theme,
          child: Transform.scale(scale: .9, child: child!),
        );
      });
}

Future<void> showConfirmationDialog(
  BuildContext context, {
  required Future<dynamic> Function() onYesClick,
  void Function()? onNoClick,
  String? title,
  String? helperText,
  String? primaryButtonText,
  String? secondaryButtonText,
}) async {
  final RxBool _clickedYes = false.obs;
  return showDialog(
      context: context,
      useRootNavigator: true,
      builder: (BuildContext ctx) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(16),
          content: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 66,
                  width: 66,
                  child: Icon(
                    Icons.close,
                    color: Color.fromRGBO(252, 89, 99, 1),
                    size: 33,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(252, 89, 99, 0.12),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  title ?? "${_i18n()["cancelOrder"]}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 11),
                Column(
                  children: [
                    Text(
                      helperText ?? '${_i18n()["cancelConfirmationText"]}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${_i18n()["subtitle"]}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                GestureDetector(
                  onTap: () {
                    _clickedYes.value = true;
                    onYesClick.call().whenComplete(() {
                      _clickedYes.value = false;
                    });
                  },
                  child: Container(
                    height: 44,
                    width: 65.w,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(252, 89, 99, 1),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Center(
                      child: Obx(
                        () => _clickedYes.value
                            ? Center(
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 1,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Text(
                                primaryButtonText ?? '${_i18n()["yesCancel"]}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.34,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    onNoClick?.call();
                    Get.back<void>(closeOverlays: true);
                  },
                  child: Text(
                    secondaryButtonText ?? '${_i18n()["no"]}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(120, 120, 120, 1),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 16.99,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

Future<void> showStatusInfoDialog(
  BuildContext context, {
  void Function()? secondaryCallBack,
  void Function()? primaryCallBack,
  required String status,
  required String description,
  bool showSmallIcon = true,
  String? primaryClickTitle = "Ok",
  String? secondaryClickTitle = "View Order",
  IconData? primaryIcon,
  Color? btnRightIconColor,
  Color? btnRightIconBgColor = offRedColor,
  String? primaryImageUrl,
  IconData? bottomRightIcon,
}) async {
  return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext ctx) {
        return AlertDialog(
          //  color: Colors.transparent,
          content: Flex(
            direction: Axis.vertical,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 3,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 66,
                      width: 66,
                      child: getRightNotifIcon(primaryImageUrl, primaryIcon),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(103, 121, 254, 1),
                        shape: BoxShape.circle,
                      ),
                    ),
                    if (showSmallIcon)
                      Positioned(
                        bottom: -5,
                        right: -10,
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Center(
                            child: Icon(
                              bottomRightIcon ?? Icons.close,
                              color: btnRightIconColor ?? Colors.red,
                              size: 18,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: btnRightIconBgColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Flexible(
                flex: 2,
                child: Text(
                  status,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Flexible(
                flex: 2,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 18),
              Flexible(
                flex: 2,
                child: GestureDetector(
                  onTap: (primaryCallBack == null)
                      ? () => Get.back<void>(closeOverlays: true)
                      : primaryCallBack,
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(225, 228, 255, 1),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Center(
                      child: Text(
                        primaryClickTitle ?? "Ok",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(103, 121, 254, 1),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.34,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (secondaryCallBack != null)
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 12),
                      GestureDetector(
                        onTap: secondaryCallBack,
                        child: Text(
                          secondaryClickTitle ?? "View order",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(120, 120, 120, 1),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 16.99,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
            ],
          ),
        );
      });
}

Widget radioCircleButton(
    {bool value = false, required void Function(bool?) onTap}) {
  return InkWell(
    customBorder: CircleBorder(),
    onTap: () {
      onTap.call(null);
    },
    child: Ink(
        child: (value)
            ? Icon(
                Icons.radio_button_checked,
                size: 25,
                color: primaryBlueColor,
              )
            : Icon(
                Icons.circle_outlined,
                color: primaryBlueColor,
                size: 25,
              ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        )),
  );
}

Widget multipleSelectOptionComponent(
    {required bool value, required void Function(bool?) onTap}) {
  return InkWell(
    customBorder: CircleBorder(),
    onTap: () {
      onTap.call(null);
    },
    child: Container(
        alignment: Alignment.center,
        // padding: const EdgeInsets.all(5),
        child: (value)
            ? Icon(
                Icons.check,
                size: 22,
                color: Colors.white,
              )
            : Icon(
                Icons.add,
                color: primaryBlueColor,
                size: 22,
              ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: value ? primaryBlueColor : SecondaryLightBlueColor,
        )),
  );
}

Widget getRightNotifIcon(String? imageUrl, IconData? icon) {
  if (imageUrl != null) {
    return CircleAvatar(
      radius: 35,
      backgroundImage: CachedNetworkImageProvider(imageUrl),
    );
  } else if (icon != null) {
    return Icon(
      icon,
      color: Colors.white,
      size: 33,
    );
  } else {
    return Icon(
      Icons.local_taxi_rounded,
      color: Colors.white,
      size: 33,
    );
  }
}
