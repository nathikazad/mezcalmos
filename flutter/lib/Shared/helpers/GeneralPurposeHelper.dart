import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

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
        (states) => states.contains(MaterialState.selected)
            ? Color.fromRGBO(103, 121, 254, 1)
            : Color.fromRGBO(236, 236, 236, 1),
      ),
      hourMinuteTextColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.selected)
            ? Color.fromRGBO(236, 236, 236, 1)
            : Colors.black,
      ),
      dayPeriodColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.selected)
            ? Color.fromRGBO(103, 121, 254, 1)
            : Color.fromRGBO(236, 236, 236, 1),
      ),
      dayPeriodTextColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.selected)
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
          (states) => Color.fromRGBO(103, 121, 254, 1),
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
  String? title,
  String? bodyText,
  String? primaryBtnText,
  String? secondaryBtnText,
  required Future<dynamic> Function() onYesClick,
  void Function()? onNoClick,
}) async {
  final RxBool _clickedYes = false.obs;
  return showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              height: 35.h,
              width: 80.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Flexible(
                    flex: 2,
                    child: Container(
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
                  ),
                  SizedBox(height: 18),
                  Flexible(
                    flex: 1,
                    child: Text(
                      title ?? "Cancel Order",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(height: 11),
                  Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(
                          bodyText ?? 'Are you sure you’d like to cancel ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'This action cannot be undone.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18),
                  Flexible(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 44,
                        width: 65.w,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(252, 89, 99, 1),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              _clickedYes.value = true;
                              onYesClick().then((_) {
                                Get.back<void>(closeOverlays: true);
                                _clickedYes.value = false;
                              });
                            },
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
                                      primaryBtnText ?? 'Yes, cancel order',
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
                    ),
                  ),
                  SizedBox(height: 12),
                  Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        onNoClick?.call();
                        Get.back<void>(closeOverlays: true);
                      },
                      child: Text(
                        secondaryBtnText ?? 'No',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(120, 120, 120, 1),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.99,
                        ),
                      ),
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
        );
      });
}

void showStatusInfoDialog(
  BuildContext context, {
  void Function()? onViewOrderClick,
  void Function()? onOkClick,
  required String status,
  required String description,
  IconData? bottomRightIcon,
}) async {
  return await showDialog(
      context: context,
      builder: (ctx) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: onViewOrderClick == null ? 30.h : 35.h,
              width: 85.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Flex(
                direction: Axis.vertical,
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
                          child: Icon(
                            Icons.local_taxi,
                            color: Colors.white,
                            size: 33,
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(103, 121, 254, 1),
                            shape: BoxShape.circle,
                          ),
                        ),
                        if (bottomRightIcon != null)
                          Positioned(
                            bottom: -5,
                            right: -10,
                            child: Container(
                              height: 30,
                              width: 30,
                              child: Center(
                                child: Icon(
                                  bottomRightIcon,
                                  color: Color.fromRGBO(252, 89, 99, 1),
                                  size: 18,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 235, 236, 1),
                                shape: BoxShape.circle,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  SizedBox(height: 18),
                  Flexible(
                    flex: 1,
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
                  SizedBox(height: 11),
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
                      onTap: () {
                        Get.back<void>(closeOverlays: true);
                        onOkClick?.call();
                      },
                      child: Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(225, 228, 255, 1),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Center(
                          child: Text(
                            'Ok',
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
                  if (onViewOrderClick != null)
                    Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          SizedBox(height: 12),
                          GestureDetector(
                            onTap: onViewOrderClick,
                            child: Text(
                              'View Order',
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
                ],
              ),
            ),
          ),
        );
      });
}
