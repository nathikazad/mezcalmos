import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["helpers"]
    ["DateTimeHelper"];

String get userLangCode {
  return Get.find<LanguageController>().userLanguageKey.toLanguageCode();
}

extension DurationParser on Duration {
  String _padZeros(int n) => n.toString().padLeft(2, "0");

  String ParseToHoursMinutes() {
    final String twoDigitMinutes = _padZeros(inMinutes.remainder(60));
    return "${_padZeros(inHours)}:$twoDigitMinutes";
  }
}

enum AmPmEnum { AM, PM }

extension ParseDeliveryTypeToString on AmPmEnum {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  String toNormalString() {
    final String str = toString().split('.').last;

    return str;
  }
}

// This helper will do the calculataion and return the differnce
// between the current time and the passed date time
// wit will alse do the needed format on the string

extension parseDateTime on DateTime {
  String toDayName({bool withDateNumber = false}) {
    if (isToday) {
      return '${_i18n()["today"]}';
    } else if (isTomorrow) {
      return '${_i18n()["tomorrow"]}';
    } else if (isYesterday) {
      return '${_i18n()["yesterday"]}';
    } else if (withDateNumber) {
      return "${DateFormat.MMMEd(userLangCode).format(this).replaceAll(".", "")}";
    } else {
      return "${DateFormat.EEEE(userLangCode).format(this)}";
    }
  }

  bool get isToday {
    final DateTime now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool get isTomorrow {
    final DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.day == day &&
        tomorrow.month == month &&
        tomorrow.year == year;
  }

  bool get isYesterday {
    final DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }

  String getEstimatedTime() {
    final DateTime now = DateTime.now();

    final String userLangCode =
        Get.find<LanguageController>().userLanguageKey.toLanguageCode();

    final DateFormat formatTime = DateFormat.jm(userLangCode);
    final DateFormat formatMonth = DateFormat.MMMMd(userLangCode);
    if (DateTime(toLocal().year, toLocal().month, toLocal().day)
            .difference(DateTime(now.year, now.month, now.day))
            .inDays
            .abs() >
        1) {
      return "${formatMonth.format(toLocal())}, ${_i18n()["at"]} ${formatTime.format(toLocal())}";
    } else if (DateTime(toLocal().year, toLocal().month, toLocal().day)
            .difference(DateTime(now.year, now.month, now.day))
            .inDays
            .abs() >
        0) {
      return "${_i18n()["tomorrow"]}, ${DateFormat("hh:mm a").format(toLocal())}"
          .inCaps;
    } else if (now.difference(toLocal()).inHours.abs() > 0) {
      return "${_i18n()["at"]} ${DateFormat("hh:mm a").format(toLocal())}"
          .inCaps;
    } else {
      return "${_i18n()["in"]} ${now.difference(toLocal()).inMinutes.abs()} min"
          .inCaps;
    }
  }

  String getOrderTime({bool withDayName = false}) {
    final DateTime cDate = DateTime.now().toLocal();
    final String userLangCode =
        Get.find<LanguageController>().userLanguageKey.toLanguageCode();
    final DateFormat formatLongDay = DateFormat.MMMd(userLangCode);
    final DateFormat formatDay = DateFormat.EEEE(userLangCode);
    final DateFormat formatMonth = DateFormat.MMMd(userLangCode);
    if (withDayName) {
      return "${formatDay.format(toLocal()).replaceFirst(".", "")}, ${formatMonth.format(toLocal()).replaceFirst(".", "")}, ${DateFormat("hh:mm a").format(toLocal())}";
    } else {
      return "${formatLongDay.format(toLocal()).replaceFirst(".", "").capitalizeMonthAfterDay}, ${DateFormat("hh:mm a").format(toLocal())}";
    }
  }

  String toDayAmPm() {
    final String userLangCode =
        Get.find<LanguageController>().userLanguageKey.toLanguageCode();
    final DateFormat formatTime = DateFormat.jm(userLangCode);
    final DateFormat formatDay = DateFormat.E(userLangCode);

    return "${formatDay.format(toLocal()).replaceFirst(".", "").inCaps}, ${DateFormat("hh:mm a").format(toLocal())}";
  }

  String timeAgo({bool numericDates = true}) {
    final DateTime date2 = DateTime.now();
    final Duration difference = date2.difference(this);

    if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates)
          ? '1 ${_i18n()["weekAgo"]}'
          : '${_i18n()["lastWeek"]}';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} ${_i18n()["daysAgo"]}';
    } else if (difference.inDays >= 1) {
      return (numericDates)
          ? '1 ${_i18n()["dayAgo"]}'
          : '${_i18n()["yesterday"]}';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} ${_i18n()["hoursAgo"]}';
    } else if (difference.inHours >= 1) {
      return '1 ${_i18n()["hourAgo"]}';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} ${_i18n()["minutesAgo"]}';
    } else if (difference.inMinutes >= 1) {
      return '1 ${_i18n()["minuteAgo"]}';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} ${_i18n()["secondsAgo"]}';
    } else {
      return '${_i18n()["now"]}';
    }
  }
}

String convertToAmPm(int hours, int minutes) {
  String minutesFormattedString;
  String hoursFormattedString;
  String formattedString;
  if (minutes < 10) {
    minutesFormattedString = "0$minutes";
  } else {
    minutesFormattedString = "$minutes";
  }
  if (hours < 10) {
    hoursFormattedString = "0$hours";
  } else {
    hoursFormattedString = "$hours";
  }
  if (hours < 12) {
    formattedString =
        "${hours.toString().padLeft(2, "0")}:$minutesFormattedString AM";
  } else if (hours == 12) {
    formattedString =
        "${(hours).toString().padLeft(2, "0")}:$minutesFormattedString PM";
  } else {
    formattedString =
        "${(hours - 12).toString().padLeft(2, "0")}:$minutesFormattedString PM";
  }
  return formattedString;
}

extension timeHelper on int {
  String convertHoursToAmPm() {
    String formattedString;

    if (this <= 12) {
      formattedString = "$this";
    } else {
      formattedString = "${this - 12}";
    }
    if (this < 0) {
      return "0$formattedString";
    } else {
      return formattedString;
    }
  }

  String convertToMinutes() {
    if (this < 10) {
      return "0$this";
    } else {
      return "$this";
    }
  }

  int toAmPmInt() {
    if (this <= 12) {
      return this;
    } else {
      return this - 12;
    }
  }
}
