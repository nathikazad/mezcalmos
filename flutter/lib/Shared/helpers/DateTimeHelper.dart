import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';

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
    final DateTime cDate = DateTime.now();

    final String userLangCode =
        Get.find<LanguageController>().userLanguageKey.toLanguageCode();

    final DateFormat formatTime = DateFormat.jm(userLangCode);
    final DateFormat formatMonth = DateFormat.MMMMEEEEd(userLangCode);

    if (cDate.difference(toLocal()).inDays < 0) {
      return "${_i18n()["in"]} ${formatMonth.format(toLocal())} ${formatTime.format(toLocal())}";
    } else if (cDate.difference(toLocal()).inHours < 0) {
      return "${_i18n()["at"]} ${DateFormat("hh:mm a").format(toLocal())}";
    } else {
      return "${_i18n()["in"]} ${cDate.difference(toLocal()).inMinutes.abs()} min";
    }
  }

  String getOrderTime() {
    final DateTime cDate = DateTime.now();
    final String userLangCode =
        Get.find<LanguageController>().userLanguageKey.toLanguageCode();
    final DateFormat formatLongDay = DateFormat.MMMd(userLangCode);
    final DateFormat formatDay = DateFormat.E(userLangCode);

    if (cDate.difference(toLocal()).inDays < 7) {
      return "${formatDay.format(toLocal())} ${DateFormat("hh:mm a").format(toLocal())}";
    } else {
      return "${formatLongDay.format(toLocal())} ${DateFormat("hh:mm a").format(toLocal())}";
    }
  }

  String toDayAmPm() {
    final String userLangCode =
        Get.find<LanguageController>().userLanguageKey.toLanguageCode();
    final DateFormat formatTime = DateFormat.jm(userLangCode);
    final DateFormat formatDay = DateFormat.E(userLangCode);

    return "${formatDay.format(toLocal())} ${formatTime.format(toLocal())}";
  }
}
