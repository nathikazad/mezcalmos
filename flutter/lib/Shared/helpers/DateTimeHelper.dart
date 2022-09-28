import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["helpers"]
    ["DateTimeHelper"];

extension DurationParser on Duration {
  String _padZeros(int n) => n.toString().padLeft(2, "0");

  String ParseToHoursMinutes() {
    final String twoDigitMinutes = _padZeros(inMinutes.remainder(60));
    return "${_padZeros(inHours)}:$twoDigitMinutes";
  }
}

// This helper will do the calculataion and return the differnce
// between the current time and the passed date time
// wit will alse do the needed format on the string

extension parseDateTime on DateTime {
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
      return " ${formatMonth.format(toLocal())}, ${_i18n()["at"]} ${formatTime.format(toLocal())}";
    } else if (DateTime(toLocal().year, toLocal().month, toLocal().day)
            .difference(DateTime(now.year, now.month, now.day))
            .inDays
            .abs() >
        0) {
      return "${_i18n()["tomorrow"]}, ${DateFormat("hh:mm a").format(toLocal())}";
    } else if (now.difference(toLocal()).inHours.abs() > 0) {
      return "${_i18n()["at"]} ${DateFormat("hh:mm a").format(toLocal())}";
    } else {
      return " ${_i18n()["in"]} ${now.difference(toLocal()).inMinutes.abs()} min";
    }
  }

  String getOrderTime() {
    final DateTime cDate = DateTime.now();
    final String userLangCode =
        Get.find<LanguageController>().userLanguageKey.toLanguageCode();
    final DateFormat formatLongDay = DateFormat.MMMd(userLangCode);
    final DateFormat formatDay = DateFormat.E(userLangCode);

    if (cDate.difference(toLocal()).inDays < 7) {
      return "${formatDay.format(toLocal()).replaceFirst(".", "")}, ${DateFormat("hh:mm a").format(toLocal())}";
    } else {
      return "${formatLongDay.format(toLocal())} ${DateFormat("hh:mm a").format(toLocal())}";
    }
  }

  String toDayAmPm() {
    final String userLangCode =
        Get.find<LanguageController>().userLanguageKey.toLanguageCode();
    final DateFormat formatTime = DateFormat.jm(userLangCode);
    final DateFormat formatDay = DateFormat.E(userLangCode);

    return "${formatDay.format(toLocal()).replaceFirst(".", "").inCaps}, ${DateFormat("hh:mm a").format(toLocal())}";
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
  if (hours <= 12) {
    formattedString = "$hours:$minutesFormattedString AM";
  } else {
    formattedString = "${hours - 12}:$minutesFormattedString PM";
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
}
