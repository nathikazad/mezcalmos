import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';

//
dynamic _18n() => Get.find<LanguageController>().strings["Shared"]["helpers"]
    ["DateTimeHelper"];

// This helper will do the calculataion and return the differnce
// between the current time and the passed date time
// wit will alse do the needed format on the string
//
extension parseDateTime on DateTime {
  String getEstimatedTime() {
    final String langCode =
        Get.find<LanguageController>().userLanguageKey.toLanguageCode();
    initializeDateFormatting(langCode, null);

    final DateTime cDate = DateTime.now();
    // mezDbgPrint(cDate.difference(toLocal()).inHours);
    if (cDate.difference(toLocal()).inDays < 0) {
      return "${_18n()["in"]} ${DateFormat().add_EEEE().add_d().add_MMM().add_jm().format(toLocal())}";
    } else if (cDate.difference(toLocal()).inHours < 0) {
      return "${_18n()["at"]} ${DateFormat("hh:mm a").format(toLocal())}";
    } else {
      return "${_18n()["in"]} ${cDate.difference(toLocal()).inMinutes} min";
    }
  }

  String toDayAmPm() {
    return DateFormat("EEE, hh:mm a").format(this);
  }
}
